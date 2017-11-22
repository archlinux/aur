# Maintainer: Yann Leprince <yann dot leprince at ylep dot fr>
pkgname=blitz
pkgver=1.0.1
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
source=("https://github.com/blitzpp/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('fe43e2cf6c9258bc8b369264dd008971')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i -e 's/python/python2/g' \
      blitz/generate/Makefile.in \
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
