# Maintainer: Sylvain POULAIN <sylvain dot poulain at giscan dot com>
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: Bruno Pagani <archange@archlinux.org
# Contributor: Doug Newgard <scimmia at archlinux dot org>
# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Lantald < lantald at gmx.com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Eric Forgeot < http://esclinux.tk >

pkgname=qgis-qtwebkit
_pkgname=qgis
provides=('qqis=3.34.1')
conflicts=('qgis')
pkgver=3.34.1
pkgrel=2
pkgdesc="QGIS with GRASS and QtWebkit to support some plugins and qgis' functions"
arch=(x86_64)
url="https://qgis.org/"
license=(GPL)
depends=(ocl-icd proj geos gdal expat spatialindex qwt libzip sqlite3 protobuf
         zlib exiv2 postgresql-libs libspatialite zstd pdal
         qt5-base qt5-svg qt5-serialport qt5-location qt5-3d qt5-declarative qt5-multimedia
         qscintilla-qt5 qtkeychain-qt5 qca-qt5 gsl python-pyqt5 python-qscintilla-qt5
         hdf5 netcdf libxml2 draco grass python-pyqt5-webkit nodejs-lts-hydrogen)
makedepends=(cmake ninja opencl-clhpp fcgi qt5-tools sip pyqt-builder)
optdepends=('fcgi: Map server'
            'gpsbabel: GPS Tools plugin')
source=("https://qgis.org/downloads/$_pkgname-$pkgver.tar.bz2"
        "https://src.fedoraproject.org/rpms/qgis/raw/rawhide/f/qgis-yarn-offline.patch"
        "https://src.fedoraproject.org/rpms/qgis/raw/rawhide/f/qgis-gcc13.patch"
        "https://src.fedoraproject.org/rpms/qgis/raw/rawhide/f/qgis-qwt.patch"
        "https://src.fedoraproject.org/rpms/qgis/raw/rawhide/f/qgis-serverprefix.patch"
        "https://patch-diff.githubusercontent.com/raw/qgis/QGIS/pull/55576.patch")
sha256sums=('3cc827aefab62f3a636c17c08b253ff5338ac72b5701d97c39639c43a4174148'
            'dcdf4b3c97f25aaa67535f9344dadc906cec40c5d5f5145e057299bf851c89cb'
            'efb66c3a8cb6bd61d3402b9400b8a3e50cd2775082a5a93fa7a8152c37e01aaa'
            '4dc9f6191ee497eebad2da17c93e36c3f9a88719e8c81c41531b45245f2f9446'
            'ba2ca94cb492107005dade1ee920b8684deb2cdf11cc27992d10c1755da682b3'
            '9458cc91774eef948b77556c94c3fb0e4b0f5a29afa734c0604e6f96c5af3e36')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 -i ../qgis-yarn-offline.patch
  patch -p1 -i ../qgis-gcc13.patch
  patch -p1 -i ../qgis-qwt.patch
  patch -p1 -i ../qgis-serverprefix.patch
  patch -p1 -i ../55576.patch
}

build() {
  cmake -S $_pkgname-$pkgver -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DWITH_BINDINGS=TRUE \
    -DWITH_GRASS8=TRUE \
    -DWITH_CUSTOM_WIDGETS=TRUE \
    -DBINDINGS_GLOBAL_INSTALL=TRUE \
    -DENABLE_TESTS=FALSE \
    -DWITH_EPT=TRUE \
    -DWITH_PDAL=TRUE \
    -DWITH_QSPATIALITE=TRUE \
    -DWITH_QTWEBKIT=TRUE \
    -DWITH_QWTPOLAR=TRUE \
    -DQWTPOLAR_LIBRARY=/usr/lib/libqwt.so \
    -DQWTPOLAR_INCLUDE_DIR=/usr/include/qwt \
    -DWITH_INTERNAL_QWTPOLAR=FALSE \
    -DWITH_SERVER=TRUE \
    -DWITH_3D=TRUE \
    -DWITH_QSPATIALITE=TRUE \
    -DWITH_SERVER_LANDINGPAGE_WEBAPP=ON
#    -DWITH_3D=TRUE \
#    -DWITH_QUICK=TRUE \
#    -DWITH_SERVER=FALSE \
#    -DWITH_CUSTOM_WIDGETS=TRUE \
#    -DBINDINGS_GLOBAL_INSTALL=TRUE \
#    -DQGIS_MANUAL_SUBDIR=share/man \
#    -DWITH_QTWEBKIT=FALSE \
#    -DWITH_QWTPOLAR=TRUE \
#    -DQWTPOLAR_LIBRARY=/usr/lib/libqwt.so \
#    -DQWTPOLAR_INCLUDE_DIR=/usr/include/qwt \
#    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DQWT_POLAR_VERSION=0x060200" \
#    -DWITH_INTERNAL_QWTPOLAR=FALSE \
#    -DWITH_PDAL=TRUE \
#    -DHAS_KDE_QT5_PDF_TRANSFORM_FIX=TRUE \
#    -DHAS_KDE_QT5_SMALL_CAPS_FIX=TRUE \
#    -DHAS_KDE_QT5_FONT_STRETCH_FIX=TRUE
    # https://github.com/qgis/QGIS/issues/48374
    #-DWITH_INTERNAL_LAZPERF=FALSE \
    # https://github.com/qgis/QGIS/issues/35440
    #-DWITH_PY_COMPILE=TRUE \

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname-$pkgver/rpm/sources/qgis-mime.xml "$pkgdir/usr/share/mime/packages/qgis.xml"
}
