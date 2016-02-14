# Maintainer: gileri <twiked at gmail d(0)t com>
pkgname=libosmium-git
pkgver=v2.6.0.r3.ge723fc4
pkgrel=1
pkgdesc="Fast and flexible C++ library for working with OpenStreetMap data."
url="http://osmcode.org/libosmium/"
arch=('x86_64' 'i686')
license=('custom')
depends=('expat' 'zlib' 'bzip2' 'boost-libs')
optdepends=('sparsehash: sparse-mem-table index map'
            'gdal: convert OSM geometries into OGR geometries'
            'geos: convert OSM geometries into GEOS geometries'
            'proj: project OSM coordinates into spatial reference systems'
            'doxygen: build Libosmium API documentation')
conflicts=('libosmium')
provides=('libosmium')
source=('libosmium::git+https://github.com/osmcode/libosmium.git')
md5sums=('SKIP')

pkgver() {
  cd libosmium
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir "${srcdir}"/libosmium/build
  cd libosmium/build
  cmake \
        -DINSTALL_GDALCPP=ON \
        -DINSTALL_PROTOZERO=ON \
        -DINSTALL_UTFCPP=ON \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX:PATH=/usr \
	..
  make
}

package() {
  cd "${srcdir}/libosmium/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
