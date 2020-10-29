# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=migraphx
pkgver=3.9.0
pkgrel=1
pkgdesc="AMD's graph optimization engine"
arch=('x86_64')
url="https://rocmsoftwareplatform.github.io/AMDMIGraphX/doc/html/"
license=('MIT')
depends=('rocm-cmake' 'miopen' 'hip' 'protobuf' 'half' 'pybind11')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ROCmSoftwarePlatform/AMDMIGraphX/archive/rocm-$pkgver.tar.gz")
sha256sums=('7649689e06522302c07b39abb88bdcc3d4de18a7559d4f6a9e238e92b2074032')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm/migraphx \
        "$srcdir/AMDMIGraphX-rocm-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  # add links
  install -d "$pkgdir/usr/bin"
  local _fn
  for _fn in migraphx; do
    ln -s "/opt/rocm/migraphx/bin/$_fn" "$pkgdir/usr/bin/$_fn"
  done
}
