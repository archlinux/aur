# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=Herwig
pkgname=herwig
pkgver=7.1.5
pkgrel=1
pkgdesc="Herwig is a multi-purpose particle physics event generator."
arch=('x86_64')
url="http://herwig.hepforge.org"
license=('GPL2')
depends=("gcc-fortran" "thepeg" "boost-libs" "fastjet" "gsl" "lhapdf")
makedepends=("sudo" "sed")
source=("http://www.hepforge.org/archive/${pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('a56a5be3c27244deb39486671a5cc40e95685aa22ebcab70c413cc2aaf5f124166e9c8b7f42da1e15762b6ca8ba96fc7b71982fdfea06a77ddc7c2c9dc9b7aca')

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
