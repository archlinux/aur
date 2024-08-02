# Contributor: Lucky <archlinux@builds.lucky.li>
## Based on rtorrent [community]
# Maintainer: aksr <aksr at t-com dot me>
pkgname=rtorrent-git
pkgver=0.9.7.r109.g1da0e34
pkgrel=1
pkgdesc='A ncurses BitTorrent client written in C++, based on the libTorrent libraries for Unix.'
url='https://github.com/rakshasa/rtorrent/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('curl' 'libtorrent-git' 'xmlrpc-c')
makedepends=('git' 'autoconf-archive')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
install="${pkgname}".install
source=("$pkgname::git+$url")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -r "s/([^-]*-g)/r\1/;s/-/./g;s/^v//"
}

build() {
	cd "$srcdir/$pkgname"
	autoreconf -iv
	export CXXFLAGS="${CXXFLAGS} -fno-strict-aliasing"
	./configure --prefix=/usr --enable-debug --with-xmlrpc-c
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
	install -D -m644 doc/faq.xml "$pkgdir/usr/share/doc/rtorrent/faq.xml"
	install -D -m644 doc/old/rtorrent.1 "$pkgdir/usr/share/man/man1/rtorrent.1"
	install -D -m644 doc/rtorrent.rc "$pkgdir/usr/share/doc/rtorrent/rtorrent.rc"
}
