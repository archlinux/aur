# Maintainer: Michael Gerhaeuser <michael dot gerhaeuser at gmail dot com>

pkgname=ios-webkit-debug-proxy-git
_pkgname=ios-webkit-debug-proxy
pkgver=1.4.r69.gdcaa139
pkgrel=1
pkgdesc="A DevTools proxy (WebKit Remote Debugging) for iOS devices (Safari Remote Web Inspector)"
url="https://github.com/google/ios-webkit-debug-proxy"
arch=('i686' 'x86_64')
license=('BSD')
depends=('usbmuxd-git' 'libusbmuxd-git' 'libplist-git' 'libimobiledevice-git')
makedepends=('git')
provides=('ios-webkit-debug-proxy')
conflicts=('ios-webkit-debug-proxy')

source=("git://github.com/google/ios-webkit-debug-proxy.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"

	./autogen.sh --prefix=/usr
	./configure --prefix=/usr LIBS="-lm"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install

	# copy license
	install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

	# move header files to /usr/include/ios-webkit-debug-proxy
	mkdir -p "$pkgdir/usr/include/ios-webkit-debug-proxy"
	mv "$pkgdir/usr/include/"*.h "$pkgdir/usr/include/$_pkgname"
}
