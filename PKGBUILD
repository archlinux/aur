# Maintainer: Yann Leprince <yann dot leprince at ylep dot fr>
pkgname=blitz
pkgver=1.0.0
pkgrel=1
pkgdesc="C++ Class library for scientific computing"
arch=('i686' 'x86_64')
url="https://github.com/blitzpp/blitz"
# The user is free to choose the license among ('Artistic2.0' 'BSD' 'LGPL3'),
# but we cannot express it here so we only mention the most permissive.
license=('BSD')
depends=('boost')
makedepends=()
conflicts=('blitz-cppqed-hg')
source=("https://github.com/blitzpp/$pkgname/archive/$pkgver.tar.gz"
        "blitz-0.10-gcc47.patch")
md5sums=('971c43e22318bbfe8da016e6ef596234'
         '3f1d36d804e0de97b8f090cf2826ca61')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/blitz-0.10-gcc47.patch"
  sed -i -e 's/python/python2/g' \
      blitz/generate/Makefile* \
      blitz/generate/genstencils.py
}

build() {
  local _conditional_options
  cd "$pkgname-$pkgver"

  if [ "$CARCH" = "x86_64" ]; then
    _conditional_options=--enable-64bit
  else
    # According to this bug report on
    # https://bugs.launchpad.net/ubuntu/+source/blitz++/+bug/1213144
    # we have to use --enable-simd-width=8
    _conditional_options=--enable-simd-width=8
  fi

  # Fortran is needed for benchmarks only
  ./configure \
      --prefix=/usr \
      --enable-shared \
      --enable-serialization \
      --disable-fortran \
      --disable-cxx-flags-preset \
      ${_conditional_options}

  make LDFLAGS="$LDFLAGS" lib
}

check() {
  cd "$pkgname-$pkgver"
  make -k check-testsuite
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
  make DESTDIR="$pkgdir/" install || return 1
}
