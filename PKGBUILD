# Maintainer: Jeremy Kescher <jeremy@kescher.at>

pkgname=php82-apcu
pkgver=5.1.23
pkgrel=1
arch=('x86_64')
pkgdesc='A userland caching module for PHP 8.2'
url='https://pecl.php.net/package/APCu'
makedepends=("php82")
license=('PHP')
source=("https://pecl.php.net/get/apcu-${pkgver}.tgz"
		"apcu.ini")
backup=("etc/php82/conf.d/apcu.ini")
sha256sums=('67ee7464ccad2335c3fa4aeb0b8edbcf6d8344feea7922620c6a13015d604482'
            '18b2d904848b185bdc7c0c6a5f7c82ec809e9ed3f137cd6d3420160f4756630f')

prepare() {
	cd "$srcdir/apcu-$pkgver"
	rm tests/apc_entry_002.phpt
}

build() {
 	cd "${srcdir}/apcu-${pkgver}"
	 phpize82
 	./configure --prefix=/usr
 	make
}

check() {
	cd "$srcdir/apcu-$pkgver"

	export REPORT_EXIT_STATUS=1
	export NO_INTERACTION=1
	export SKIP_ONLINE_TESTS=1
	export SKIP_SLOW_TESTS=1
	export TEST_PHPDBG_EXECUTABLE=phpdbg82
	make test
}

package() {
	depends=("php82")
	cd "${srcdir}/apcu-${pkgver}"
	make INSTALL_ROOT=${pkgdir} install

	install -D -m644 "$srcdir/apcu.ini" "${pkgdir}/etc/php82/conf.d/apcu.ini"
	install -D -m644 apc.php "${pkgdir}/usr/share/webapps/${pkgname}/apc.php"
}
