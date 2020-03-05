# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.6.4
pkgrel=2
pkgdesc="Desktop client for the Matrix protocol"
arch=('x86_64' 'i686')
url="https://github.com/Nheko-Reborn/nheko"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-svg' 'hicolor-icon-theme' 'lmdb' 'cmark' 'mtxclient' 'spdlog')
makedepends=('cmake' 'boost' 'qt5-tools' 'nlohmann-json' 'lmdbxx' 'tweeny')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nheko-Reborn/nheko/archive/v$pkgver.tar.gz"
        "0001-Fix-deprecated-function-call-issues-with-Qt-5.13.patch"
        "spdlog_fix.patch")
sha512sums=('782673a3ae642029307517798e5be96cf0473cd4261af891988a35dfeb5e2e724d2c034407f62addd2e15973d287d11c6590d70cca739c705354cb0151536470'
            'a20e5a3a152a22525bc1a0563f210bc8ed4f4d988342f20e1960b9530fdc0ca90539847719bbc9abf7802a0cd4af99f41b84641cd0bb5881dc1a9d160e224c2e'
            'e0c9992e561d3e8ef3d5bf61032dd48e78b38b4a7db3834aa0703c6a9f0761803e46a9209d440c07fea767be7aa594ed2cbeed1b188f366bf3c9b17da6e2fed3')

prepare() {
  mkdir -p build
  cd $pkgname-$pkgver
  patch -Np1 < ../0001-Fix-deprecated-function-call-issues-with-Qt-5.13.patch
  patch -Np1 < ../spdlog_fix.patch
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  # The compilation takes up a *lot* of RAM (over 10GB with 6 threads)
  # Adjust your MAKEFLAGS in /etc/makepkg.conf or add e.g. a "-j3" flag to the make command
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

