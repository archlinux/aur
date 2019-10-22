# Maintainer: revel <revelΘmuub·net>
# Contributor: shild <sxp@bk.ru>
# Contributor: m4tx <m4tx@m4tx.p>

pkgname=edb-debugger
pkgver=1.0.0
pkgrel=3
pkgdesc="EDB (Evan's Debugger) is a Qt5 based binary mode debugger with the goal of having usability on par with OllyDbg."
arch=('i686' 'x86_64')
url='http://www.codef00.com/projects#debugger'
license=('GPL2')
depends=('qt5-xmlpatterns' 'qt5-svg' 'capstone>=3.0')
makedepends=('boost>=1.35.0' 'cmake')
optdepends=('graphviz')
source=("https://github.com/eteran/edb-debugger/releases/download/$pkgver/edb-debugger-$pkgver.tgz"
        'edb.desktop'
        'plugin_path.patch'
        'build.patch')
sha256sums=('fab87541042df79ea63254e371d81b84d6b72f78141a6ab92512610ed2b7dfac'
            'e10b1f8ad676fe2037d62bc8600d8564772ad5e603b10a387b7375b878f60ae4'
            '2b769b96d099036fcb606f32e52465ad6594c098d4060c9fb4d76e05d2f42cab'
            '8f849b8469004b8607626b105e723240888fd3bd583dd2110a813cf11894a7ae')

prepare() {
  cd "edb-debugger-$pkgver"
  patch -p1 -i ../plugin_path.patch
  patch -p1 -i ../build.patch
}

build() {
  cd "edb-debugger-$pkgver"
  [ ! -d build ] && mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -DDEFAULT_PLUGIN_PATH="/usr/lib/edb/" ..
  make
}

package() {
  cd "edb-debugger-$pkgver"
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
