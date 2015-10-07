# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=coz-git
pkgver=r246.479a3c1
pkgrel=2
pkgdesc="a new kind of profiler that measures optimization potential"
arch=('x86_64')
url="https://github.com/plasma-umass/coz"
license=('BSD')
depends=('python' 'clang>=3.1')
makedepends=('git')
options=()
install=
source=('coz-git::git+https://github.com/plasma-umass/coz.git' 'fix-preload-path.patch')
md5sums=('SKIP' '273946cb7d19ad5697c68893b312cd64')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  msg2 "Fix LD_PRELOAD path set by coz wrapper"
  patch -Np1 < "$srcdir/fix-preload-path.patch"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/$pkgname/coz" "$pkgdir/usr/bin/coz"
  install -Dm644 "$srcdir/$pkgname/libcoz/libcoz.so" "$pkgdir/usr/share/coz/libcoz.so"
  install -Dm644 "$srcdir/$pkgname/include/coz.h" "$pkgdir/usr/include/coz.h"
}

# vim:set ts=2 sw=2 et:
