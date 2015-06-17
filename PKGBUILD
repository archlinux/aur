# Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa at linuxmail.org>

pkgname=horao-git
_pkgname=horao
pkgver=0
pkgrel=2
pkgdesc="Oslandia's 3D visualisation stack with QGIS plugin"
arch=(i686 x86_64)
url="http://oslandia.github.io/horao/"
license=('LGPL')
depends=('openscenegraph' 'postgis' 'postgis-sfcgal')
makedepends=('openmpi' 'cmake' 'boost')
optdepends=('qgis')
provides=()
conflicts=()
replaces=()
options=()
source=('horao'::'git://github.com/Oslandia/horao.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/horao
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
   cd "$srcdir/$_pkgname"
   
   sed -i "s#<gdal/gdal_priv.h>#<gdal_priv.h>#g" src/osgGIS/ReaderWriterMNT.cpp
   sed -i "s#<gdal/cpl_conv.h>#<cpl_conv.h>#g" src/osgGIS/ReaderWriterMNT.cpp
   sed -i "s#<gdal/gdal_priv.h>#<gdal_priv.h>#g" src/osgGIS/ReaderWriterPOSTGIS.cpp
   sed -i "s#<gdal/cpl_conv.h>#<cpl_conv.h>#g" src/osgGIS/ReaderWriterPOSTGIS.cpp
}

build() {
  cd "$srcdir/$_pkgname"
  if [ -d build ]; then
      rm -rf build
    fi
    mkdir build
    cd build

    cmake ../ \
    -DCMAKE_INSTALL_PREFIX=/usr

    make -j10
}

package() {
  cd "$srcdir/$_pkgname/build"

  make DESTDIR="$pkgdir/" install

  mkdir -p ${pkgdir}/usr/share/qgis/python/plugins/

  cp -dpr --no-preserve=ownership "$srcdir/$_pkgname/qgis_plugin" "$pkgdir/usr/share/qgis/python/plugins/horao"

}
