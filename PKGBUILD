pkgname=aopsf-git
pkgver=r40.3a3f594
pkgrel=2
pkgdesc="Audio Overload's PSF core, now in a proper library"
arch=(x86_64)
url='https://github.com/derselbst/aopsf'
license=(BSD)
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(${pkgname}::git+https://github.com/derselbst/aopsf.git LICENSE.BSD)
sha256sums=('SKIP' '3fb3258f12e481be1326b6931269b55866bb3ed5c0e769ecad83f9e71c3cdfca')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname"
  make libaopsf.so OPTFLAGS="$CFLAGS"
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 -t "$pkgdir/usr/lib" libaopsf.so.0
  install -D -m644 -t "$pkgdir/usr/include/aopsf" psx_external.h ao.h
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir"/LICENSE.BSD
  ln -sf libaopsf.so.0 "$pkgdir/usr/lib/libaopsf.so"
}

# vim:set sw=2 et:
