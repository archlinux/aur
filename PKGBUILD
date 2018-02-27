# Maintainer: Matti Niemenmaa <matti.niemenmaa+aur ät iki dȯt fi>

pkgname=lazyusf2-git
pkgver=r83.95d71f6
pkgrel=1
pkgdesc="Library for decoding Nintendo 64 Sound Format files using Mupen64plus"
arch=(i686 x86_64)
url='https://bitbucket.org/kode54/lazyusf2'
license=(GPL2 custom:CC0)
depends=(zlib)
makedepends=(git grep)
source=(${pkgname}::git+https://bitbucket.org/kode54/lazyusf2.git
        makefile.patch
        LICENSE.CC0)
sha256sums=('SKIP'
            '42eda354f4e97a0235ea747a1b0b1edf3c4e9eeec3655d3f9f9514605c2a9180'
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
  OPTFLAGS=$CFLAGS
  { gcc $CFLAGS -dM -E - </dev/null | fgrep -qw __SSSE3__ && OPTFLAGS+=" -DARCH_MIN_SSSE3"; } ||
    { gcc $CFLAGS -dM -E - </dev/null | fgrep -qw __SSE2__ && OPTFLAGS+=" -DARCH_MIN_SSE2"; }
  export LDFLAGS="$LDFLAGS -Wl,-Bsymbolic"
  make liblazyusf.{a,so} OPTFLAGS="$OPTFLAGS -Irsp_hle/msvc-compat"
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 -t "$pkgdir/usr/include" usf/usf.h
  install -D -m644 -t "$pkgdir/usr/lib" liblazyusf.{a,so.*}
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir"/LICENSE.CC0
  ldconfig -n "$pkgdir/usr/lib"
  cd "$pkgdir/usr/lib"
  ln -sf liblazyusf.so.*.0 liblazyusf.so
}

# vim:set sw=2 et:
