# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>

_pkgname=tombs
pkgname=php-$_pkgname-git
pkgver=r78.ba72201
pkgrel=1
pkgdesc="Detect unused code in production"
arch=('i686' 'x86_64')
url="https://github.com/kornrunner/tombs"
license=('PHP')
depends=('php')
makedepends=('git')
source=(git+https://github.com/kornrunner/tombs.git)
md5sums=('SKIP')
_ininame="tombs.ini"
_inifile="etc/php/conf.d/$_ininame"
backup=("$_inifile")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
;zend_extension  = tombs.so
;tombs.slots     = 10000 # Set to (a number greater than) the maximum number of functions
;tombs.strings   = 32M # Set size of string buffer (supports suffixes, be generous)
;tombs.socket    = /path/to/zend.tombs.socket # Set path to socket, setting to 0 disables socket
;tombs.dump      = 0    # Set to a file descriptor for dump on shutdown
;tombs.namespace = N/A  # Set to restrict recording to a namespace
EOF

  install -vDm644 "$_ininame" "$pkgdir/$_inifile"
}
