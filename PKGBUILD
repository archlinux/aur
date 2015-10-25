# Maintainer: Nikola Milinković <nikmil@gmail.com>

pkgname=lib32-sni-qt-eplus-bzr
_pkgname=sni-qt-eplus
pkgver=r101
pkgrel=1
epoch=1
pkgdesc='Qt4 plugin which turns all QSystemTrayIcon into StatusNotifierItems. Elementary+ version, from bzr.'
arch=('x86_64')
url='https://launchpad.net/~cybre/+archive/ubuntu/sni-qt-eplus'
license=('LGPL3')
depends=('sni-qt-eplus' 'lib32-libdbusmenu-qt' 'lib32-qt4')
makedepends=('cmake' 'bzr' 'gcc-multilib')
provides=('lib32-sni-qt-eplus' 'lib32-sni-qt')
conflicts=('lib32-sni-qt-eplus' 'lib32-sni-qt')
source=("$_pkgname::bzr+lp:sni-qt"
        'custom-icons-injection.patch')
md5sums=('SKIP'
         'bad3243c40a84a49b77803630b88b89e')

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
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  export CFLAGS="$(pkg-config --cflags QtCore) ${CFLAGS}"
  export CXXFLAGS="$(pkg-config --cflags QtCore) ${CXXFLAGS}"
  
  cd "$srcdir"/build
  
  cmake ../$_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DQT_PLUGINS_DIR=/usr/lib32/qt/plugins
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
