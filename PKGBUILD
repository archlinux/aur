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
pkgver=2.14.1
pkgrel=1
pkgdesc='Geographic Information System (GIS) that supports vector, raster & database formats'
url='http://qgis.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('qca-qt4' 'gdal' 'qwtpolar' 'gsl' 'spatialindex' 'icu'
         'python2-qscintilla-qt4' 'python2-sip' 'python2-psycopg2'
         python2-{httplib2,jinja,markupsafe,owslib,pygments,dateutil,pytz,six})
makedepends=('cmake' 'txt2tags' 'perl')
optdepends=('gpsbabel: GPS Tool plugin'
            'python2-pyspatialite: Processing plugin'
            'python2-yaml: Processing plugin')
source=("http://qgis.org/downloads/$pkgname-$pkgver.tar.bz2"
        'https://github.com/qgis/QGIS/commit/fc6559aa053317cda8ced657c3013a0d4c6549e9.patch')
md5sums=('60e0708650303f28fdfe84b555c41c18'
         'e57b70e88a0cb4e99e9fb4910b7d932d')

prepare() {
  cd $pkgname-$pkgver

  # Fix for sip 4.18
  patch -Np1 -i ../fc6559aa053317cda8ced657c3013a0d4c6549e9.patch

  # Fix references to "python"
  sed -i 's/\(env \|\/usr\/bin\/\)python$/&2/' $(find . -iname "*.py")
  sed -i 's/python /python2 /' scripts/pyuic4-wrapper.sh

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
    -DWITH_INTERNAL_{HTTPLIB2,JINJA2,MARKUPSAFE,OWSLIB,PYGMENTS,DATEUTIL,PYTZ,YAML,NOSE2,SIX}=FALSE \
#    -DWITH_SERVER=TRUE \
#    -DWITH_GLOBE=TRUE

  make
}

package() {
  cd $pkgname-$pkgver/build

  # Add optional deps based on selected or autodetected options
  [[ -n "$(sed -n '/^GRASS_PREFIX:/ s/.*=//p' CMakeCache.txt)" ]] && optdepends+=('grass6: GRASS6 plugin')
  [[ -n "$(sed -n '/^GRASS_PREFIX7:/ s/.*=//p' CMakeCache.txt)" ]] && optdepends+=('grass: GRASS7 plugin')
  [[ "$(sed -n '/^WITH_SERVER:/ s/.*=//p' CMakeCache.txt)" == "TRUE" ]] && optdepends+=('fcgi: Map Server')
  [[ "$(sed -n '/^WITH_GLOBE:/ s/.*=//p' CMakeCache.txt)" == "TRUE" ]] && optdepends+=('osgearth: Globe plugin')

  make DESTDIR="$pkgdir" install

  cd "$srcdir/$pkgname-$pkgver"

  # install desktop files and icons
  install -Dm644 debian/{qgis,qbrowser}.desktop -t "$pkgdir/usr/share/applications/"
  for icon in qgis-icon{,-16x16,-60x60} qbrowser-icon{,-60x60}; do
    local _resolution="${icon##*-}"; [[ "$_resolution" == "icon" ]] && _resolution="512x512"
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
