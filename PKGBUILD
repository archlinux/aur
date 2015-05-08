pkgname=psflib-git
pkgver=r26.4d957c2
pkgrel=1
pkgdesc="A small C library for reading Portable Sound Format files"
arch=(i686 x86_64)
url='https://github.com/kode54/psflib'
license=(custom:MIT)
depends=(glibc zlib)
makedepends=(git)
source=(${pkgname}::git+https://github.com/kode54/psflib.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname"
  make CFLAGS="$CFLAGS -fPIC -c"
  "${CC-cc}" "$CFLAGS" -shared -lz -o libpsflib.so *.o
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 -t "$pkgdir/usr/include" psflib.h psf2fs.h
  install -D -m644 -t "$pkgdir/usr/lib" libpsflib.{a,so}
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set sw=2 et:
