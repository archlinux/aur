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
pkgver=3.16.13
pkgrel=1
pkgdesc='Geographic Information System (GIS); Long Term Release'
url='https://qgis.org/'
license=(GPL)
arch=(x86_64)
depends=(exiv2 gsl hicolor-icon-theme libzip protobuf python-gdal python-jinja python-owslib
         python-psycopg2 python-pygments python-qscintilla-qt5 python-sip4 python-yaml qca qt5-3d
         qt5-imageformats qt5-serialport qt5-webkit qtkeychain qwt spatialindex opencl-icd-loader)
makedepends=(cmake ninja fcgi python-setuptools python-six qt5-tools txt2tags sip4 opencl-clhpp)
optdepends=('fcgi: Map server'
            'opencl-driver: packaged OpenCL driver'
            'gpsbabel: GPS Tools plugin')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("https://qgis.org/downloads/$_pkgname-$pkgver.tar.bz2"
        qgis-qwt-6.2-1.patch   # https://github.com/qgis/QGIS/commit/6f9cbde7.patch
        qgis-qwt-6.2-2.patch)  # https://github.com/qgis/QGIS/commit/581cb406.patch
# curl https://qgis.org/downloads/qgis-latest-ltr.tar.bz2.sha256
sha256sums=('140fba4e65a784b18163bf395d62734c9671bb6f2b9a3d63d4c1ff5ad544254a'
            '0f61792b634355175306ddcc04b94febb8aadcc953e4e97f229b89f9b21f2450'
            '65708439be026a881cd4f1636eb60cce562a80d98a1427ff3a51942d7b93a7ae')

prepare() {
  patch -d $_pkgname-$pkgver -p1 < qgis-qwt-6.2-1.patch # Fix build with qwt 6.2
  patch -d $_pkgname-$pkgver -p1 < qgis-qwt-6.2-2.patch # Fix build with qwt 6.2
}

build() {
  cmake -G Ninja -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_3D=TRUE \
    -DWITH_SERVER=TRUE \
    -DWITH_CUSTOM_WIDGETS=TRUE \
    -DBINDINGS_GLOBAL_INSTALL=TRUE \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DWITH_QWTPOLAR=TRUE \
    -DQWTPOLAR_LIBRARY=/usr/lib/libqwt.so \
    -DQWTPOLAR_INCLUDE_DIR=/usr/include/qwt \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DQWT_POLAR_VERSION=0x060200" \
    -DWITH_INTERNAL_QWTPOLAR=FALSE
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname-$pkgver/rpm/sources/qgis-mime.xml "$pkgdir/usr/share/mime/packages/qgis.xml"
}
