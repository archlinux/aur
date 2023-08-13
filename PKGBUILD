# Maintainer: revel <revelΘmuub·net>
# Contributor: shild <sxp@bk.ru>
# Contributor: m4tx <m4tx@m4tx.p>

pkgname=edb-debugger
pkgver=1.4.0
pkgrel=1
pkgdesc="EDB (Evan's Debugger) is a cross platform AArch32/x86/x86-64 debugger, inspired by Ollydbg."
arch=('i686' 'x86_64')
url='http://www.codef00.com/projects#debugger'
license=('GPL2')
depends=('qt5-xmlpatterns>=5.9' 'qt5-svg>=5.9' 'capstone>=3.0')
makedepends=('cmake')
optdepends=('graphviz>=2.38.0')
source=("https://github.com/eteran/edb-debugger/releases/download/$pkgver/edb-debugger-$pkgver.tgz"
        'edb.desktop')
sha256sums=('0eb2c5d17493ab0e7e0a0748eefa5733ec90329631cc8db87f2943e90f91b726'
            'f3e725642c6b87d5a7fd25331a9560d4f9803c22566875b722bc27e275f311a6')

prepare() {
  cd "edb-debugger"
}

build() {
  cd "edb-debugger"
  [ ! -d build ] && mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -DDEFAULT_PLUGIN_PATH="/usr/lib/edb/" ..
  make
}

package() {
  cd "edb-debugger"
  cd build

  # install to pkg dir
  make install

  # correct /usr/lib64 -> /usr/lib on x86_64
#  [ "$CARCH" = "x86_64" ] && (mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib")

  # icons
  cd ..
  install -Dm644 src/res/images/edb48-logo.png "$pkgdir/usr/share/pixmaps/edb.png"
  install -Dm644 src/res/images/edb48-logo.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/edb.png"

  # install desktop file
  cd ..
  install -Dm644 edb.desktop "$pkgdir/usr/share/applications/edb.desktop"
}

