# Maintainer: dreieck
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.dot.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=proj4
pkgver=4.9.3
pkgrel=1
pkgdesc='Cartographic Projections library. Legacy version 4.x'
arch=(
  'i686'
  'x86_64'
)
url="https://proj.org/"
license=('MIT')
depends=(
  'curl'
  'glibc'
  'libtiff'
  'sqlite'
)
makedepends=(
  'cmake'
  'gmock'
  'gtest'
)
provides=(
  "libproj4=${pkgver}"
)
conflicts=(
  'libproj4'
  'proj'
)
source=(
  "https://download.osgeo.org/proj/proj-${pkgver}.tar.gz"
)
sha256sums=(
  '6984542fea333488de5c82eea58d699e4aff4b359200a9971537cd7e047185f7'
)

build() {
  cd "${srcdir}"

  cmake \
    -S "proj-${pkgver}" \
    -B build \
    -DBUILD_CS2CS=ON \
    -DBUILD_GEOD=ON \
    -DBUILD_LIBPROJ_SHARED=ON \
    -DBUILD_NAD2BIN=ON \
    -DBUILD_PROJ=ON \
    -DBUILD_TESTING=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DJNI_SUPPORT=ON \
    -DPROJ4_TESTS=ON \
    -DSELFTEST=OFF \
    -DUSE_THREAD=ON \
    -DUSE_EXTERNAL_GTEST=ON
  cmake --build build
}

# check(){
#   cd "${srcdir}"
# 
#   ctest --test-dir build
# }

package() {
  cd "${srcdir}"

  DESTDIR="${pkgdir}" cmake --install build
  install -D -v -m644 "proj-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _docfile in AUTHORS ChangeLog NEWS README; do
    install -D -v -m644 "proj-${pkgver}/${_docfile}" "${pkgdir}/usr/share/doc/${pkgname}/${_docfile}"
  done
}
