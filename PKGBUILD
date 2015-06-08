# Maintainer: Michael Gerhaeuser <michael dot gerhaeuser at gmail dot com>

pkgname=ios-webkit-debug-proxy-git
pkgver=1.4.r26.g8803b75
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
	cd ios-webkit-debug-proxy
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd ios-webkit-debug-proxy

    sed -i -e 's/-Werror//' configure.ac

	./autogen.sh --prefix=/usr
	./configure --prefix=/usr LIBS="-lm"
	make
}

package() {
	cd ios-webkit-debug-proxy
	make DESTDIR="$pkgdir" install

	# copy license
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/ios-webkit-debug-proxy/LICENSE.md"

	# move header files to /usr/include/ios-webkit-debug-proxy
	mkdir -p ${pkgdir}/usr/include/ios-webkit-debug-proxy
	mv ${pkgdir}/usr/include/*.h $pkgdir/usr/include/ios-webkit-debug-proxy
}
