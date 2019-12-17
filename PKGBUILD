# Maintainer: revel <revelΘmuub·net>
# Contributor: shild <sxp@bk.ru>
# Contributor: m4tx <m4tx@m4tx.p>

pkgname=edb-debugger
pkgver=1.1.0
pkgrel=2
pkgdesc="EDB (Evan's Debugger) is a cross platform AArch32/x86/x86-64 debugger, inspired by Ollydbg."
arch=('i686' 'x86_64')
url='http://www.codef00.com/projects#debugger'
license=('GPL2')
depends=('qt5-xmlpatterns' 'qt5-svg' 'capstone>=3.0')
makedepends=('boost>=1.35.0' 'cmake')
optdepends=('graphviz')
source=("https://github.com/eteran/edb-debugger/releases/download/$pkgver/edb-debugger-$pkgver.tgz"
        'edb.desktop'
        'plugin_path.patch')
sha256sums=('f13de8fd3f26fa1210fb0ff50ff756c2de8de51e75770a57aca35df06d6a0187'
            'f3e725642c6b87d5a7fd25331a9560d4f9803c22566875b722bc27e275f311a6'
            'f216174d68ef7c26f29a58e409261c5b36af6593fe1778f6b2ad284095662b10')

prepare() {
  cd "edb-debugger"
  patch -p1 -i ../plugin_path.patch
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
  install -Dm644 src/images/edb48-logo.png "$pkgdir/usr/share/pixmaps/edb.png"
  install -Dm644 src/images/edb48-logo.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/edb.png"

  # install desktop file
  cd ..
  install -Dm644 edb.desktop "$pkgdir/usr/share/applications/edb.desktop"
}

