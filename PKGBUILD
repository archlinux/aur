# Maintainer: aksr <aksr at t-com dot me>
pkgname=scrollz-git
pkgver=2.3.1.r1664.642cecf
pkgrel=1
pkgdesc="An advanced IRC client based on ircII client."
arch=('i686' 'x86_64')
url="https://github.com/ScrollZ/ScrollZ"
license=('custom')
depends=('ncurses' 'openssl')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+https://github.com/ScrollZ/ScrollZ.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s.r%s.%s" \
		"$(git describe --tags | sed -E 's/ScrollZ-//;s/-.*//')" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/$pkgname
	./configure 
		--prefix=/usr   \
		--enable-regexp \
		--enable-fish   \
		--enable-ipv6   \
		--with-openssl  \
		--with-default-server=chat.freenode.net:6667
	make
}

package() {
	cd $srcdir/$pkgname
	make DESTDIR="$pkgdir/" install
	install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}
