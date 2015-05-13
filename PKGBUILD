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
source=(${pkgname}::git+https://bitbucket.org/kode54/vio2sf.git
        remove-noise.patch)
sha256sums=('SKIP'
            '6604e83f363915984a186d670ca5d2fcb4e3d466cf46d566633bf0bef9a2f030')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 < "$srcdir"/remove-noise.patch
}

build() {
  cd "$srcdir/$pkgname/src/vio2sf"
  make CFLAGS="$CFLAGS -c -fPIC" CXXFLAGS="$CXXFLAGS -c -fPIC"
  "${CXX-c++}" "$CFLAGS" -shared -lz -o libvio2sf.so desmume/*.o
}

package() {
  cd "$srcdir/$pkgname/src/vio2sf"
  install -D -m644 -t "$pkgdir/usr/include/vio2sf/desmume" desmume/{state,spu_exports,types}.h
  install -D -m644 -t "$pkgdir/usr/lib" libvio2sf.{a,so}
}

# vim:set sw=2 et:
