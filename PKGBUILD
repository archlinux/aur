# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xcircuit-git
_pkgname=xcircuit
pkgver=3.10.30.r0.gadc6bf9
_pkgver=3.10
pkgrel=1
pkgdesc="A program for drawing publishable-quality electrical circuit schematic diagrams (development version)"
arch=('x86_64' 'i686')
url="http://opencircuitdesign.com/xcircuit"
license=('GPL2')
depends=('tk' 'libxpm' 'zlib' 'cairo')
makedepends=('git' 'chrpath' 'imagemagick')
source=($pkgname::git+https://github.com/RTimothyEdwards/XCircuit.git#tag=3.10.30
        "xcircuit.desktop"
        "http://opencircuitdesign.com/xcircuit/xcicon_sm.gif")
sha256sums=('SKIP'
            '3c29f55ee6196b554d6fc5791f29ac7cab2fecc184c699e80ee265be0b609456'
            '8e7b132d9803443e6f3ae65ed1990362a5a977e7856b1e54f2edf8cd4a3d7259')
provides=($_pkgname=${pkgver%%.r*}-${pkgrel})
conflicts=($_pkgname)

pkgver() {
  cd $pkgname
  git describe --tags --long|sed -r 's,^([^-]*)-([0-9]*)-(g.*),\1.r\2.\3,'
}

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --with-cairo \
    --with-tcl=/usr/lib \
    --with-tk=/usr/lib
  make ACLOCAL=aclocal AUTOMAKE=automake
}

package() {
  cd "$srcdir"
  install -Dm0644 xcircuit.desktop "$pkgdir/usr/share/applications/xcircuit.desktop"
  cd $pkgname
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/share/man/man1"
  mv "$pkgdir/usr/lib/xcircuit-${_pkgver}/man/"* "$pkgdir/usr/share/man/man1/"
  rm -rf "$pkgdir/usr/lib/xcircuit-${_pkgver}/man/"
  chrpath -d "$pkgdir/usr/lib/xcircuit-${_pkgver}/xcircexec"
  convert +set date:create +set date:modify ../xcicon_sm.gif xcircuit.png
  install -Dm0644 xcircuit.png "$pkgdir/usr/share/icons/xcircuit.png"
}
