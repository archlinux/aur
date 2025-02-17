# Maintainer: Thomas Gerbet <thomas at gerbet dot me>

pkgname=php-pcov
pkgver=1.0.12
pkgrel=1
pkgdesc='Code coverage driver'
arch=('x86_64')
url='https://pecl.php.net/package/pcov'
license=('PHP')
depends=('php>=8.1.0')
backup=('etc/php/conf.d/pcov.ini')
source=("https://pecl.php.net/get/pcov-${pkgver}.tgz"
        'pcov.ini'
        'https://raw.githubusercontent.com/php/php-src/php-8.0.0/run-tests.php')
sha256sums=('23255c8c9335a9636ccb743f5302436a97a582a0bbde9869485be911bbc15da8'
            'f3ef921748a263be6806b5dd83eeca7c686e0a4b6334fad19ab4e40d384f5d0a'
            '618fbf07b81b94638f49202aa76e89fe93030398f1f2fe2f0fb53bce3265439e')

build() {
  cd "${srcdir}/pcov-${pkgver}/"

  phpize
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/pcov-${pkgver}/"

  export REPORT_EXIT_STATUS=1
  export NO_INTERACTION=1
  export SKIP_ONLINE_TESTS=1
  export SKIP_SLOW_TESTS=1
  export TEST_PHP_ARGS='-n -d extension=modules/pcov.so'
  php run-tests.php -P
}

package() {
  cd "${srcdir}/pcov-${pkgver}/"

  make INSTALL_ROOT="${pkgdir}/" install
  install -D -m 644 "$srcdir"/pcov.ini "$pkgdir"/etc/php/conf.d/pcov.ini
}
