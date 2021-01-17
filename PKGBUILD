# Submitter: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=ttyd
pkgver=1.6.3
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
sha512sums=('b6c731444ad78d68464082557a4b7dae857f2b86511810f055d2a4c8e1c7051328cdbcd1f8a43c322a2dd20c20474b483f9fa104785268bafdefb04cce54287d'
            '1cebf87e06f6303c48d931a87614f05d7300b4fba45ac5bf5a56ac20a0c9f48a1997bce13611ab3b498eed991a74594318c49ae801595fc882755dc1928640bb'
            '192b8b7216017b862e665a4ce2f89eef0499a6b2738d4dfffe8abd95b622c7f6729c9995adfd84d042fb3301e05fc6f58a458fe84f2ff2679deeb7e9efaf679f')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"/src
	cp -p server.c server.c.0
	sed 's/  info.ws_ping_pong_interval = 5/\/\/   info.ws_ping_pong_interval = 5/' server.c.0 > server.c
}

build() {
	cc -Wall slogin.c -o slogin -lpam -lpam_misc -lutil
	cd ttyd-$pkgver
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

