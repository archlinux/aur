# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xcircuit-git
_pkgname=xcircuit
pkgver=3.9.34.r0.g215a610
pkgrel=1
pkgdesc="A program for drawing publishable-quality electrical circuit schematic diagrams (development version)"
arch=('i686' 'x86_64')
url="http://opencircuitdesign.com/xcircuit"
license=('GPL2')
depends=('tk' 'libxpm' 'zlib')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git' 'chrpath' 'gendesk')
_categories='Application;Electronics;Engineering'
source=($pkgname::git://opencircuitdesign.com/xcircuit-3.9)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long|sed -r 's,^([^-]*)-([0-9]*)-(g.*),\1.r\2.\3,'
}

prepare() {
  cd $pkgname
  gendesk --pkgname="$_pkgname" "$startdir/PKGBUILD"
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --with-tcl=/usr/lib --with-tk=/usr/lib --mandir=/usr/share/man
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/usr/share/man/man1
  mv "$pkgdir"/usr/lib/xcircuit-3.9/man/* "$pkgdir"/usr/share/man/man1/
  rm -rf "$pkgdir"/usr/lib/xcircuit-3.9/man/
  chrpath -d "$pkgdir"/usr/lib/xcircuit-3.9/xcircexec
  install -Dm0644 xcircuit.desktop "$pkgdir"/usr/share/applications/xcircuit.desktop
  install -Dm0644 xcircuit.png "$pkgdir"/usr/share/icons/xcircuit.png
}


