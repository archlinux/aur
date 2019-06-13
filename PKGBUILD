# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>

_pkgname=pcov
pkgname=php-$_pkgname-git
pkgver=v1.0.6.r0.g3546be8
pkgrel=1
pkgdesc="PCOV - CodeCoverage compatible driver for PHP"
arch=('i686' 'x86_64')
url="https://github.com/krakjoe/pcov"
license=('PHP')
depends=('php')
makedepends=('git')
source=(git://github.com/krakjoe/pcov.git#branch=release)
md5sums=('SKIP')
_ininame="pcov.ini"
_inifile="etc/php/conf.d/$_ininame"
backup=("$_inifile")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  phpize
  ./configure --prefix=/usr
  make
  #TEST_PHP_EXECUTABLE=`which php` php run-tests.php
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr INSTALL_ROOT="$pkgdir" install
  cat >> "$_ininame" <<EOF
;extension=pcov.so
;pcov.enabled = 1
;pcov.directory = /path/to/your/source/directory
EOF

  install -vDm644 "$_ininame" "$pkgdir/$_inifile"
}
