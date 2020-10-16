# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=Herwig
pkgname=herwig
pkgver=7.2.1
pkgrel=1
pkgdesc="Herwig is a multi-purpose particle physics event generator."
arch=('x86_64')
url="http://herwig.hepforge.org"
license=('GPL2')
depends=("gcc-fortran" "thepeg" "boost-libs" "fastjet" "gsl" "lhapdf")
makedepends=("sudo" "sed")
source=("http://www.hepforge.org/archive/${pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('bd1e6a3ba019de290666f75e9514cf29d2b7c7ae60ebcae393adb978761074129a4e6c43355664fb371a2da879623b384697cd6fcfd38e263f2349f2ba1d6ba0')

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
