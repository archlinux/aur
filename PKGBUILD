# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=Herwig
pkgname=herwig
pkgver=7.2.2
pkgrel=1
pkgdesc="Herwig is a multi-purpose particle physics event generator."
arch=('x86_64')
url="http://herwig.hepforge.org"
license=('GPL2')
depends=("gcc-fortran" "thepeg" "boost-libs" "fastjet" "gsl" "lhapdf")
makedepends=("sudo" "sed")
source=("http://www.hepforge.org/archive/${pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('3c0a08281ebea62370e6ed0262b731c7b0358d7aa2ce2e59d6a56c5f486ba31b25c9c9ad9d91476a4ec3c9998c361631a0e2b311b102f9a8b03aeb3fb5de1191')

prepare() {
  pdfs=(MMHT2014nlo68cl MMHT2014lo68cl)
  lhapdfdata=$(lhapdf-config --datadir)
  for p in "${pdfs[@]}"; do
    if [ ! -d "${lhapdfdata}/$p" ]; then
        sudo lhapdf install "$p"
    else
        sudo lhapdf upgrade "$p"
    fi
  done

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
