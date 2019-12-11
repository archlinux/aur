# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Lantald <lantald at gmx.com>
# Contributor: Thomas Dziedzic <gostrc at gmail>
# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.dot.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Eric Forgeot <http://esclinux.tk>

# Globe Plugin and Map Server are disabled in cmake by default.
# Uncomment them in the build() portion if you'd like them enabled.
# You will also need to install osgearth-qt4 or fcgi, respectively, before building.

_pkgname=qgis
pkgname="$_pkgname"-ltr
pkgver=3.4.14
pkgrel=1
pkgdesc='Geographic Information System (GIS); Long Term Release'
url='https://qgis.org/'
license=(GPL)
arch=(x86_64)
depends=(desktop-file-utils gdal hicolor-icon-theme libzip python-qscintilla-qt5 qca qt5-3d
         qt5-serialport qt5-webkit qt5-xmlpatterns qtkeychain qwtpolar spatialindex python-sip)
makedepends=(cmake fcgi gsl python-six qt5-tools txt2tags sip)
optdepends=('fcgi: Map server'
            'gpsbabel: GPS Tools plugin'
            'gsl: Georeferencer plugin'
            'python-gdal: DB Manager plugin; Processing plugin'
            'python-jinja: MetaSearch plugin'
            'python-owslib: MetaSearch plugin'
            'python-psycopg2: DB Manager plugin; Processing plugin'
            'python-pygments: MetaSearch plugin'
            'python-numpy: Processing plugin'
            'python-yaml: Processing plugin')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("https://qgis.org/downloads/$_pkgname-$pkgver.tar.bz2"
        fix-include.diff)
# curl https://qgis.org/downloads/qgis-latest-ltr.tar.bz2.md5
md5sums=('1cd1220b8103b42cb21e73e5a57cb5b0'
         '610bb88927095876c3f83020cdca523c')

prepare() {
  mkdir -p build
  # patch from https://github.com/qgis/QGIS/issues/30316
  patch -d "$_pkgname-$pkgver" -p0 <fix-include.diff
}

build() {
  cd build
  cmake -G "Unix Makefiles" ../"$_pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_3D=TRUE \
    -DWITH_SERVER=TRUE \
    -DWITH_CUSTOM_WIDGETS=TRUE \
    -DBINDINGS_GLOBAL_INSTALL=TRUE \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DWITH_QWTPOLAR=TRUE \
    -DWITH_INTERNAL_QWTPOLAR=FALSE
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
