# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Askhat Bakarov <sirocco{at}ngs{dot}ru>

pkgname=android-file-transfer-git
pkgver=4.5.r1.gd5c1882
pkgrel=2
pkgdesc="An interactive MTP client implemented in C++ using Qt toolkit"
arch=(x86_64 i686)
url="https://github.com/whoozle/android-file-transfer-linux"
license=(LGPL-2.1-or-later)
depends=(qt6-base fuse3 hicolor-icon-theme taglib)
makedepends=(cmake git qt6-tools ninja)
provides=(android-file-transfer)
conflicts=(android-file-transfer android-file-transfer-linux)
source=("git+https://github.com/whoozle/android-file-transfer-linux.git")
sha256sums=('SKIP')

pkgver() {
  cd "android-file-transfer-linux"
  git describe --long --tags --exclude continuous | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "android-file-transfer-linux" -Wno-dev \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -ffat-lto-objects"

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
