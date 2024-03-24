# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=bloaty
pkgver=1.1
pkgrel=3
pkgdesc="a size profiler for binaries"
arch=(x86_64)
url="https://github.com/google/bloaty"
license=('Apache-2.0')
depends=(gcc-libs re2 protobuf capstone abseil-cpp)
makedepends=(cmake)
source=(
    "https://github.com/google/bloaty/releases/download/v$pkgver/bloaty-$pkgver.tar.bz2"
    "https://src.fedoraproject.org/rpms/bloaty/raw/rawhide/f/bloaty-1.1-absl.patch")
sha256sums=('a308d8369d5812aba45982e55e7c3db2ea4780b7496a5455792fb3dcba9abd6f'
            '96cc0528f6464b03d0e68060ff2d24c36624c7d3991cee142df8d3d27cefeb51')

prepare() {
    cd "$pkgname-$pkgver"
    # Abseil compatibility patch borrowed from Fedora
    patch -p1 < "../bloaty-1.1-absl.patch"
}

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_EXE_LINKER_FLAGS_RELEASE="$LDFLAGS" -Wno-dev
    make
}

# Not included in the source tarbal, use the git release instead
# check() {
#     cd "$pkgname-$pkgver"
#     make test
# }

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
