# Maintainer: Volker Schatz <arch@my-name-without-hyphen.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: forest76 <forestt@poczta.onet.pl>

pkgname=magicpoint
pkgver=1.13a
pkgrel=3
pkgdesc='X11 based presentation tool'
arch=('i686' 'x86_64')
url='http://member.wide.ad.jp/wg/mgp/'
depends=('libpng' 'libmng' 'giflib' 'libxmu' 'imlib' 'm17n-lib' 'libxft' 'fontconfig')
makedepends=('imake')
optdepends=('netpbm: postscript figure antialiasing')
license=('custom')
source=("ftp://sh.wide.ad.jp/WIDE/free-ware/mgp/magicpoint-$pkgver.tar.gz")
md5sums=('ebc403982956e918ab327c54a90b44e0')

prepare() {
    sed -i -e '/^SYS_LIBRARIES=/s/-lmgpimage/-lmgpimage -lfontconfig/' \
        "$srcdir"/$pkgname-$pkgver/Imakefile.in
}

build() {
   cd "$srcdir"/$pkgname-$pkgver

   ./configure --prefix=/usr \
   	       --enable-imlib \
               --enable-gif \
               --enable-xft2 \
	       --with-x \
	       --with-m17n-lib \
	       --disable-freetype \
	       --x-libraries=/usr/lib \
	       --x-includes=/usr/include
   xmkmf
   make Makefiles
   make
}

package() {
   cd "$srcdir"/$pkgname-$pkgver

   make DESTDIR="$pkgdir" MANPATH=/usr/share/man install install.man

   # install licence
   install -v -D -m644 "$srcdir"/$pkgname-$pkgver/COPYRIGHT \
        "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

   # install syntax documentation
   install -v -D -m644 "$srcdir"/$pkgname-$pkgver/SYNTAX \
        "$pkgdir"/usr/share/doc/$pkgname/SYNTAX
}

