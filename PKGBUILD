# Maintainer: envolution
# Contributor: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Contributor: Marcos Piccinini <x@nofxx.com>
# Contributor: Jonathan Hudson <jh+arch@daria.co.uk>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=mapserver
pkgver=8.4.1
pkgrel=1
pkgdesc="Platform for publishing spatial data and interactive mapping applications to the web"
arch=(i686 x86_64)
license=("Apache-2.0" "BSD-2-Clause")
url="http://www.mapserver.org"
depends=(
  gdal
  proj
  libpng
  freetype2
  fribidi
  fcgi
  libjpeg-turbo
  zlib
  curl
  libxml2
  geos
  gcc-libs
  libxslt
  pcre2
  glibc
  cairo
  giflib
  harfbuzz
  protobuf-c
  python
  python-pillow
  postgresql-libs
)
makedepends=(cmake swig)
provides=(python-mapserver)
source=("http://download.osgeo.org/mapserver/mapserver-${pkgver}.tar.gz")
md5sums=('45f933ed9fd521e80018cd4bf25a3f4e')

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  #The following options are enabled by default
  # WITH_PROJ, WITH_WMS, WITH_FRIBIDI,
  # WITH_HARFBUZZ, WITH_ICONV, WITH_CAIRO,
  # WITH_FCGI, WITH_GEOS, WITH_POSTGIS,
  # WITH_GDAL, WITH_OGR, WITH_WFS,
  # WITH_WCS, WITH_LIBXML2, WITH_GIF.
  #svgcairo broken in AUR
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_SVGCAIRO=OFF \
    ../ >../configure.out.txt

  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR=${pkgdir} install

  #Copy the headers a include for ZooWPS project
  install -d "$pkgdir"/usr/include/mapserver
  install -d "$pkgdir"/usr/share/mapserver
  install -d "$pkgdir"/opt/mapserver/test/
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}"/build/*.h "$pkgdir"/usr/include/mapserver/
  cp -rfv "${srcdir}/${pkgname}-${pkgver}"/share/ogcapi "$pkgdir"/usr/share/mapserver
  cp -rfv "${srcdir}/${pkgname}-${pkgver}"/tests/* "$pkgdir"/opt/mapserver/test
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/flatgeobuf/LICENSE" \
    ${pkgdir}/usr/share/licenses/${pkgname}/FlatGeoBuf-LICENSE
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/flatgeobuf/include/flatbuffers/LICENSE" \
    ${pkgdir}/usr/share/licenses/${pkgname}/FlatBuffers-LICENSE
}
# vim:set ts=2 sw=2 et:
