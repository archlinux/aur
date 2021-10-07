# Maintainer: Tung Ha <tunght13488 at gmail dot com>
# Contributor: Thomas Gerbet <thomas at gerbet dot me>

pkgname=php7-pcov
pkgver=1.0.9
pkgrel=1
pkgdesc='Code coverage driver'
arch=('x86_64')
url='https://pecl.php.net/package/pcov'
license=('PHP')
depends=('php7')
backup=('etc/php7/conf.d/pcov.ini')
source=("https://pecl.php.net/get/pcov-${pkgver}.tgz"
        'pcov.ini'
        'https://raw.githubusercontent.com/php/php-src/php-7.4.24/run-tests.php')
sha256sums=('201cf12c5531c2f99434d29a3d9fa7ddc12f0bf48c17901f1e9fdfdf69795160'
            'f3ef921748a263be6806b5dd83eeca7c686e0a4b6334fad19ab4e40d384f5d0a'
            '3c8b1c7eee9da4c9dea9de040a2b2ddcd8e48546af6322628c617c17e5edc0ff')

build() {
  cd "${srcdir}/pcov-${pkgver}/"

  phpize7
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
  php7 run-tests.php -P
}

package() {
  cd "${srcdir}/pcov-${pkgver}/"

  make INSTALL_ROOT="${pkgdir}/" install
  install -D -m 644 "$srcdir"/pcov.ini "$pkgdir"/etc/php7/conf.d/pcov.ini
}
