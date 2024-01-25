pkgname=php-decimal-git
pkgver=v1.x.r130.9b4d6f4
pkgrel=1
pkgdesc="Correctly-rounded, arbitrary precision decimal floating-point arithmetic in PHP 7"
arch=("i686" "x86_64")
url="https://php-decimal.github.io"
license=("MIT")
depends=("php" "mpdecimal")
makedepends=("git")
source=("$pkgname"::"git+https://github.com/php-decimal/ext-decimal.git#branch=1.x")
md5sums=("SKIP")
_ininame="decimal.ini"
_inifile="etc/php/conf.d/$_ininame"
backup=("$_inifile")

pkgver() {
  cd "$pkgname"
  printf "v1.x.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
