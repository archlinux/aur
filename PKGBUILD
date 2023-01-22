# Maintainer: Aleksandar Trifunovic akstrfn gmail.com
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=libosmium
pkgver=2.19.0
pkgrel=1
pkgdesc="Fast and flexible C++ library for working with OpenStreetMap data."
url="https://osmcode.org/libosmium/"
arch=('any')
license=('custom')
makedepends=('cmake')
depends=('expat' 'zlib' 'bzip2' 'boost' 'boost-libs' 'protozero')
optdepends=('sparsehash: sparse-mem-table index map'
            'gdal: convert OSM geometries into OGR geometries'
            'geos: convert OSM geometries into GEOS geometries'
            'proj: project OSM coordinates into spatial reference systems'
            'lz4: use LZ4 compression in PBF files'
            'doxygen: build Libosmium API documentation')
conflicts=('libosmium-git')
provides=('libosmium')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/osmcode/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6911a8ca8e81d49205357177982df908af11376919f93b814cccf02f1d4d63e3')

build() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake \
    -DINSTALL_GDALCPP=ON \
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

