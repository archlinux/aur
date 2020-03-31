# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=rocm-bandwidth-test
pkgver=3.1.0
pkgrel=2
pkgdesc="Bandwidth test for ROCm"
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/rocm_bandwidth_test"
license=('custom:NCSAOSL')
depends=("hsa-rocr>=$pkgver" )
makedepends=('cmake')
options=(!staticlibs strip)
source=("rocm_bandwidth_test-roc-$pkgver.tar.gz::https://github.com/RadeonOpenCompute/rocm_bandwidth_test/archive/roc-$pkgver.tar.gz")
sha256sums=('9a7522791450b118c8692685c494aacebf6287f4b01badca8ea93421bd32bd87')

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm/rocm_bandwidth_test \
        "$srcdir/rocm_bandwidth_test-roc-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  # add links
  install -d "$pkgdir/usr/bin"
  local _fn
  for _fn in rocm_bandwidth_test; do
    ln -s "/opt/rocm/rocm_bandwidth_test/bin/$_fn" "$pkgdir/usr/bin/$_fn"
  done
}
