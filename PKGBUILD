# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>

_pkgname=stat
pkgname=php-$_pkgname-git
pkgver=r102.eff23e7
pkgrel=1
pkgdesc="A super modern high performance profiler for production"
arch=('i686' 'x86_64')
url="https://github.com/krakjoe/stat"
license=('PHP')
depends=('php')
makedepends=('git')
source=(git+https://github.com/krakjoe/stat.git)
md5sums=('SKIP')
_ininame="stat.ini"
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
;zend_extension=stat.so
;stat.slots     = 10000 # Set to the maximum number of samples in the buffer
;stat.strings   = 32M # Set size of string buffer (supports suffixes, be generous)
;stat.socket    = /path/to/zend.tombs.socket # Set path to socket, setting to 0 disables socket
;stat.interval  = 0 # Set interval for sampling in microseconds
;stat.dump      = 0 # Set to a file descriptor for dump on shutdown
EOF

  install -vDm644 "$_ininame" "$pkgdir/$_inifile"
}
