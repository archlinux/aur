pkgname=whip-server
pkgver=5.01
_pkgsubver="-win64b"
pkgrel=3
pkgdesc="The InWorldz WHIP distributed asset server"
arch=(i686 x86_64)
url="https://github.com/InWorldz/$pkgname"
license=("Apache")
install=$pkgname.install
source=("https://github.com/InWorldz/$pkgname/archive/v$pkgver$_pkgsubver.tar.gz"
"$pkgname.service")
makedepends=(cmake boost)
depends=(boost-libs)
options=(emptydirs)
md5sums=('3174e8b1de0aabf08446ff7b8c6e2b06'
         '307310746d8ffa5830fa573b57a64abb')

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../$pkgname-$pkgver$_pkgsubver \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	cd build
	install -Dm755 whip "$pkgdir/srv/inworldz/whip"
	cd ../$pkgname-$pkgver$_pkgsubver
	install -m644 whip.cfg.sample "$pkgdir/srv/inworldz/"
	chmod 777 "$pkgdir/srv/inworldz/"
	install -d 777 "$pkgdir/srv/inworldz/assets"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
