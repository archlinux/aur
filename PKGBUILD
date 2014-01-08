# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

_pkgbase=opendune
pkgname=$_pkgbase-git
pkgver=0.7.88d5666
pkgrel=1
pkgdesc="Open source re-creation of the popular game Dune II"
arch=('i686' 'x86_64')
url="http://opendune.org"
license=('GPL2')
depends=('sdl' 'alsa-lib')
makedepends=('git')
optdepends=('timidity++: midi music support')
conflicts=('opendune')
provides=('opendune')
install=$_pkgbase.install
source=($_pkgbase::"git+https://github.com/OpenDUNE/OpenDUNE.git"
        "$_pkgbase.sh"
        "$_pkgbase.desktop"
        "$_pkgbase.png")
sha256sums=('SKIP'
            '56a2802f74b2bce644a34a7c2519307ec5925dbc111a1f132f6a19ef4b5e00f0'
            'b80429ce421d6f781b1ef0c7c50293cf5970225e8de0fd6e379290d1fd91d4d7'
            '89c9cbf76b3f7ac62bf39235a64b191ee4b3bd437f88161b6757b6ec44e8888b')

pkgver() {
  cd $_pkgbase

  # get last annotated tag from packed refs
  echo $(tail -n 2 .git/packed-refs | head -n 1 | cut -d "/" -f 3).$(git rev-parse --short master)
}

build() {
  cd $_pkgbase

  ./configure --prefix-dir=/opt/opendune
  make
}

package() {
  cd $_pkgbase

  make INSTALL_ICON_DIR="$pkgdir"/opt/$_pkgbase \
    INSTALL_BINARY_DIR="$pkgdir"/opt/$_pkgbase \
    INSTALL_DOC_DIR="$pkgdir"/opt/$_pkgbase/doc install

  # install binary, icon and desktop files
  install -Dm755 ../$_pkgbase.sh "$pkgdir"/usr/bin/$_pkgbase
  install -Dm644 bin/data/put_dune2_here.txt "$pkgdir"/opt/$_pkgbase/data/put_dune2_here.txt
  install -Dm644 ../$_pkgbase.png "$pkgdir"/usr/share/pixmaps/$_pkgbase.png
  install -Dm644 ../$_pkgbase.desktop "$pkgdir"/usr/share/applications/$_pkgbase.desktop
}
