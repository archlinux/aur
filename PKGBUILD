# Maintainer: goodroot <hyprwhspr@goodroot.ca>

pkgname=python-pywhispercpp-rocm
pkgver=1.4.0
pkgrel=6
pkgdesc="Python bindings for whisper.cpp with ROCm support (AMD GPU)"
arch=('x86_64')
url="https://github.com/Absadiki/pywhispercpp"
license=('MIT')
options=('!strip')
depends=(
  'python'
  'python-numpy'
  'python-requests'
  'python-tqdm'
  'python-platformdirs'
  'rocm-hip-runtime<7'
)
makedepends=(
  'cmake'
  'ninja'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-setuptools-scm'
  'git'
  'rocm-hip-sdk<7'
  'rocm-opencl-sdk<7'
)
optdepends=(
  'python-sounddevice: run pywhispercpp examples that capture audio'
  'python-webrtcvad: run VAD-based examples'
  'python-pyqt5: run GUI example'
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

