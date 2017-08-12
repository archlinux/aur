# Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Maintainer: SaultDon <sault.don gmail>
# Contributor: Luigi Ranghetti <luigi.ranghetti@gmail.com>
# Contributor: Dominik Fuchs <dominik.fuchs@wur.nl>
# Contributor: Marcelo Avalos Tejeda <marcelo.avalos@gmail.com>

pkgname=saga-gis-ltr
_pkgname=saga
pkgver=2.3.1
pkgrel=1
pkgdesc="A Geographic Information System (GIS) software with immense capabilities for geodata processing and analysis. Compactible with QGIS"
url="http://www.saga-gis.org"
license=("GPL3")
arch=('i686' 'x86_64')
provides=("saga-gis")
conflicts=("saga-gis")
depends=('wxgtk'
         'proj'
         'gdal'
         'libtiff'
         'unixodbc'
         'jasper'
         'swig')
optdepends=('opencv2'
            'vigra'
            'liblas'
            'libharu')
source=("https://pilotfiber.dl.sourceforge.net/project/saga-gis/SAGA%20-%202/SAGA%202.3.1/saga_2.3.1.tar.gz")
md5sums=('035b2054790721028b97766e025bb340')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  autoreconf -i

  ./configure --prefix=/usr \
              --enable-debug \
              --enable-shared \
              --enable-python PYTHON_VERSION=2.7 PYTHON=/usr/bin/python2 \
              --with-postgresql=/usr/bin/pg_config \
              CXXFLAGS="`wx-config --version=3.0 --cxxflags`" \
              LIBS="`wx-config --version=3.0 --libs`"

  msg "Start compiling ..."
  make -j2
}

package () {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/src/saga_core/saga_gui/res/saga.png" \
                   "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
