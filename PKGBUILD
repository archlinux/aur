# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributore: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Andrea Scarpino <andrea@archlinux.org>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=libdbusmenu-qt, repo=utopic
# vercheck-launchpad: name=libdbusmenu-qt

pkgname=lib32-libdbusmenu-qt
pkgver=0.9.2
pkgrel=3
pkgdesc="A library that provides a Qt implementation of the DBusMenu spec (32-bit)"
arch=(x86_64)
url="https://launchpad.net/libdbusmenu-qt"
license=(GPL)
depends=(lib32-qt4)
makedepends=(cmake gcc-multilib lib32-qjson)
source=("http://launchpad.net/libdbusmenu-qt/trunk/${pkgver}/+download/libdbusmenu-qt-${pkgver}.tar.bz2"{,.asc})
validpgpkeys=(45C43F82329D77F384214CCABEED35A5EEE34473)
md5sums=('9a49484927669cd2ec91b3bf9ba8b79e'
         'SKIP')

build() {
  cd "libdbusmenu-qt-${pkgver}"

  export CC="gcc -m32"
  export CXX="g++ -m32"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_SUFFIX=32 \
    -DWITH_DOC=OFF

  make
}

package() {
  cd "libdbusmenu-qt-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}/usr/include/"

  sed -i '/^libdir/s/\(\/lib\)/\132/g' "${pkgdir}/usr/lib32/pkgconfig/dbusmenu-qt.pc"
}
