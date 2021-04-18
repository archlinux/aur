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
pkgver=3.16.6
pkgrel=1
pkgdesc='Geographic Information System (GIS); Long Term Release'
url='https://qgis.org/'
license=(GPL)
arch=(x86_64)
depends=(exiv2 gsl hicolor-icon-theme libzip protobuf python-gdal python-jinja python-owslib
         python-psycopg2 python-pygments python-qscintilla-qt5 python-sip4 python-yaml qca qt5-3d
         qt5-imageformats qt5-serialport qt5-webkit qtkeychain qwtpolar spatialindex opencl-icd-loader)
makedepends=(cmake ninja fcgi python-setuptools python-six qt5-tools txt2tags sip4 opencl-clhpp)
optdepends=('fcgi: Map server'
            'opencl-driver: packaged OpenCL driver'
            'gpsbabel: GPS Tools plugin')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("https://qgis.org/downloads/$_pkgname-$pkgver.tar.bz2")
# curl https://qgis.org/downloads/qgis-latest-ltr.tar.bz2.sha256
sha256sums=('496388cfcdb8096d2f43bec1f5a2cca6c8c9152a4854fe2da2f685b9a3a698f3')

build() {
  cmake -G Ninja -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_3D=TRUE \
    -DWITH_SERVER=TRUE \
    -DWITH_CUSTOM_WIDGETS=TRUE \
    -DBINDINGS_GLOBAL_INSTALL=TRUE \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DWITH_QWTPOLAR=TRUE \
    -DWITH_INTERNAL_QWTPOLAR=FALSE
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname-$pkgver/rpm/sources/qgis-mime.xml "$pkgdir/usr/share/mime/packages/qgis.xml"
}
