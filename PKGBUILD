# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Doug Newgard <scimmia at archlinux dot org>
# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Lantald < lantald at gmx.com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Eric Forgeot < http://esclinux.tk >

_pkgname=qgis
pkgname="$_pkgname"-ltr
pkgver=3.22.14
pkgrel=1
pkgdesc='Geographic Information System (GIS); Long Term Release'
url='https://qgis.org/'
license=('GPL')
arch=('x86_64')
depends=('exiv2' 'gdal' 'gsl' 'hicolor-icon-theme' 'libzip' 'ocl-icd' 'pdal' 'protobuf'
         'python-gdal' 'python-jinja' 'python-owslib' 'python-psycopg2' 'python-pygments'
         'python-qscintilla-qt5' 'python-yaml' 'qca' 'qt5-3d' 'qt5-imageformats'
         'qt5-serialport' 'qt5-location' 'qtkeychain-qt5' 'qwt' 'spatialindex')
makedepends=('cmake' 'fcgi' 'ninja' 'opencl-clhpp' 'python-setuptools' 'python-six' 'qt5-tools'
             'txt2tags' 'sip' 'pyqt-builder')
optdepends=('fcgi: Map server'
            'gpsbabel: GPS Tools plugin')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("https://download.qgis.org/downloads/$_pkgname-$pkgver.tar.bz2"
        qgstyle-infinite-loop.patch::https://github.com/qgis/QGIS/commit/19823b76.patch)
sha256sums=('882aa88dfbf2aef389329f789b5929f0c2c89b8b33ff4c481308f95ff0213972'
            'c5bc388da987c7c21451b3f0f74220c8bd82cfba04657ff599d1896e6ae4b304')
# curl https://qgis.org/downloads/qgis-latest-ltr.tar.bz2.sha256

prepare() {
  patch -d "$_pkgname-$pkgver" -p1 < qgstyle-infinite-loop.patch # Fix infinite loop
}

build() {
  cmake -G Ninja -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_3D=TRUE \
    -DWITH_SERVER=TRUE \
    -DWITH_CUSTOM_WIDGETS=TRUE \
    -DBINDINGS_GLOBAL_INSTALL=TRUE \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DWITH_QTWEBKIT=FALSE \
    -DWITH_QWTPOLAR=TRUE \
    -DQWTPOLAR_LIBRARY=/usr/lib/libqwt.so \
    -DQWTPOLAR_INCLUDE_DIR=/usr/include/qwt \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DQWT_POLAR_VERSION=0x060200" \
    -DWITH_INTERNAL_QWTPOLAR=FALSE \
    -DWITH_PDAL=TRUE
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname-$pkgver/rpm/sources/qgis-mime.xml "$pkgdir/usr/share/mime/packages/qgis.xml"
}
