# Maintainer: Justus Spitzmueller <j.spitzmueller at posteo.de>
# Contributor: Luigi Ranghetti <luigi.ranghetti@gmail.com>
# Contributor: Dominik Fuchs <dominik.fuchs@wur.nl>
# Contributor: Marcelo Avalos Tejeda <marcelo.avalos@gmail.com>
# Contributor: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Contributor: SaultDon <sault.don gmail>

pkgname=saga-gis
_pkgname=saga
pkgver=9.0.2
pkgrel=1
pkgdesc="A Geographic Information System (GIS) software with immense capabilities for geodata processing and analysis."
url="http://www.saga-gis.org"
license=('GPL3' 'LGPL3')
arch=('i686' 'x86_64')
depends=('wxwidgets-gtk3' 'proj' 'gdal' 'libtiff' 'unixodbc' 'opencv' 'pdal')
optdepends=('postgresql' 'vigra' 'liblas' 'libharu' 'libsvm' 'swig' 'python')
makedepends=('cmake')
source=("https://download.sourceforge.net/saga-gis/saga-${pkgver}.tar.gz") 
sha256sums=('772aae9ee44e4251752e8fd7b0d8fd42537b59b8a692c7d3d6cf13aea07d3d71')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  [[ -d build ]] || mkdir build

  cd "${srcdir}/${_pkgname}-${pkgver}/build"

  cmake -G "Unix Makefiles" ../saga-gis \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr/ \
  -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config   \
  -DWITH_CLIPPER_ONE:BOOL=OFF 

  msg "Start compiling ..."
  cmake --build . --verbose
}


package () {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${pkgname}/src/saga_core/saga_gui/res/saga.png" \
                   "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
