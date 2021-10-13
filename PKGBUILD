# Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Maintainer: SaultDon <sault.don gmail>
# Contributor: Luigi Ranghetti <luigi.ranghetti@gmail.com>
# Contributor: Dominik Fuchs <dominik.fuchs@wur.nl>
# Contributor: Marcelo Avalos Tejeda <marcelo.avalos@gmail.com>

pkgname=saga-gis
_pkgname=saga
pkgver=8.0.1
pkgrel=1
pkgdesc="A Geographic Information System (GIS) software with immense capabilities for geodata processing and analysis."
url="http://www.saga-gis.org"
license=("GPL3")
arch=('i686' 'x86_64')
depends=('wxgtk3>=3.1.0' 'proj' 'gdal' 'libtiff' 'unixodbc' 'jasper' 'swig' 'opencv' 'pdal')
optdepends=('lua-hpdf' 'vigra' 'liblas' 'libharu' 'libsvm')
source=("https://download.sourceforge.net/saga-gis/saga-${pkgver}.tar.gz")
md5sums=('38da7588f01f9c7d64c2155a8675a2d1')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  [[ -d build ]] || mkdir build

  cd "${srcdir}/${_pkgname}-${pkgver}/build"

  cmake -G "Unix Makefiles" ../saga-gis \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr/ \
  -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config   \
  -DWITH_GUI:BOOL=TRUE \
  -DWITH_TOOLS:BOOL=TRUE \
  -DLAS_INCLUDE:PATH= \
  -DLAS_LIBRARY:FILEPATH= \
  -DWITH_DEV_TOOLS:BOOL=TRUE 

  msg "Start compiling ..."
  make -j$(nproc)
}

package () {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${pkgname}/src/saga_core/saga_gui/res/saga.png" \
                   "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
