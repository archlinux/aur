# Maintainer: Edmund Lodewijks <e .lodewijks @ gmail. com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Stefan Clarke <fm0nk3y@yahoo.co.uk>

pkgname=gnubg
pkgver=1.08.003
pkgrel=3
pkgdesc="World class backgammon application"
arch=('x86_64')
url="https://www.gnu.org/software/gnubg/"
license=('GPL-3.0-or-later')
depends=('python' 'gtkglext' 'curl' 'libcanberra')
source=(https://ftp.gnu.org/gnu/gnubg/gnubg-release-${pkgver}-sources.tar.gz{,.sig}
        $pkgname.desktop)
validpgpkeys=('39FC530C20B9B8C627E71BAC973B63D4ECB3B8BD')
b2sums=('6cb9ddcfbc71dbb4461daebb191046f02986a116e45acf09f219598fea6b066c38080c3a2b051de424eadcbe3a6c8a6e30794381d9edfb03dcc36102ed641e05'
        'SKIP'
        'e0dd8bf4408b55f8bca24674b778c453382d373eb49eb5752f98c6980171e4f05bdfbe60d3d495ce5da37c25dd3f033a31516a0a45e8c1b0f569b0c084cb27b3')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/-f/-fn/' doc/Makefile.in doc/Makefile.am
}

build() {
  cd $pkgname-$pkgver

  ./autogen.sh

  ./configure \
	  --prefix=/usr \
	  --bindir=/usr/bin \
	  --sysconfdir=/etc \
	  --mandir=/usr/share/man \
	  --enable-simd=sse2

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/$pkgname.desktop \
    "$pkgdir"/usr/share/applications/$pkgname.desktop
}
