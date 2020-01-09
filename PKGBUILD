# Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Maintainer: SaultDon <sault.don gmail>
# Contributor: Luigi Ranghetti <luigi.ranghetti@gmail.com>
# Contributor: Dominik Fuchs <dominik.fuchs@wur.nl>
# Contributor: Marcelo Avalos Tejeda <marcelo.avalos@gmail.com>

pkgname=saga-gis
_pkgname=saga
pkgver=7.5.0
pkgrel=2
pkgdesc="A Geographic Information System (GIS) software with immense capabilities for geodata processing and analysis."
url="http://www.saga-gis.org"
license=("GPL3")
arch=('i686' 'x86_64')
depends=('wxgtk'
         'proj' 'lua-hpdf'
         'gdal'
         'libtiff'
         'unixodbc'
         'jasper'
         'swig')
optdepends=('opencv3-opt'
            'vigra'
            'liblas'
            'libharu' 'libsvm')
source=("https://sourceforge.net/projects/saga-gis/files/SAGA - 7/SAGA - ${pkgver}/saga-${pkgver}.tar.gz")
md5sums=('36f3a4108eff901e0bb197f5b27d09af')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  autoreconf -i

  ./configure --prefix=/usr \
              --enable-shared \
              --enable-python PYTHON_VERSION=3 PYTHON=/usr/bin/python \
              --with-postgresql=/usr/bin/pg_config \
              --with-gdal=/usr/bin/gdal-config \
              CXXFLAGS="`wx-config --version=3.0 --cxxflags` -I/opt/opencv3/include/" \
              LIBS="`wx-config --version=3.0 --libs`" \
              LDFLAGS="-L/opt/opencv3/lib/"

  msg "Start compiling ..."
  make -j$(nproc)
}

package () {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/src/saga_core/saga_gui/res/saga.png" \
                   "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
