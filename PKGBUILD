# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=python-pywhispercpp-rocm
pkgver=1.4.0
pkgrel=3
pkgdesc="Python bindings for whisper.cpp with ROCm support (AMD GPU)"
arch=('x86_64')
url="https://github.com/Absadiki/pywhispercpp"
license=('MIT')
depends=(
  'python'
  'python-numpy'
  'rocm-hip-runtime<7'
)
makedepends=(
  'cmake'
  'ninja'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'git'
  'rocm-hip-sdk<7'
  'rocm-opencl-sdk<7'
)
provides=('python-pywhispercpp')
conflicts=('python-pywhispercpp' 'python-pywhispercpp-cpu' 'python-pywhispercpp-cuda')
source=("git+https://github.com/Absadiki/pywhispercpp.git#commit=4ab96165f84e8eb579077dfc3d0476fa5606affe")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/pywhispercpp"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/pywhispercpp"
  # Set ROCm environment variables for GPU acceleration
  export ROCM_PATH="${ROCM_PATH:-/opt/rocm}"
  export PATH="$ROCM_PATH/bin:$PATH"
  export GGML_HIPBLAS=ON
  export GGML_HIP=ON
  export GGML_ROCM=1
  export CMAKE_PREFIX_PATH="$ROCM_PATH"
  python -m build --wheel
}

package() {
  cd "$srcdir/pywhispercpp"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

