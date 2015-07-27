# Maintainer: Nikola Milinković <nikmil@gmail.com>

pkgname=sni-qt-eplus-bzr
_pkgname=sni-qt-eplus
pkgver=78
pkgrel=1
pkgdesc='Qt4 plugin which turns all QSystemTrayIcon into StatusNotifierItems. Elementary+ version, from bzr.'
arch=('i686' 'x86_64')
url='https://launchpad.net/~cybre/+archive/ubuntu/sni-qt-eplus'
license=('LGPL3')
depends=('libdbusmenu-qt4')
makedepends=('cmake' 'bzr')
backup=('etc/sni-qt.conf')
provides=('sni-qt-eplus')
conflicts=('sni-qt-eplus')
source=("$_pkgname::bzr+lp:~cybre/elementary+/sni-qt-patched"
        'sni-qt.conf')
md5sums=('SKIP'
         '5b3fc74b8b7a6b99975312d0411960ed')

pkgver() {
  cd $_pkgname
  echo "$(bzr revno)"
}

prepare() {
  cd "$srcdir"
  mkdir build

  # Disable building tests
  sed -i '/tests/ d' $_pkgname/CMakeLists.txt
}

build() {
  cd "$srcdir"/build
  cmake ../$_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  # Install config file for apps that need "Activate" action
  install -Dm644 "${srcdir}/sni-qt.conf" "${pkgdir}/etc/sni-qt.conf"
}
