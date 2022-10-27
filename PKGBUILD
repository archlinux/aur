# Submitter: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=ttyd
pkgver=1.7.2
pkgrel=1
pkgdesc='Share your terminal over the web'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url=https://tsl0922.github.io/ttyd/
license=('MIT')
depends=('json-c' 'libpcap' 'libwebsockets' 'zlib')
makedepends=('cmake')
source=("ttyd.service"
	"https://raw.githubusercontent.com/eklausme/c/master/slogin.c"
	"https://github.com/tsl0922/ttyd/archive/$pkgver/ttyd-$pkgver.tar.gz")
sha512sums=('7be3b6f477c6a12f0cdbb6bb33099f00bb5030a7b2f2fd6d8cdfacba08ec9a26accb973728c4abffe36d05985ad1077c255e4d06e86e75a1649d3fdd591030f6'
            '1cebf87e06f6303c48d931a87614f05d7300b4fba45ac5bf5a56ac20a0c9f48a1997bce13611ab3b498eed991a74594318c49ae801595fc882755dc1928640bb'
            '5b351d4cca228fcc272074164edeb6698768c6fd714b2c8243ec67456c0140153085553ecbebbd40331c12012e8d155d4aeba1050903555b90c30b8f8de4b906')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"/src
	mv server.c server.c.0
	sed 's/  info.ws_ping_pong_interval = 5/\/\/   info.ws_ping_pong_interval = 5/' server.c.0 > server.c
}

build() {
	cc -Wall slogin.c -o slogin -lpam -lpam_misc -lutil
	cd ttyd-$pkgver
	mv CMakeLists.txt CMakeLists.txt.0
	sed -e 's/find_package(Libwebsockets 1.7.0 QUIET)/find_package(Libwebsockets 4.3.1...<5.0.0 QUIET)/'	\
	    -e 's/cmake_minimum_required(VERSION 2.8)/cmake_minimum_required(VERSION 3.19)/'	\
	    CMakeLists.txt.0 > CMakeLists.txt
	mkdir -p build && cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd ttyd-$pkgver/build
	make DESTDIR="$pkgdir" install

	install -Dm644 -t "$pkgdir"/usr/share/licenses/ttyd ../LICENSE

	# Install SystemD related files
	install -D -m644 ../../ttyd.service   "${pkgdir}/usr/lib/systemd/system/ttyd.service"

	# Install simplified login devoid of signal-handling
	install -D -m755 ../../slogin	"${pkgdir}/usr/bin/slogin"
}

