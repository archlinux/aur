# Maintainer: Hector Mtz-Seara <hseara # gmail.com>
# Maintainer: Vedran Miletic <vedran AT miletic DOT net>
# Contributor: Samo Turk <samo.turk@gmail.com>
pkgname=rdkit
pkgver=2023_03_1
pkgrel=1
pkgdesc="RDKit - A collection of cheminformatics and machine-learning software written in C++ and Python."
arch=("i686" "x86_64" "armv7h")
url="http://rdkit.org/"
license=('BSD')
depends=(python python-numpy python-cairocffi python-pillow boost boost-libs sqlite cairo eigen)
makedepends=('cmake>=3.1')
source=(
    "https://github.com/rdkit/rdkit/archive/Release_${pkgver}.tar.gz"
    '0001-Added-cstdint-include-6338.patch'
)
sha256sums=(
    'db346afbd0ba52c843926a2a62f8a38c7b774ffab37eaf382d789a824f21996c'
    '2dfa6ca2859bbedf2d148a946b6d6f1ce0aaf012b08c35e81f846cc3f1b950e9'
)
conflicts=('rdkit-python2' 'rdkit-git')
provides=(rdkit)


build() {
  cd ${srcdir}/${pkgname}-Release_${pkgver}
  patch -p1 -i ${srcdir}/0001-Added-cstdint-include-6338.patch
  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DRDK_INSTALL_INTREE=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRDK_BUILD_INCHI_SUPPORT=OFF \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DRDK_BUILD_CAIRO_SUPPORT=ON
  make
}

package() {
  cd ${srcdir}/${pkgname}-Release_${pkgver}/build
  make DESTDIR=${pkgdir} install 
}
