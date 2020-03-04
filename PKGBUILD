# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>

pkgname=php-decimal-git
pkgver=v1.3.0.r65.g91b2b21
pkgrel=1
pkgdesc="Correctly-rounded, arbitrary precision decimal floating-point arithmetic in PHP 7"
arch=('i686' 'x86_64')
url="http://php-decimal.io"
license=('PHP')
depends=('php' 'mpdecimal')
makedepends=('git')
source=("$pkgname"::'git://github.com/php-decimal/ext-decimal.git')
md5sums=('SKIP')
_ininame="decimal.ini"
_inifile="etc/php/conf.d/$_ininame"
backup=("$_inifile")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  phpize
  ./configure --prefix=/usr
  make
  #TEST_PHP_EXECUTABLE=`which php` php run-tests.php
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr INSTALL_ROOT="$pkgdir" install
  cat >> "$_ininame" <<EOF
;extension=decimal.so
EOF

  install -vDm644 "$_ininame" "$pkgdir/$_inifile"
}
