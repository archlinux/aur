pkgname=python-vllm-omni
_pkgname=vllm-omni
pkgver=0.20.0rc1
pkgrel=1
pkgdesc="A framework for efficient model inference with omni-modality models "
arch=('any')
url='https://github.com/vllm-project/vllm-omni'
license=(Apache-2.0)
depends=(
  python-aenum
  python-janus
  python-omegaconf
  python-pydub
  python-python-multipart
  python-torchaudio
  python-vllm
  python-x-transformers
)
makedepends=(
  git
  python-setuptools
  python-setuptools-scm
  python-build
  python-installer
)

optdepends=(
  'python-vllm-rocm: For ROCm'
  'onnxruntime-rocm: For ROCm'
  'python-torchaudio-rocm: For ROCm'
)


source=("git+https://github.com/vllm-project/vllm-omni.git#tag=v${pkgver}")
sha256sums=('231461443d4adf32deafc868a3077e5b32e6308662422b2aede43dd4be00320a')

prepare() {
  cd "$srcdir/$_pkgname"
  rm -f "dist"/*

  sed -i 's/"setuptools>=\([0-9.]\+\).*/"setuptools>=\1",/g' pyproject.toml
  sed -i '/^\s*uninstall_onnxruntime()/d' setup.py
}

build() {
  cd "$srcdir/$_pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  rm -f "${pkgdir}/usr/bin/vllm"
}

