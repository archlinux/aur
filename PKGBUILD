# Maintainer: Nikola Milinković <nikmil@gmail.com>

pkgname=sni-qt-eplus-bzr
_pkgname=sni-qt-eplus
pkgver=r101
pkgrel=1
epoch=1
pkgdesc='Qt4 plugin which turns all QSystemTrayIcon into StatusNotifierItems. Elementary+ version, from bzr.'
arch=('i686' 'x86_64')
url='https://launchpad.net/~cybre/+archive/ubuntu/sni-qt-eplus'
license=('LGPL3')
depends=('libdbusmenu-qt4')
makedepends=('cmake' 'bzr')
backup=('etc/xdg/sni-qt.conf')
provides=('sni-qt-eplus' 'sni-qt')
conflicts=('sni-qt-eplus' 'sni-qt')
source=("$_pkgname::bzr+lp:sni-qt"
	'custom-icons-injection.patch'
        'sni-qt.conf')
md5sums=('SKIP'
         'bad3243c40a84a49b77803630b88b89e'
         '5b3fc74b8b7a6b99975312d0411960ed')

pkgver() {
  cd $_pkgname
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd "$srcdir"
  mkdir build
  cd "$srcdir"/"$_pkgname"
  patch -p1 -i "$srcdir"/custom-icons-injection.patch
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
  install -Dm644 "${srcdir}/sni-qt.conf" "${pkgdir}/etc/xdg/sni-qt.conf"
}
