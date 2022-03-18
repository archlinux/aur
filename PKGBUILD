# Maintainer: Timo Sarawinski <timo@it-kraut.net>
pkgname=php80-apcu
pkgver=5.1.21
pkgrel=3
arch=('x86_64')
pkgdesc='A userland caching module for PHP 8.0'
url='https://pecl.php.net/package/APCu'
makedepends=("php80")
license=('PHP')
source=("https://pecl.php.net/get/apcu-${pkgver}.tgz"
	"apcu.ini")
backup=("etc/php80/conf.d/apcu.ini")
sha256sums=('1033530448696ee7cadec85050f6df5135fb1330072ef2a74569392acfecfbc1'
            '18b2d904848b185bdc7c0c6a5f7c82ec809e9ed3f137cd6d3420160f4756630f')

prepare() {
        cd "$srcdir/apcu-$pkgver"

        rm tests/apc_entry_002.phpt
}

build() {
  cd "${srcdir}/apcu-${pkgver}"
  phpize80
  ./configure --prefix=/usr
  make
}

check() {
       cd "$srcdir/apcu-$pkgver"

       export REPORT_EXIT_STATUS=1
       export NO_INTERACTION=1
       export SKIP_ONLINE_TESTS=1
       export SKIP_SLOW_TESTS=1
       export TEST_PHPDBG_EXECUTABLE=phpdbg80
       make test
}

package() {
  depends=("php80")
  cd "${srcdir}/apcu-${pkgver}"
  make INSTALL_ROOT=${pkgdir} install

  install -D -m644 "$srcdir/apcu.ini" "${pkgdir}/etc/php80/conf.d/apcu.ini"
  install -D -m644 apc.php "${pkgdir}/usr/share/webapps/${pkgname}/apc.php"
}
