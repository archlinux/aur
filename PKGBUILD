# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=Herwig
pkgname=herwig
pkgver=7.1.0
pkgrel=1
pkgdesc="Herwig is a multi-purpose particle physics event generator."
arch=('i686' 'x86_64')
url="http://herwig.hepforge.org"
license=('GPL2')
depends=("gcc-fortran" "thepeg>=2.1.0" "fastjet" "gsl" "boost-libs" "lhapdf")
makedepends=("sudo" "sed")
source=("http://www.hepforge.org/archive/${pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('a18cd1a5a399789ceb019393df817b08540d1d37af55375a82c0436d46ee8c3e8e8da5fed12431af0b3194be23b2b7ad75834da037c977b6b157a752f1dd90bd')

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

  ./configure --prefix=/usr \
              --with-pdf=/usr \
              --with-gsl=/usr \
              --with-thepeg=/usr \
              --with-boost=/usr \
              --with-fastjet=/usr
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
