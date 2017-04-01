# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=ThePEG
pkgname=thepeg
pkgver=2.0.4
pkgrel=2
pkgdesc="Toolkit for High Energy Physics Event Generation"
arch=("i686" "x86_64")
url="http://thepeg.hepforge.org"
license=('GPL2')
depends=("gsl" "lhapdf" "hepmc" "rivet" "zlib" "fastjet" "boost")
makedepends=("sed")
source=("http://www.hepforge.org/archive/${pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('f3b625b411667e2708995f1d1379b5b8691406853c8c2cca2f4e4e6e062da0e4')

prepare() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  sed -i 's/isnan/std::isnan/g' Persistency/PersistentOStream.h \
      LesHouches/LesHouchesFileReader.cc \
      Utilities/UnitIO.h
  sed -i 's/isinf/std::isinf/g' Persistency/PersistentOStream.h \
      Utilities/UnitIO.h
}

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr --with-lhapdf=/usr --with-fastjet=/usr --enable-unitchecks
  make ${MAKEFLAGS}
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
