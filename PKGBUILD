# Maintainer: picard <info@fr32k.de>
# Contributor: Richard "Nothing4You" Schwab <mail NOSPAM w.tf-w.tf>

pkgname=nzbget-git
_gitname=nzbget
pkgver=r1355.547b430
pkgrel=1
epoch=1
pkgdesc="Download from Usenet using .nzb files"
arch=('any')
#backup=('etc/nzbget.conf')
url="http://nzbget.net/"
depends=('libxml2' 'ncurses' 'libgcrypt' 'openssl')
makedepends=('git' 'autoconf' 'automake')
conflicts=('nzbget')
provides=('nzbget')
license=('GPL')
source=('git://github.com/nzbget/nzbget.git' 'nzbget.service')
install='nzbget.install'
sha512sums=('SKIP'
'd33dc707bb4f0265b08208f5e3be0c33f4ba8197717548160fc2b10dcd9c88dc299bf2c48a80ab6b7b8c86f5c3777f786ef55d317803315955dabd4bb28ed93a')

pkgver() {
cd "$_gitname"
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
cd "${srcdir}/$_gitname"

./configure --prefix=/usr --sbindir=/usr/bin --enable-parcheck --with-tlslib=OpenSSL
make
}

package() {
cd "${srcdir}/$_gitname"

make DESTDIR="$pkgdir" install

install -d "$pkgdir/usr/share/nzbget"
install -m644 -t "$pkgdir/usr/share/nzbget" ChangeLog README

install -d "$pkgdir/usr/lib/systemd/system"
install -m644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/nzbget.service" 
}
