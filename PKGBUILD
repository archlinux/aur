# Maintainer: Will Handley <wh260@cam.ac.uk>
# Contributor: SteamedFish <steamedfish@hotmail.com>
pkgname=python-nemo-toolkit
pkgver=2.7.3
pkgrel=4
pkgdesc="NeMo - a toolkit for Conversational AI and Speech/NLP processing by NVIDIA"
arch=(any)
url="https://github.com/nvidia/nemo"
license=(Apache-2.0)
depends=(python python-numpy python-pytorch python-tqdm python-scikit-learn python-protobuf python-huggingface-hub python-fsspec python-onnx python-numexpr python-dateutil python-ruamel-yaml python-setuptools tensorboard python-wrapt wget python-pytest python-datasets python-onnxruntime python-sentencepiece python-websockets python-h5py python-tiktoken python-soundfile python-psutil python-torchaudio python-librosa python-einops python-torchvision)
optdepends=("python-numba: GPU/CPU acceleration" "python-text-unidecode: text normalization utilities" "python-transformers: NLP models (core extra)" "python-hydra-core: config management (core extra)" "python-omegaconf: structured config (core extra)" "python-torchmetrics: metrics tracking (AUR: python-torchmetrics)" "python-webdataset: streaming dataset support (AUR: python-webdataset)" "python-lightning>=2.6.6: Lightning-based collections such as ASR")
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/e2/30/c385006f44cf6267592c38e16e9d84aa4770a39d55f347d9d8fcc6ee1df5/nemo_toolkit-${pkgver}.tar.gz"
        "nemo-lightning-2.6.patch")
sha256sums=('083240dd24b7534eeb6da5b3bc88fa930da625b2a6a8c071c23fb16919783224'
            '82aa8751a127dc1a99eb5d31eee9d2ad99ddb94a8a2c68d4941b4dbca12eb93b')

prepare() {
  cd "nemo_toolkit-${pkgver}"
  # Lightning 2.6 support backported from upstream NVIDIA-NeMo/NeMo@8bc3920bdd
  # (runtime files only; DistributedCheckpointIO kept for 2.7.3's Megatron code).
  patch -Np1 -i "${srcdir}/nemo-lightning-2.6.patch"
}

build() {
  cd "nemo_toolkit-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "nemo_toolkit-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
