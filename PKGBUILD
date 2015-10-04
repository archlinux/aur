pkgname=libupse-kode54-git
pkgver=r17.4a1ef31
pkgrel=3
pkgdesc="UPSE: the unix playstation sound emulator (kode54's fork)"
arch=(i686 x86_64)
url='https://github.com/kode54/libupse'
license=(GPL2 GPL3 BSD)
depends=(glibc zlib)
makedepends=(git)
source=(${pkgname}::git+https://github.com/kode54/libupse.git makefile.patch LICENSE.BSD)
sha256sums=('SKIP'
            '8b845895dce8519b121c08e60f7dbc74dc1ae3267d3affd765325372cf5e592b'
            'd9d4f5d400a8e04b361a012ee5b96a77f51405ba3739f613d332095774110ce4')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 < "$srcdir"/makefile.patch
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 -t "$pkgdir/usr/lib" libupse.so
  install -D -m644 -t "$pkgdir/usr/include" upse.h upse-types.h upse-container-xsf.h upse-eventloop.h upse-module.h
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir"/LICENSE.BSD
}

# vim:set sw=2 et:
