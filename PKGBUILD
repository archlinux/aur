# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=macaulay2
pkgver=14130.4947cfd
pkgrel=1
pkgdesc="Software system for algebraic geometry and commutative algebra"
arch=('i686' 'x86_64')
url="http://www.math.uiuc.edu/Macaulay2/"
license=('GPL')
depends=('gcc-fortran' 'gdbm' 'gmp' 'readline' 'lapack' 'scscp' 'gc'
         'singular-factory' 'frobby' 'glpk' 'cddlib' 'gfan' 'gtest' 'readline7')
makedepends=('git' 'unzip' 'emacs' 'texinfo')
source=('git+https://github.com/Macaulay2/M2')

pkgver() {
  cd "${srcdir}"/M2
  echo `git rev-list --count master`.`git rev-parse --short master`
}

build() {
  cd "$srcdir"/M2/M2

  # Things that are always built include mpir, mpfr and flint
  # Not included is factory (compiled against a different enough flint)
  # We need to either stop using shared factory or start using shared flint
  # Choose shared flint because only mpir and mpfr have good reasons listed
  sed -i -e '/BUILD_ALWAYS="flint/d' configure.ac
  sed -i -e 's/then BUILD_flint=yes/then BUILD_flint=no/' configure.ac
  sed -i -e 's/IgnoreExampleErrors ?= false/IgnoreExampleErrors ?= true/' Macaulay2/packages/Makefile.in

  # Some provided examples will make M2 crash if the -q option is used.
  # Removing -q works, but it might require ~/.Macaulay2/init.m2 to be present.
  sed -i -e 's/" -q"/""/' Macaulay2/m2/html.m2
  sed -i -e 's/ -q//' Macaulay2/packages/Macaulay2Doc/test/Makefile.test.in

  # Needed for the mpir step
  [[ "$CARCH" == "i686" ]] && export ABI=32
  # Make it find factory
  export CPPFLAGS+=" -I/usr/include/singular"
  autoreconf

  make
  ./configure LIBS="-lcblas" --prefix=/usr \
    --libexecdir='${prefix}'/lib/Macaulay2 \
    --enable-shared --enable-download \
    --enable-frobby --enable-pari --disable-gfan

  make -j1
}

package() {
  cd "$srcdir"/M2/M2
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr/share
  mv info info-mac
  mkdir info
  mv info-mac info/Macaulay2
}
md5sums=('SKIP')
