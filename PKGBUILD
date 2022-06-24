# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=macaulay2
pkgver=19030.995c6fd8c
pkgrel=1
pkgdesc="Software system for algebraic geometry and commutative algebra"
arch=('i686' 'x86_64')
url="http://www.math.uiuc.edu/Macaulay2/"
license=('GPL')
depends=('gcc-fortran' 'readline' 'gdbm' 'gc' 'mpir' 'mpfr' 'mpsolve-git' 'boost' 'lapack' 'cblas' 'eigen' 'ntl' 'scscp' 'singular-factory' 'frobby' 'flint' 'cddlib' 'glpk' 'gfan' 'gtest' 'givaro')
makedepends=('git' 'unzip' 'emacs' 'texinfo' 'gcc10')
source=('git+https://github.com/Macaulay2/M2')

pkgver() {
  cd "${srcdir}"/M2
  echo `git rev-list --count master`.`git rev-parse --short master`
}

build() {
  cd "$srcdir"/M2/M2

  # Some provided examples will make M2 crash if the -q option is used.
  # Removing -q works, but it might require ~/.Macaulay2/init.m2 to be present.
  sed -i -e 's|GTEST_PATH="\$(BUILTLIBPATH)/include/gtest"|GTEST_PATH="/usr/src/googletest"|g' configure.ac
  sed -i -e 's/IgnoreExampleErrors ?= false/IgnoreExampleErrors ?= true/' Macaulay2/packages/Makefile.in
  sed -i -e 's/ -q//' Macaulay2/packages/Makefile.in

  # M2 recommends to run make first which runs autoconf and autoheader
  make
  #autoreconf
  # Now run configure and then make again
  ./configure "LIBS=-lcblas" --prefix=/usr \
    --libexecdir='${prefix}'/lib/Macaulay2 \
    --enable-shared --enable-download \
    --enable-frobby --enable-pari --disable-gfan
  make -j1
}

package() {
  cd "$srcdir"/M2/M2
  mkdir "$pkgdir"/usr

  # If we used DESTDIR instead, the submodules would create /var/abs/local/ within /var/abs/local/
  # We would also not get the utilities in /usr/lib/Macaulay2/Macaulay2/bin/
  make install prefix="$pkgdir"/usr

  cd "$pkgdir"/usr/share
  mv info info-mac
  mkdir info
  mv info-mac info/Macaulay2
}
md5sums=('SKIP')
