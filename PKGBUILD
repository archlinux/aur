# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=Herwig
pkgname=herwig
pkgver=7.0.4
pkgrel=4
pkgdesc="Herwig is a multi-purpose particle physics event generator."
arch=('i686' 'x86_64')
url="http://herwig.hepforge.org"
license=('GPL2')
depends=("gcc-fortran" "thepeg>=2.0.4" "fastjet" "gsl" "boost-libs" "lhapdf")
makedepends=("sed" "sudo")
source=("http://www.hepforge.org/archive/${pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('e6265f6cae2944b022ee2f1495b0abdd7ed1b50fdda81063f8c17acf8a2f4ced')

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
  sed -i 's/isnan/std::isnan/g' Decay/Radiation/FFDipole.cc \
      Decay/Radiation/IFDipole.cc \
      PDF/MRST.cc \
      Shower/Default/QTildeReconstructor.cc \
      DipoleShower/Base/DipoleSplittingGenerator.cc \
      DipoleShower/DipoleShowerHandler.cc \
      MatrixElement/Powheg/MEqq2W2ffPowheg.cc \
      MatrixElement/Powheg/MEPP2WHPowheg.cc \
      MatrixElement/Powheg/MEqq2gZ2ffPowheg.cc \
      MatrixElement/Powheg/MEPP2ZHPowheg.cc \
      MatrixElement/Powheg/MEPP2VVPowheg.cc \
      MatrixElement/Matchbox/Base/MatchboxMEBase.cc \
      MatrixElement/Matchbox/Utility/ColourBasis.cc \
      Analysis/BasicConsistency.cc \
      Sampling/GeneralStatistics.h \
      Sampling/GeneralSampler.cc \
      Sampling/MonacoSampler.cc \
      Sampling/BinSampler.cc
  sed -i 's/isinf/std::isinf/g' PDF/MRST.cc \
      DipoleShower/Base/DipoleSplittingGenerator.cc \
      MatrixElement/Powheg/MEqq2W2ffPowheg.cc \
      MatrixElement/Powheg/MEPP2WHPowheg.cc \
      MatrixElement/Powheg/MEqq2gZ2ffPowheg.cc \
      MatrixElement/Powheg/MEPP2ZHPowheg.cc \
      MatrixElement/Powheg/MEPP2VVPowheg.cc \
      MatrixElement/Matchbox/Base/MatchboxMEBase.cc \
      Analysis/BasicConsistency.cc \
      Sampling/GeneralStatistics.h \
      Sampling/GeneralSampler.cc \
      Sampling/MonacoSampler.cc \
      Sampling/BinSampler.cc
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
