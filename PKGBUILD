# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=sni-qt, repo=utopic

pkgname=lib32-sni-qt
pkgver=0.2.6
pkgrel=6
pkgdesc="A Qt plugin which turns all QSystemTrayIcon into StatusNotifierItems (appindicators) (32-bit)"
arch=(x86_64)
url="https://launchpad.net/sni-qt"
license=(GPL)
depends=(sni-qt lib32-libdbusmenu-qt lib32-qt4)
makedepends=(cmake gcc-multilib)
source=("http://launchpad.net/sni-qt/trunk/${pkgver}/+download/sni-qt-${pkgver}.tar.bz2"{,.asc})
validpgpkeys=(45C43F82329D77F384214CCABEED35A5EEE34473)
md5sums=('e84c66e776f7c22c961817387f618c81'
         'SKIP')

build() {
  cd "sni-qt-${pkgver}"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  # XXX: Use the correct qconfig.h. This is probably not optimal, but it seems
  # to work well enough.
  export CFLAGS="$(pkg-config --cflags QtCore) ${CFLAGS}"
  export CXXFLAGS="$(pkg-config --cflags QtCore) ${CXXFLAGS}"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DQT_PLUGINS_DIR=/usr/lib32/qt/plugins

  make
}

package() {
  cd "sni-qt-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
