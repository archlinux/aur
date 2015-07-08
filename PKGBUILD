# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=macaulay2
pkgver=12992.639ac3c
pkgrel=1
pkgdesc="Software system for algebraic geometry and commutative algebra"
arch=('i686' 'x86_64')
url="http://www.math.uiuc.edu/Macaulay2/"
license=('GPL')
depends=('gcc-fortran' 'gdbm' 'gmp' 'readline' 'lapack' 'scscp' 'gc'
         'singular-factory' 'frobby' 'glpk' 'cddlib' 'gfan' 'gtest')
makedepends=('git' 'unzip' 'emacs')
source=('git+https://github.com/Macaulay2/M2')

pkgver() {
  cd "${srcdir}"/M2
  echo `git rev-list --count master`.`git rev-parse --short master`
}

build() {
  cd "$srcdir"/M2/M2
  sed -i -e '/lgfortran/d' configure.ac
  sed -i -e 's/if 1/if 0/' Macaulay2/e/x-factor.cpp
  sed -i -e 's/IgnoreExampleErrors ?= false/IgnoreExampleErrors ?= true/' Macaulay2/packages/Makefile.in

  # Some provided examples will make M2 crash if the -q option is used.
  # Removing -q works, but it might require ~/.Macaulay2/init.m2 to be present.
  sed -i -e 's/" -q"/""/' Macaulay2/m2/html.m2
  sed -i -e 's/ -q//' Macaulay2/packages/Macaulay2Doc/test/Makefile.test.in

  # Make it find factory.
  export CPPFLAGS+=" -I/usr/include/singular"
  autoreconf

  make
  # This builds mpir, mpfr and ntl no matter what.
  # Not sure why it crashes with the newest pari.
  ./configure LIBS="-lgmp" --prefix=/usr \
    --libexecdir='${prefix}'/lib/Macaulay2 \
    --enable-shared --enable-download \
    --enable-frobby --enable-pari \
    --enable-build-libraries=pari \
    --disable-gfan
    #--with-unbuilt-programs=gfan

  make -j1
}

package() {
  cd "$srcdir"/M2/M2
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr/share
  mv info info-mac
  mkdir info
  mv info-mac info/Macaulay2
  #rm -rf "$pkgdir/usr/lib/Macaulay2/*Linux*/lib"
}
md5sums=('SKIP')
