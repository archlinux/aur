pkgname=darknet-hankai-git
pkgver=4.0
pkgrel=1
pkgdesc="Darknet: neural network framework for object detection"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/hank-ai/darknet"
license=('Apache-2.0')
depends=('opencv')
makedepends=('cmake' 'git')
optdepends=(
  'cuda'
  'cudnn'
  'rocm-opencl-runtime'
  'rocm-hip-runtime'
  'rocm-hip-sdk'
)
source=("git+https://github.com/hank-ai/darknet.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/darknet" || return 1
  git fetch --tags
  git describe --tags --abbrev=0 | sed 's/^v//'
}

prepare() {
  cd "$srcdir/darknet"
  mkdir -p build
}

build() {
  cd "$srcdir/darknet/build"
  
  if [[ "$(uname -m)" == "aarch64" ]]; then
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          ..
  else
    if lspci | grep -i nvidia > /dev/null; then
      cmake -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda \
            ..
    elif lspci | grep -i amd > /dev/null; then
      cmake -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DROCM_PATH=/opt/rocm \
            ..
    else
      cmake -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX=/usr \
            ..
    fi
  fi
  
  make -j"$(nproc)"
}

package() {
  cd "$srcdir/darknet/build"
  make DESTDIR="$pkgdir" install
}
