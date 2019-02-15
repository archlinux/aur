# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>

_pkgname=parallel
pkgname=php-$_pkgname-git
pkgver=r55.a4bf7ab
pkgrel=1
pkgdesc="A succinct parallel concurrency API for PHP7"
arch=('i686' 'x86_64')
url="https://github.com/krakjoe/parallel"
license=('PHP')
depends=('php-zts')
makedepends=('git')
source=(git://github.com/krakjoe/parallel.git#branch=develop)
md5sums=('SKIP')
_ininame="parallel.ini"
_inifile="etc/php/conf.d/$_ininame"
backup=("$_inifile")

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"

  phpize
  ./configure --prefix=/usr
  make
  make test
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr INSTALL_ROOT="$pkgdir" install
  cat >> "$_ininame" <<EOF
;extension=parallel.so
EOF

  install -vDm644 "$_ininame" "$pkgdir/$_inifile"
}
