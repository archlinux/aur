# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=rocm-bandwidth-test
pkgver=4.3.0
pkgrel=1
pkgdesc="Bandwidth test for ROCm"
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/rocm_bandwidth_test"
license=('custom:NCSAOSL')
depends=('hsa-rocr')
makedepends=('cmake')
options=(!staticlibs strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/RadeonOpenCompute/rocm_bandwidth_test/archive/rocm-$pkgver.tar.gz"
        'delete_local_array.patch::https://patch-diff.githubusercontent.com/raw/RadeonOpenCompute/rocm_bandwidth_test/pull/74.patch')
sha256sums=('c6eb406cd2836af61dd5987f6b761340a1be20f66a9325f480423d10b9d3ec1b'
            'c13fcff87232d443061a9fc9d0aa151d5fad4921ea7fb98e189ace17a345106d')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"

prepare() {
    cd "$_dirname"
    patch -Np1 -i "$srcdir/delete_local_array.patch"
}

build() {
  cmake -Wno-dev -B build \
        -S "$_dirname" \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install
}
