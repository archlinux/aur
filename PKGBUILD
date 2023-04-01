# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Giovanni Scafora <linuxmania@gmail.com>
# Contributor: simo <simo@archlinux.org>

pkgname=xcircuit
pkgver=3.10.30
_pkgver=3.10
pkgrel=2
pkgdesc="A program for drawing publishable-quality electrical circuit schematic diagrams"
arch=('x86_64')
url="http://opencircuitdesign.com/xcircuit"
license=('GPL2')
depends=('tk' 'libxpm' 'zlib' 'cairo')
makedepends=('chrpath' 'imagemagick')
source=("http://opencircuitdesign.com/xcircuit/archive/$pkgname-$pkgver.tgz"
        "xcircuit.desktop"
        "http://opencircuitdesign.com/xcircuit/xcicon_sm.gif"
         https://github.com/RTimothyEdwards/XCircuit/commit/7f57ebbf.patch)
sha256sums=('b2f63cba605e79cc2a08714bf3888f7be7174384ed724db3c70f8bf25c36f554'
            '3c29f55ee6196b554d6fc5791f29ac7cab2fecc184c699e80ee265be0b609456'
            '8e7b132d9803443e6f3ae65ed1990362a5a977e7856b1e54f2edf8cd4a3d7259'
            '5f56153f37fa7764148e498e17542388fa4fe6a3ba3af3c4f87f370cf41c4973')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 < ../7f57ebbf.patch # Fix build with -Wformat-security
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
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
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/share/man/man1"
  mv "$pkgdir/usr/lib/xcircuit-${_pkgver}/man/"* "$pkgdir/usr/share/man/man1/"
  rm -rf "$pkgdir/usr/lib/xcircuit-${_pkgver}/man/"
  chrpath -d "$pkgdir/usr/lib/xcircuit-${_pkgver}/xcircexec"
  convert +set date:create +set date:modify ../xcicon_sm.gif xcircuit.png
  install -Dm0644 xcircuit.png "$pkgdir/usr/share/icons/xcircuit.png"
}
