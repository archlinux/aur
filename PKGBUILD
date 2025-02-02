# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=xgalaga
pkgver=2.1.1.0
pkgrel=6
pkgdesc="An open source remake of the classic arcade game Galaga"
arch=('i686' 'x86_64')
url="http://rumsey.org/xgal.html"
license=('GPL-2.0-or-later')
depends=('libxmu' 'libxpm')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
	fix-header.patch
        $pkgname.patch
        $pkgname.png
        $pkgname.desktop)
sha256sums=('adcfbfd04876f5197c60b37af0ad89a629e553d6e09314a4b3b5c70f6c634f9b'
            'd291d22749ef04a91553283bb93ad20ad3016f9ecd8b99d10d7268795ab96b53'
            '86be834b06ce745d71471aea8b936d8a04d4b8ffe3af7c5c95432e86a2e02dbd'
            '01918eda208b20fc34670ee4e063083b750f55289eae624be0e8dba6a2354436'
            '363cb392b792e99380d94443c44e5e8f31d9ab0d2c54e05da94467114ff5f4d4')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver

  local _ver=$(automake --version | head -1 | cut -d' ' -f4)
  cp -f /usr/share/automake-${_ver}/config.guess .
  cp -f /usr/share/automake-${_ver}/config.sub   .

  patch -p1 < ../fix-header.patch
  patch -Np2 -b -z .orig -i ../$pkgname.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver

  LDFLAGS='' ./configure \
	--mandir=/usr/share/man \
	--prefix=/usr/share/$pkgname \
	--exec-prefix=/usr/bin \
	--with-xpm-lib=/usr/lib
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" \
	mandir=/usr/share/man \
	prefix=/usr/share/$pkgname \
	exec_prefix=/usr/bin \
	scoredir=/var/lib/$pkgname \
	install

  install -Dm644 "$srcdir"/$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
}
