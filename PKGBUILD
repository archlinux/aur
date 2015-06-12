# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=adaptagrams-git
pkgver=r1171.997b13d
pkgrel=1
pkgdesc="A library of tools and reusable code for adaptive diagramming applications"
arch=('i686' 'x86_64')
url=("http://adaptagrams.sourceforge.net/")
license=('LGPL')
optdepends=('cairo')
makedepends=('git')
options=('!libtool')
source=($pkgname::git+https://github.com/mjwybrow/adaptagrams.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname/cola"
  mkdir m4 || true
  aclocal
  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname/cola"
  make DESTDIR="$pkgdir" install
  install -m644 "libcola/exceptions.h" "$pkgdir/usr/include/libcola/"
}

