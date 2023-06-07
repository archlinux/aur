# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=Herwig
pkgname=herwig
pkgver=7.2.3
pkgrel=1
pkgdesc="Herwig is a multi-purpose particle physics event generator."
arch=('x86_64')
url="http://herwig.hepforge.org"
license=('GPL2')
depends=("gcc-fortran" "thepeg" "boost-libs" "fastjet" "gsl" "lhapdf")
makedepends=('herwig_lhapdf_config')
source=("http://www.hepforge.org/archive/${pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('5599899379b01b09e331a2426d78d39b7f6ec126db2543e9d340aefe6aa50f84')

prepare() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  sed -i 's/lib\/libgsl.a/lib\/libgsl.so/' configure
}

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  # from gcc 10, it enforces type mismatching.
  export FCFLAGS="${FCFLAGS} -fallow-argument-mismatch"
  ./configure --prefix=/usr --with-thepeg=/usr
  make ${MAKEFLAGS}
}

check() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  LD_LIBRARY_PATH="/usr/lib/ThePEG${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH" \
                 make check
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  LD_LIBRARY_PATH="/usr/lib/ThePEG${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH" \
                 make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
