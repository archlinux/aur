# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=python-pywhispercpp-cuda
pkgver=1.4.0
pkgrel=3
pkgdesc="Python bindings for whisper.cpp with CUDA support (NVIDIA GPU)"
arch=('x86_64')
url="https://github.com/Absadiki/pywhispercpp"
license=('MIT')
depends=(
  'python'
  'python-numpy'
  'cuda'
)
makedepends=(
  'cmake'
  'ninja'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-setuptools-scm'
  'python-repairwheel'
  'git'
  'cuda'
)
provides=('python-pywhispercpp')
conflicts=('python-pywhispercpp' 'python-pywhispercpp-cpu' 'python-pywhispercpp-rocm')
source=("git+https://github.com/Absadiki/pywhispercpp.git#commit=4ab96165f84e8eb579077dfc3d0476fa5606affe")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/pywhispercpp"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/pywhispercpp"
  # Set CUDA environment variables for GPU acceleration
  export GGML_CUDA=ON
  export PATH="/opt/cuda/bin:$PATH"
  export CUDACXX="${CUDACXX:-/opt/cuda/bin/nvcc}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/pywhispercpp"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

