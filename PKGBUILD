# Maintainer: Yann Leprince <yann dot leprince at ylep dot fr>
pkgname=blitz
pkgver=0.10
pkgrel=1
pkgdesc="C++ Class library for scientific computing"
arch=('i686' 'x86_64')
url="http://www.sourceforge.net/projects/blitz/"
# The user is free to choose the license among ('Artistic2.0' 'BSD' 'LGPL3'),
# but we cannot express it here so we only mention the most permissive.
license=('BSD')
depends=('boost')
makedepends=()
conflicts=('blitz-cppqed-hg')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname/Blitz%2B%2B%20$pkgver/$pkgname-$pkgver.tar.gz"
        "blitz-0.10-gcc47.patch")
md5sums=('66268b92bda923735f2e3afc87dcb58a'
         '3f1d36d804e0de97b8f090cf2826ca61')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/blitz-0.10-gcc47.patch"
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
