# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=libosmium
pkgver=2.15.1
pkgrel=1
pkgdesc="Fast and flexible C++ library for working with OpenStreetMap data."
url="http://osmcode.org/libosmium/"
arch=('any')
license=('custom')
makedepends=('cmake')
depends=('expat' 'zlib' 'bzip2' 'boost' 'boost-libs' 'protozero')
optdepends=('sparsehash: sparse-mem-table index map'
            'gdal: convert OSM geometries into OGR geometries'
            'geos: convert OSM geometries into GEOS geometries'
            'proj: project OSM coordinates into spatial reference systems'
            'doxygen: build Libosmium API documentation')
conflicts=('libosmium-git')
provides=('libosmium')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/osmcode/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake \
    -DINSTALL_GDALCPP=ON \
    -DINSTALL_PROTOZERO=ON \
    -DINSTALL_UTFCPP=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
	  ..
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  ctest
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('4c0fe0146aee20423d9526e88f205fe442257fdf26df19225e2bde6084bad0ef')
