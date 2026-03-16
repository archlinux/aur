# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=whisperlivekit
_pyname=WhisperLiveKit
pkgver=0.2.20
pkgrel=1
pkgdesc='Real-time speech-to-text with speaker diarization using Whisper'
arch=('x86_64')
url='https://github.com/QuentinFuxa/WhisperLiveKit'
license=('Apache-2.0')

depends=(
  python
  python-fastapi
  python-librosa
  python-soundfile
  uvicorn
  python-websockets
  python-huggingface-hub
  python-faster-whisper
  python-pytorch
  python-torchaudio
  python-tqdm
  python-tiktoken
  python-safetensors
  ffmpeg
)

makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)

optdepends=(
  # GPU acceleration (available in official repos)
  'python-pytorch-cuda: GPU acceleration with NVIDIA CUDA'
  'python-pytorch-rocm: GPU acceleration with AMD ROCm'
  'python-pytorch-opt-cuda: Optimized GPU acceleration with NVIDIA CUDA'
  'python-pytorch-opt-rocm: Optimized GPU acceleration with AMD ROCm'
  'cuda: NVIDIA CUDA toolkit'
  'rocm-core: AMD ROCm platform'
  # [voxtral-hf] Voxtral via HuggingFace transformers
  'python-transformers: Voxtral-HF streaming support (voxtral-hf extra)'
  'python-accelerate: Accelerated inference for Voxtral-HF (voxtral-hf extra)'
  'python-mistral-common: Voxtral-HF audio tokenizer (voxtral-hf extra, AUR)'
  # [diarization-sortformer] Speaker diarization via NeMo (SOTA 2025, Python 3.10-3.12)
  'python-nemo-toolkit: Advanced speaker diarization (diarization-sortformer extra, AUR)'
  # [diarization-diart] Speaker diarization via diart (not recommended, conflicts with CUDA 12.9)
  'python-diart: Real-time speaker diarization (diarization-diart extra, AUR)'
  # [sentence_tokenizer] Sentence-level audio buffer trimming
  'python-mosestokenizer: Sentence tokenizer for buffer trimming (sentence_tokenizer extra, AUR)'
  'python-wtpsplit: Segment-then-tokenize sentence splitter (sentence_tokenizer extra, AUR)'
  # [translation] Multi-language translation (200 languages via NLLB)
  'python-nllw: NLLB-based translation support (translation extra, AUR)'
  # [listen] Microphone input for wlk CLI
  'python-sounddevice: Microphone input for wlk CLI (listen extra, AUR)'
  # [openai] OpenAI-compatible API backend
  'python-openai: OpenAI-compatible transcription backend'
  # [test] Test suite
  'python-pytest: Run test suite (test extra)'
)

backup=()

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "whisperlivekit.service"
  "whisperlivekit.sysusers"
  "whisperlivekit.tmpfiles"
  "fix-ctranslate2-runtimeerror.patch"
)
sha256sums=('6e5d9b6d554f822a63ee69b701f9430188c7fc3c3ffbd4ac467ac9d1934ac84c'
            'aedba057513ec5e527c0ff677691e165d3c8fd4c9a6aa604e6350f4ccedaa30b'
            'e936f54d000a6f34fa727c990f4110c62709ed4d03a65e5d50ddebca08c4b3fb'
            'd2f966dc3213128bf66c94280e8156e566f999af182d0bcbefd0ef3fb541602b'
            '4edbff7912870622a396804e1ca98ab0fa967414283484329c9fb36dd87ac684')

build() {
  cd "$_pyname-$pkgver"
  # Fix ctranslate2 RuntimeError with PyTorch 2.10+ (upstream bug, not yet fixed)
  patch -p1 < "$srcdir/fix-ctranslate2-runtimeerror.patch"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install license
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  # Install documentation
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  # Install systemd service
  install -Dm644 "$srcdir/whisperlivekit.service" \
    "$pkgdir/usr/lib/systemd/system/whisperlivekit.service"

  # Install sysusers.d: creates the dedicated whisperlivekit system user on install.
  # A static user is required because DynamicUser bind-mounts CacheDirectory with
  # MS_NOEXEC, preventing dlopen() of Triton JIT-compiled .so files.
  install -Dm644 "$srcdir/whisperlivekit.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/whisperlivekit.conf"

  # Install tmpfiles.d: creates and owns /var/lib and /var/cache directories.
  # Cannot use install -o/-g at build time (user doesn't exist on build host).
  install -Dm644 "$srcdir/whisperlivekit.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/whisperlivekit.conf"
}
