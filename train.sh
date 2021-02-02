#!/usr/bin/bash

stage=0
stop_stage=1

wav_dir=/tzy/_corpus/aishell/wav/train
wav_type=wav
valid_percent=0.01

dir=/fairseq/exp_aishell

if [ $stage -le 0 ] && [ 0 -ge $stage ]; then
    python3 examples/wav2vec/wav2vec_manifest.py \
        $wav_dir \
        --dest $dir \
        --ext $wav_type \
        --valid-percent $valid_percent
fi

if [ $stage -le 1 ] && [ 1 -ge $stage ]; then
    fairseq-hydra-train \
        task.data=$dir \
        --config-dir examples/wav2vec/config/pretraining \
        --config-name wav2vec2_base_librispeech
fi
