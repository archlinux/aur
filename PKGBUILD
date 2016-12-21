# Maintainer: revel <revelΘmuub·net>
# Contributor: shild <sxp@bk.ru>

pkgname=edb-debugger
pkgver=0.9.21
pkgrel=2
pkgdesc="EDB (Evan's Debugger) is a QT4 based binary mode debugger with the goal of having usability on par with OllyDbg."
arch=('i686' 'x86_64')
url='http://www.codef00.com/projects#debugger'
license=('GPL2')
depends=('qt5-xmlpatterns' 'capstone>=3.0')
makedepends=('boost>=1.35.0' 'cmake')
optdepends=('graphviz>=2.38.0')
install=edb.install
source=("https://github.com/eteran/edb-debugger/releases/download/$pkgver/edb-debugger-$pkgver.tgz"
        'edb.desktop'
        'plugin_path.patch')
md5sums=('3754a96538b8f881153d26e4bb96e423'
         '8844cd95efef848f8f4a444259491961'
         '76f3b5f5b51301d3334a93bdf54f3819')
sha256sums=('2686619e1288152033d4c9c9a2568cb12841d3854bba8815c37ce77d3bd11706'
            'af1d0eae06544fbca7a9af2e2f55dc472324abf28402652e88d3b62c1882a132'
            '7f28fd5f37bc4493a48c199074ec4393b971246e8d208c28f4348d526ac60dce')

prepare() {
  cd "edb-debugger-$pkgver"
  patch -p1 -i ../plugin_path.patch
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
  [ "$CARCH" = "x86_64" ] && (mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib")

  # icons
  cd ..
  install -Dm644 src/images/edb48-logo.png "$pkgdir/usr/share/pixmaps/edb.png"
  install -Dm644 src/images/edb48-logo.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/edb.png"

  # install desktop file
  cd ..
  install -Dm644 edb.desktop "$pkgdir/usr/share/applications/edb.desktop"
}
