pkgname=lib32-sni-qt-patched-git
_pkgname=sni-qt
pkgver=r.
pkgrel=1
pkgdesc='Qt4 plugin which turns all QSystemTrayIcon into StatusNotifierItems. Hardcode-Tray version'
arch=('x86_64')
url='https://github.com/bil-elmoussaoui/sni-qt'
license=('LGPL3')
backup=('etc/xdg/sni-qt.conf')
depends=('sni-qt-patched-git' 'lib32-libdbusmenu-qt' 'lib32-qt4')
makedepends=('cmake' 'bzr' 'gcc-multilib')
provides=('lib32-sni-qt' 'lib32-sni-qt')
conflicts=('lib32-sni-qt-eplus' 'lib32-sni-qt')
source=("git://github.com/bil-elmoussaoui/sni-qt.git")
md5sums=('SKIP')

prepare() {
  cd "$srcdir"
  if [ -d "build" ]; then
    rm -rf build
  fi
  mkdir build
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