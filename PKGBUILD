# Maintainer: Felix Braun <hazzl@falix.de>
# Contributor: Jeremy Kescher <jeremy@kescher.at>

pkgname=php84-apcu
pkgver=5.1.28
pkgrel=1
arch=('x86_64')
pkgdesc='A userland caching module for PHP 8.4'
url='https://pecl.php.net/package/APCu'
makedepends=("php84")
license=('PHP')
source=("https://pecl.php.net/get/apcu-${pkgver}.tgz"
		"apcu.ini")
backup=("etc/php84/conf.d/apcu.ini")
sha256sums=('ca9c1820810a168786f8048a4c3f8c9e3fd941407ad1553259fb2e30b5f057bf'
            '18b2d904848b185bdc7c0c6a5f7c82ec809e9ed3f137cd6d3420160f4756630f')

prepare() {
	cd "$srcdir/apcu-$pkgver"
}

build() {
 	cd "${srcdir}/apcu-${pkgver}"
	 phpize84
 	./configure --prefix=/usr
 	make
}

check() {
	cd "$srcdir/apcu-$pkgver"

	export REPORT_EXIT_STATUS=1
	export NO_INTERACTION=1
	export SKIP_ONLINE_TESTS=1
	export SKIP_SLOW_TESTS=1
	export TEST_PHPDBG_EXECUTABLE=phpdbg84
	make test
}

package() {
	depends=("php84")
	cd "${srcdir}/apcu-${pkgver}"
	make INSTALL_ROOT=${pkgdir} install

	install -D -m644 "$srcdir/apcu.ini" "${pkgdir}/etc/php84/conf.d/apcu.ini"
	install -D -m644 apc.php "${pkgdir}/usr/share/webapps/${pkgname}/apc.php"
}
