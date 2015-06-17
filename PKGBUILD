# Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa@linuxmail.org>
# Maintainer: Luigi Ranghetti <luigi.ranghetti@gmail.com>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Donovan Cameron <sault.don@gmail.com>
# Contributor: Dominik Fuchs <dominik.fuchs@wur.nl>
# Contributor: Marcelo Avalos Tejeda <marcelo.avalos@gmail.com>

pkgname=saga-gis
pkgver=2.1.4
pkgrel=2
pkgdesc="SAGA -System for Automated Geoscientific Analyses- is a hybrid GIS software"
url="http://www.saga-gis.org"
license="GPL"
arch=('i686' 'x86_64')
depends=('wxgtk' 'wxpython' 'proj' 'gdal>=1.10.0' 'jasper>=1.900.1' 'libtiff>=3.8.2' 'unixodbc>=2.2.14' 'libharu' 'swig')
optdepends=('opencv' 'vigra' 'liblas')
source=("http://sourceforge.net/projects/saga-gis/files/SAGA - 2.1/SAGA ${pkgver}/saga_${pkgver}.tar.gz"
        "https://www.dropbox.com/s/zcjugzxvd6y85al/include.tar.gz"
        "http://www.saga-gis.org/_images/logo_saga.png"
        saga-gis.desktop)

md5sums=('c7b953a2d2d1276df93a1947c1a8e741'
         '9d545aae9e268652dbc7658d99e5d4c9'
         '7743fbcca4c903d4578a6e7f020a002b'
         'cc5115a3418178a88f044045ef2fa65e')

build() {
  cd $srcdir/saga-${pkgver}

  #sed -e '\#src/modules/imagery/imagery_photogrammetry/Makefile#d' -i configure.ac

  aclocal
  autoheader
  libtoolize
  automake --add-missing
  autoreconf -i

  ./configure --prefix=/usr --enable-debug --enable-shared --enable-python PYTHON_VERSION=2.7 PYTHON=/usr/bin/python2 \
	--with-postgresql=/usr/bin/pg_config CXXFLAGS="`wx-config --version=3.0 --cxxflags`" \
	LIBS="`wx-config --version=3.0 --libs`" CPPFLAGS="-I$srcdir/include" \

  make clean

  msg "Start compiling ..."
  make -j5 || return 1

}

package () {

  cd "${srcdir}/saga-${pkgver}"
  make DESTDIR="${pkgdir}" install

  mkdir -p $srcdir/pkg/${pkgname}/usr/share/{applications,pixmaps}
  install -D -m644 $srcdir/logo_saga.png $pkgdir/${pkgname}/usr/share/pixmaps/${pkgname}.png
  install -D -m644 $srcdir/${pkgname}.desktop $pkgdir/pkg/${pkgname}/usr/share/applications/${pkgname}.desktop

}
