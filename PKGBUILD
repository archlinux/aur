# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-speechbrain
_pkgname=speechbrain
pkgver=1.1.1
pkgrel=1
pkgdesc="All-in-one speech toolkit in pure Python and Pytorch"
arch=('any')
url="https://github.com/speechbrain/speechbrain"
license=('Apache-2.0')
depends=(
    'python'
    'python-hyperpyyaml'
    'python-joblib'
    'python-numpy'
    'python-packaging'
    'python-requests'
    'python-scipy'
    'python-sentencepiece'
    'python-soundfile'
    'python-pytorch'
    'python-torchaudio'
    'python-tqdm'
    'python-huggingface-hub'
    'python-yaml'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-numba'
    'python-pandas'
    'python-pytest'
    'python-scikit-learn'
    'python-transformers'
    'sox'
)
optdepends=(
    'python-transformers: for Hugging Face model integration'
    'python-pandas: for data manipulation utilities'
    'python-numba: for the CUDA transducer loss integration'
    'python-scikit-learn: for clustering and diarization integrations'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/speechbrain/speechbrain/archive/refs/tags/v$pkgver.tar.gz"
    'pytorch-2.11-compat.patch'
    'pytest-fork-runner.py'
    'hyperpyyaml-loader.patch'
)
sha256sums=(
    'ad8b3fc3a00bcf1b7302ec12601534fd5287b2471e96a3226a39a23066bf3d5f'
    'e6a924bb235ef41f791f302d7b5d8829bbe91c52324287493905e7b1268daf68'
    '5ba5f4a3979ad43c116adb531356c878f5a19beb1b3ee67af0024991ede2e17e'
    '001c592042bd4ecf596dd6893844ea451cb90fe29342a49ac0fa98974cb15f6e'
)

prepare() {
    cd "$_pkgname-$pkgver"
    patch -Np1 -i "$srcdir/pytorch-2.11-compat.patch"
    patch -Np1 --fuzz=0 -i "$srcdir/hyperpyyaml-loader.patch"
    # Limit namespace discovery before building so wheel RECORD stays accurate.
    sed -i '/^\[tool.setuptools.packages.find\]$/a include = ["speechbrain*"]' pyproject.toml
    sed -i 's/^exclude = \["tests", "tests\.\*"\]$/exclude = ["tests", "tests.*", "speechbrain.integrations.tests*"]/' pyproject.toml
    # Integration examples must use the same public compatibility entry point
    # as inference, not HyperPyYAML's broken default ruamel.yaml loader.
    find tests/integration -name '*.py' -exec sed -i \
        's/^from hyperpyyaml import load_hyperpyyaml$/from speechbrain.utils.hparams import load_hyperpyyaml/' {} +
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    local _site
    _site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
    rm -rf "$srcdir/_check"
    python -m installer --destdir="$srcdir/_check" dist/*.whl

    export CUDA_VISIBLE_DEVICES=''
    export OMP_NUM_THREADS=2 MKL_NUM_THREADS=2 OPENBLAS_NUM_THREADS=2
    # The staged wheel stays first so the checkout cannot shadow it. The source
    # root remains importable for spawn workers unpickling tests.* callables.
    export PYTHONPATH="$srcdir/_check$_site:$PWD"
    export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
    export TMPDIR="$srcdir/_pytest-tmp"
    rm -rf "$TMPDIR"
    install -d "$TMPDIR"

    # Match the four upstream CI gates. Importlib mode keeps the unpacked
    # source tree from shadowing the wheel staged above. Use a real runner file
    # so torch.multiprocessing.spawn can re-import __main__ in child processes.
    python "$srcdir/pytest-fork-runner.py" -ra \
        --basetemp="$TMPDIR/consistency" \
        --import-mode=importlib tests/consistency
    python "$srcdir/pytest-fork-runner.py" -ra \
        --basetemp="$TMPDIR/unittests" \
        --import-mode=importlib tests/unittests
    # Match tests/.run-doctests.sh: optional integration modules have separate
    # dependency-heavy CI and are deliberately excluded by upstream here.
    local -a _doctests
    mapfile -t _doctests < <(
        find "$srcdir/_check$_site/speechbrain" -type f -name '*.py' \
            | grep -Ev '/integrations/|/(transducer_loss|bleu|ctc_segmentation|check_url|fairseq_wav2vec|language_model|speechtokenizer_interface|__init__)\.py$'
    )
    test "${#_doctests[@]}" -gt 0
    python "$srcdir/pytest-fork-runner.py" -ra \
        --basetemp="$TMPDIR/doctests" \
        --import-mode=importlib --doctest-modules "${_doctests[@]}"
    # The two RNN-T examples call SpeechBrain's explicitly CUDA-only Numba
    # transducer loss even when pytest supplies device=cpu. Run every other
    # integration test in this CPU-only validation environment.
    python "$srcdir/pytest-fork-runner.py" -ra \
        --basetemp="$TMPDIR/integration" \
        --import-mode=importlib tests/integration \
        --ignore=tests/integration/ASR_ConformerTransducer_streaming/example_asr_conformertransducer_streaming_experiment.py \
        --ignore=tests/integration/ASR_Transducer/example_asr_transducer_experiment.py

    cd "$srcdir"
    python - <<'PY'
from pathlib import Path

import torch
import speechbrain
from speechbrain.processing.features import DCT, Filterbank, STFT, spectral_magnitude

assert "_check" in str(Path(speechbrain.__file__).resolve())
sample_rate = 16000
t = torch.arange(sample_rate, dtype=torch.float32) / sample_rate
waveform = (0.6 * torch.sin(2 * torch.pi * 440 * t)).unsqueeze(0)
spectrogram = spectral_magnitude(STFT(sample_rate=sample_rate)(waveform))
fbanks = Filterbank(n_mels=40, sample_rate=sample_rate)(spectrogram)
mfcc = DCT(input_size=40, n_out=13)(fbanks)
assert spectrogram.shape[:2] == fbanks.shape[:2] == mfcc.shape[:2]
assert fbanks.shape[-1] == 40 and mfcc.shape[-1] == 13
assert torch.isfinite(mfcc).all()
print({"speechbrain": speechbrain.__version__, "mfcc_shape": tuple(mfcc.shape)})
PY
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
