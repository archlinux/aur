# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Lantald < lantald at gmx.com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Eric Forgeot < http://esclinux.tk >

# Globe Plugin and Map Server are disabled in cmake by default.
# Uncomment them in the build() portion if you'd like them enabled.
# You will also need to install osgearth or fcgi, respectively, before building.

pkgname=qgis
pkgver=2.12.1
pkgrel=1
pkgdesc='Geographic Information System (GIS) that supports vector, raster & database formats'
url='http://qgis.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('qca-qt4' 'gdal' 'qwtpolar' 'gsl' 'spatialindex' 'icu'
         'python2-qscintilla' 'python2-sip' 'python2-psycopg2' 'python2-six' 'python2-dateutil'
         'python2-httplib2' 'python2-jinja' 'python2-markupsafe' 'python2-pygments' 'python2-pytz')
makedepends=('cmake' 'txt2tags' 'perl')
optdepends=('gpsbabel: GPS Tool plugin')
install="$pkgname.install"
source=("http://qgis.org/downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('b47a7e040341164fd2b8f7970055e3d0')

prepare() {
  cd $pkgname-$pkgver

  # Fixing shebang for .py files
  sed -i 's/\(env \|\/usr\/bin\/\)python$/&2/' $(find . -iname "*.py")

  # Remove mime types already defined by freedesktop.org
  sed -e '/type="image\/tiff"/,/<\/mime-type>/d' \
      -e '/type="image\/jpeg"/,/<\/mime-type>/d' \
      -e '/type="image\/jp2"/,/<\/mime-type>/d' \
      -e '/type="application\/x-adobe-mif"/,/<\/mime-type>/d' \
      -i debian/qgis.xml

  # Fix console.py for new pyqt build system
  sed -e '/from PyQt4.QtCore/ s/$/, QT_VERSION/' \
      -e '/import pyqtconfig/d' \
      -e 's/pyqtconfig.*qt_version/QT_VERSION/' \
      -i python/console/console.py

  [[ -d build ]] || mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  cmake -G "Unix Makefiles" ../ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DENABLE_TESTS=FALSE \
    -DCMAKE_SKIP_RPATH=TRUE \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DWITH_INTERNAL_QWTPOLAR=FALSE \
    -DWITH_INTERNAL_SIX=FALSE \
    -DWITH_INTERNAL_DATEUTIL=FALSE \
    -DWITH_INTERNAL_HTTPLIB2=FALSE \
    -DWITH_INTERNAL_JINJA2=FALSE \
    -DWITH_INTERNAL_MARKUPSAFE=FALSE \
    -DWITH_INTERNAL_PYGMENTS=FALSE \
    -DWITH_INTERNAL_PYTZ=FALSE \
#    -DWITH_SERVER=TRUE \
#    -DWITH_GLOBE=TRUE

  make
}

package() {
  cd $pkgname-$pkgver

  # Add optional deps based on selected or autodetected options
  [[ -n "$(awk -F= '/^GRASS_PREFIX:/ {print $2}' build/CMakeCache.txt)" ]] && \
    optdepends+=('grass6: GRASS6 plugin')
  [[ -n "$(awk -F= '/^GRASS_PREFIX7:/ {print $2}' build/CMakeCache.txt)" ]] && \
    optdepends+=('grass: GRASS7 plugin')
  [[ "$(awk -F= '/^WITH_SERVER:/ {print $2}' build/CMakeCache.txt)" == "TRUE" ]] && \
    optdepends+=('fcgi: Map Server')
  [[ "$(awk -F= '/^WITH_GLOBE:/ {print $2}' build/CMakeCache.txt)" == "TRUE" ]] && \
    optdepends+=('osgearth: Globe plugin')

  make -C build DESTDIR="$pkgdir" install

  # install desktop files and icons
  install -Dm644 debian/{qgis,qbrowser}.desktop -t "$pkgdir/usr/share/applications/"
  for icon in qgis-icon{,-16x16,-60x60} qbrowser-icon{,-60x60}; do
    local _resolution="${icon##*-}"
    [[ "$_resolution" == "icon" ]] && _resolution="512x512"
    install -Dm644 images/icons/$icon.png "$pkgdir/usr/share/icons/hicolor/$_resolution/apps/${icon%%-*}.png"
  done
  for icon in {qgis,qbrowser}_icon; do
    install -Dm644 images/icons/$icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${icon%%_*}.svg"
  done

  # install mime information and icon
  install -Dm644 debian/qgis.xml "$pkgdir/usr/share/mime/packages/qgis.xml"
  install -Dm644 images/icons/qgis-mime-icon.png "$pkgdir/usr/share/icons/hicolor/128x128/mimetypes/qgis-mime.png"

  # compile python files, since the cmake option doesn't seem to account for DESTDIR
  python2 -m compileall -q "$pkgdir"
}
