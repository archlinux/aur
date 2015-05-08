# Maintainer: Matti Niemenmaa <matti.niemenmaa+aur ät iki dȯt fi>

pkgname=vio2sf-git
pkgver=r30.0d2a329
pkgrel=1
pkgdesc="Library for decoding Nintendo DS Sound Format files"
arch=(i686 x86_64)
url='https://bitbucket.org/kode54/vio2sf'
license=(GPL2)
depends=(glibc zlib)
makedepends=(git)
source=(${pkgname}::git+https://bitbucket.org/kode54/vio2sf.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname/src/vio2sf"
  make CFLAGS="$CFLAGS -c -fPIC" CXXFLAGS="$CXXFLAGS -c -fPIC"
  "${CC-cc}" "$CFLAGS" -shared -lz -o libvio2sf.so desmume/*.o
}

package() {
  cd "$srcdir/$pkgname/src/vio2sf"
  install -D -m644 -t "$pkgdir/usr/include/vio2sf/desmume" desmume/{state,spu_exports,types}.h
  install -D -m644 -t "$pkgdir/usr/lib" libvio2sf.{a,so}
}

# vim:set sw=2 et:
