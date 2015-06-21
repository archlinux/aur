# Maintainer: revel <revelΘmuub·net>
# Contributor: shild <sxp@bk.ru>

pkgname=edb-debugger
pkgver=0.9.20
pkgrel=1
pkgdesc="EDB (Evan's Debugger) is a QT4 based binary mode debugger with the goal of having usability on par with OllyDbg."
arch=('i686' 'x86_64')
url='http://www.codef00.com/projects#debugger'
license=('GPL2')
depends=('qt4>=4.6')
makedepends=('boost>=1.35.0')
install=edb.install
source=("http://www.codef00.com/projects/debugger-$pkgver.tgz"
        'edb.desktop')
md5sums=('5916d415f598fae8632dd763f58e11d1'
         '8844cd95efef848f8f4a444259491961')
sha256sums=('fd4ebdf8a30ace88395b7b61407fd264cb3919d97368d4932201f0fed6b7ef4d'
            'af1d0eae06544fbca7a9af2e2f55dc472324abf28402652e88d3b62c1882a132')

build() {
  cd "debugger"

  qmake-qt4 -makefile DEFAULT_PLUGIN_PATH="/usr/lib/edb/"
  make
}

package() {
  cd "debugger"

  # install to pkg dir
  make INSTALL_ROOT="$pkgdir/usr/" install

  # correct /usr/lib64 -> /usr/lib on x86_64
  [ "$CARCH" = "x86_64" ] && (mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib")

  # icons
  install -Dm644 src/images/edb48-logo.png "$pkgdir/usr/share/pixmaps/edb.png"
  install -Dm644 src/images/edb48-logo.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/edb.png"

  # install desktop file
  cd ..
  install -Dm644 edb.desktop "$pkgdir/usr/share/applications/edb.desktop"
}
