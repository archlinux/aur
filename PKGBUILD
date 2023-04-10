# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mpfr-git
pkgver=4.2.0.r140.g4e0324cb2
pkgrel=1
pkgdesc="C library for multiple-precision floating-point computations with correct rounding"
arch=('i686' 'x86_64')
url="https://www.mpfr.org/"
license=('GPL3' 'LGPL3')
depends=('glibc' 'gmp')
makedepends=('git')
provides=("mpfr=$pkgver")
conflicts=('mpfr')
options=('staticlibs')
source=("git+https://gitlab.inria.fr/mpfr/mpfr.git")
sha256sums=('SKIP')


pkgver() {
  cd "mpfr"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "mpfr"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-thread-safe
  make
}

check() {
  cd "mpfr"

  make check
}

package() {
  cd "mpfr"

  make DESTDIR="$pkgdir" install
}
