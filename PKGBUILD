# Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Maintainer: SaultDon <sault.don gmail>
# Contributor: Luigi Ranghetti <luigi.ranghetti@gmail.com>
# Contributor: Dominik Fuchs <dominik.fuchs@wur.nl>
# Contributor: Marcelo Avalos Tejeda <marcelo.avalos@gmail.com>

pkgname=saga-gis
_pkgname=saga
pkgver=6.4.0
pkgrel=1
pkgdesc="A Geographic Information System (GIS) software with immense capabilities for geodata processing and analysis."
url="http://www.saga-gis.org"
license=("GPL3")
arch=('i686' 'x86_64')
depends=('wxgtk'
         'proj'
         'gdal'
         'libtiff'
         'unixodbc'
         'jasper'
         'swig')
optdepends=('opencv'
            'vigra'
            'liblas'
            'libharu')
source=("https://sourceforge.net/projects/saga-gis/files/SAGA - 6/SAGA - ${pkgver}/saga-${pkgver}.tar.gz")
md5sums=('8c4da533c439c0a09a6417b1a64c14f3')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  autoreconf -i

  ./configure --prefix=/usr \
              --enable-shared \
              --enable-python PYTHON_VERSION=2.7 PYTHON=/usr/bin/python2 \
              --with-postgresql=/usr/bin/pg_config \
              CXXFLAGS="`wx-config --version=3.0 --cxxflags`" \
              LIBS="`wx-config --version=3.0 --libs`"

  msg "Start compiling ..."
  make -j3
}

package () {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/src/saga_core/saga_gui/res/saga.png" \
                   "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
