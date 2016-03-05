# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>
# Maintainer: SaultDon <sault.don gmail>
# Contributor: Luigi Ranghetti <luigi.ranghetti@gmail.com>
# Contributor: Dominik Fuchs <dominik.fuchs@wur.nl>
# Contributor: Marcelo Avalos Tejeda <marcelo.avalos@gmail.com>

pkgname=saga-gis
_pkgname=saga
pkgver=2.2.5
pkgrel=1
pkgdesc="A Geographic Information System (GIS) software with immense capabilities for geodata processing and analysis."
url="http://www.saga-gis.org"
license=("GPL3")
arch=('i686' 'x86_64')
depends=('wxgtk>=3.0.0'
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
source=("http://iweb.dl.sourceforge.net/project/saga-gis/SAGA%20-%202.2/SAGA%20${pkgver}/saga_${pkgver}.tar.gz")
md5sums=('1553a967e8859d13bb8878f06a4ea549')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  #rm aclocal.m4 
  #aclocal
  #autoheader
  #libtoolize
  #automake --add-missing
  
  autoreconf -i

  ./configure --prefix=/usr \
              --enable-debug \
              --enable-shared \
              --enable-python PYTHON_VERSION=2.7 PYTHON=/usr/bin/python2 \
              --with-postgresql=/usr/bin/pg_config \
              CXXFLAGS="`wx-config --version=3.0 --cxxflags`" \
              LIBS="`wx-config --version=3.0 --libs`"

  msg "Start compiling ..."
  make -j5
}

package () {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/src/saga_core/saga_gui/res/saga.png" \
                   "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
