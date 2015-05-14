# Maintainer: Matti Niemenmaa <matti.niemenmaa+aur ät iki dȯt fi>

pkgname=lazyusf2-git
pkgver=r65.679f709
pkgrel=1
pkgdesc="Library for decoding Nintendo DS Sound Format files using Mupen64plus"
arch=(i686 x86_64)
url='https://bitbucket.org/kode54/lazyusf2'
license=(GPL2 custom:CC0)
depends=(glibc zlib)
makedepends=(git grep)
source=(${pkgname}::git+https://bitbucket.org/kode54/lazyusf2.git
        makefile.patch
        LICENSE.CC0)
sha256sums=('SKIP'
            '7a48693ef6e9d41d7f0fa93094603b5decad888454a1fc9bbf6de8fdf88e3995'
            'a90051e82202a5dc51162127c6834f8434fb2ece57795317951420fe6a8f4562')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$pkgname"
  patch Makefile "$srcdir"/makefile.patch
}

build() {
  cd "$srcdir/$pkgname"
  ROPTS="-c -O3 -I."
  { grep \^flags /proc/cpuinfo | fgrep -qw ssse3 && ROPTS+=" -DARCH_MIN_SSSE3"; } ||
    { grep \^flags /proc/cpuinfo | fgrep -qw sse2 && ROPTS+=" -DARCH_MIN_SSE2"; }
  make liblazyusf.{a,so} CFLAGS="$CFLAGS -fPIC" ROPTS="$ROPTS"
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 -t "$pkgdir/usr/include" usf/usf.h
  install -D -m644 -t "$pkgdir/usr/lib" liblazyusf.{a,so}
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir"/LICENSE.CC0
}

# vim:set sw=2 et:
