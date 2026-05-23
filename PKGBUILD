pkgname=python-vllm-omni-git
_pkgname=vllm-omni
pkgver=0.20.0.r171.ge7644da
pkgrel=1
pkgdesc='A framework for efficient model inference with omni-modality models'
arch=('any')
url='https://github.com/vllm-project/vllm-omni'
license=(Apache-2.0)
depends=(
  python-aenum
  python-diffusers
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

conflicts=('python-vllm-omni')
provides=('python-vllm-omni')

source=('git+https://github.com/vllm-project/vllm-omni.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

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

