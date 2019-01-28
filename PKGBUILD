# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>

pkgname=php-componere-git
pkgver=1.3.0.r153.g4383099
pkgrel=1
pkgdesc="Complex Type Composition and Manipulation http://docs.php.net/intro.componere"
arch=('i686' 'x86_64')
url="https://github.com/krakjoe/componere"
license=('PHP')
depends=('php')
makedepends=('git')
source=("$pkgname"::'git://github.com/krakjoe/componere.git')
md5sums=('SKIP')
_ininame="componere.ini"
_inifile="etc/php/conf.d/$_ininame"
backup=("$_inifile")

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git checkout develop -q | git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname"
  git checkout develop

  phpize
  ./configure --prefix=/usr
  make
  #TEST_PHP_EXECUTABLE=`which php` php run-tests.php
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr INSTALL_ROOT="$pkgdir" install
  cat >> "$_ininame" <<EOF
;extension=componere.so
EOF

  install -vDm644 "$_ininame" "$pkgdir/$_inifile"
}
