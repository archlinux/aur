# Maintainer: Tung Ha <tunght13488 at gmail dot com>
# Contributor: Thomas Gerbet <thomas at gerbet dot me>

pkgname=php-legacy-pcov
_extname=pcov
pkgver=1.0.11
pkgrel=1
pkgdesc='Code coverage driver'
arch=('x86_64')
url='https://pecl.php.net/package/pcov'
license=('PHP')
depends=('php-legacy')
backup=("etc/php-legacy/conf.d/$_extname.ini")
source=("https://pecl.php.net/get/$_extname-${pkgver}.tgz"
        "$_extname.ini"
        'https://raw.githubusercontent.com/php/php-src/php-8.1.0/run-tests.php')
sha256sums=('ad22e64cd3af065330182ac142c1c3ab40de934482cd400f8bd76064130ac242'
            'f3ef921748a263be6806b5dd83eeca7c686e0a4b6334fad19ab4e40d384f5d0a'
            '618fbf07b81b94638f49202aa76e89fe93030398f1f2fe2f0fb53bce3265439e')

build() {
  cd "$srcdir/$_extname-$pkgver/"

  phpize-legacy
  ./configure --prefix=/usr --with-php-config=php-config-legacy
  make
}

check() {
  cd "$srcdir/$_extname-$pkgver/"

  export REPORT_EXIT_STATUS=1
  export NO_INTERACTION=1
  export SKIP_ONLINE_TESTS=1
  export SKIP_SLOW_TESTS=1
  export TEST_PHP_ARGS='-n -d extension=modules/pcov.so'
  php-legacy run-tests.php -P
}

package() {
  cd "$srcdir/$_extname-$pkgver/"
  install -m0755 -d "$pkgdir/etc/php-legacy/conf.d/"
  make INSTALL_ROOT="$pkgdir/" install
  install -D -m 644 "$srcdir/$_extname.ini" "$pkgdir/etc/php-legacy/conf.d/$_extname.ini"
}
