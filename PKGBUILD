# Maintainer: Kacper Łukawski <kacluk98@gmail.com>
pkgname=logicdraw-git
pkgver=r101.1d8805f
pkgver() {
  cd "$srcdir/LogicDraw/"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
pkgrel=2
pkgdesc="An application to perform simulations of logic gates, in which you can paint your circuit like in raster graphics editor."
arch=('any')
url="https://github.com/Wieku/LogicDraw"
license=('MIT')
depends=('java-environment' 'libgl' 'gradle')
source=('git+https://github.com/Wieku/LogicDraw.git'
  "logicdraw"
  "logicdraw.desktop" )
noextract=()
md5sums=('SKIP'
         'dbc0616e552aca3bcc4781fefdceea04'
         'a4c84914036108b15892e2c60a36066f')
validpgpkeys=()
conflicts=('logicdraw')
provides=('logicdraw')

build() {
  cd "$srcdir"/LogicDraw/

  gradle desktop:dist
}

package() {
  cd "$srcdir"

  install -d "$pkgdir"/usr/{bin,share/logicdraw}
  install "$srcdir"/logicdraw "$pkgdir"/usr/bin/
  install -D -m644 "$srcdir"/logicdraw.desktop "$pkgdir"/usr/share/applications/logicdraw.desktop

  cd LogicDraw/
  
  mv desktop/build/libs/LogicDraw-*.jar "$pkgdir"/usr/share/logicdraw/logicdraw.jar
}
