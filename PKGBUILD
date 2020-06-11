# Submitter: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=ttyd
pkgver=1.6.0
pkgrel=4
pkgdesc='Share your terminal over the web'
arch=('i686' 'x86_64' 'armv7h')
url=https://tsl0922.github.io/ttyd/
license=('MIT')
depends=('json-c' 'libpcap' 'libwebsockets' 'zlib')
makedepends=('cmake' 'vim') # vim needed for its xxd binary
# Normal case:	"https://github.com/tsl0922/ttyd/archive/$pkgver/ttyd-$pkgver.tar.gz"
# To make ttyd work with libwebsockets again, we fetch specific commit 56d26ac
source=("ttyd.service"
	"https://codeload.github.com/tsl0922/ttyd/legacy.tar.gz/56d26ac")
sha512sums=('b6c731444ad78d68464082557a4b7dae857f2b86511810f055d2a4c8e1c7051328cdbcd1f8a43c322a2dd20c20474b483f9fa104785268bafdefb04cce54287d'
            '575a4751529da25a508e03f17cfa151342bccec357585c7667f198504541d8f3ccdff702f35efa707b84ba106a06fc49a8d7e177fd8d6a372b13d36e6fd412ec')

build() {
	# Normal case: cd ttyd-$pkgver
	cd "${srcdir}"/tsl0922-$pkgname-56d26ac
	mkdir build -p && cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	# Normal case: cd ttyd-$pkgver/build
	cd "${srcdir}"/tsl0922-$pkgname-56d26ac/build
	make DESTDIR="$pkgdir" install

	install -Dm644 -t "$pkgdir"/usr/share/licenses/ttyd ../LICENSE

	# Install SystemD related files
	install -D -m644 ../../ttyd.service   "${pkgdir}/usr/lib/systemd/system/ttyd.service"
}

