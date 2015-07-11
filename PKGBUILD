# Maintainer: picard <info@fr32k.de>
# Contributor: Richard "Nothing4You" Schwab <mail NOSPAM w.tf-w.tf>

pkgname=nzbget-svn
pkgver=0.r1308
pkgrel=1
epoch=1
pkgdesc="Download from Usenet using .nzb files"
arch=('i686' 'x86_64' 'armv7h')
#backup=('etc/nzbget.conf')
url="http://nzbget.net/"
depends=('libxml2' 'ncurses' 'libgcrypt' 'openssl')
makedepends=('svn' 'autoconf' 'automake')
conflicts=('nzbget')
provides=('nzbget')
license=('GPL')
source=('nzbget::svn://svn.code.sf.net/p/nzbget/code/' 'nzbget.service')
install='nzbget.install'
sha512sums=('SKIP'
'd33dc707bb4f0265b08208f5e3be0c33f4ba8197717548160fc2b10dcd9c88dc299bf2c48a80ab6b7b8c86f5c3777f786ef55d317803315955dabd4bb28ed93a')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  local ver="$(svnversion)"
  printf "0.r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/${pkgname%-*}/trunk"

  ./configure --prefix=/usr --sbindir=/usr/bin --enable-parcheck --with-tlslib=OpenSSL
  make
}

package() {
  cd "$srcdir/${pkgname%-*}/trunk"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/share/nzbget"
  install -m644 -t "$pkgdir/usr/share/nzbget" AUTHORS ChangeLog README

  install -d "$pkgdir/usr/lib/systemd/system"
  install -m644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/nzbget.service"
}