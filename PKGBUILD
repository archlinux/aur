# Maintainer: Thomas Gerbet <thomas at gerbet dot me>

pkgname=php-pcov
pkgver=1.0.6
pkgrel=2
pkgdesc='Code coverage driver'
arch=('x86_64')
url='https://pecl.php.net/package/pcov'
license=('PHP')
depends=('php>=7.1.0')
backup=('etc/php/conf.d/pcov.ini')
source=("https://pecl.php.net/get/pcov-${pkgver}.tgz"
        'pcov.ini'
        'https://raw.githubusercontent.com/php/php-src/php-7.1.0/run-tests.php'
        'php8-test.patch::https://github.com/krakjoe/pcov/commit/7c0cfac1f536396f7169f4ec46419941a0e61314.patch')
sha256sums=('61039955ad242d7a295251bca2f05c8e4c603abbc9e0f82bfa45009699e64edf'
            'f3ef921748a263be6806b5dd83eeca7c686e0a4b6334fad19ab4e40d384f5d0a'
            '3c8b1c7eee9da4c9dea9de040a2b2ddcd8e48546af6322628c617c17e5edc0ff'
            'cd39b0f6ee2510aae4c3fb8fe6503747943c96caf25c262b2bed63ff7db8c0db')

build() {
  cd "${srcdir}/pcov-${pkgver}/"
   patch --forward --strip=1 --input="${srcdir}/php8-test.patch"

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