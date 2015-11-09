# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Lantald < lantald at gmx.com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Eric Forgeot < http://esclinux.tk >

# Globe Plugin and QGIS Map Server are disabled in cmake by default.
# Uncomment them in the build() portion if you'd like them enabled.
# You will also need to install osgearth or fcgi, respectively, before building.

pkgname=qgis
pkgver=2.12.0
pkgrel=2
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
source=("http://qgis.org/downloads/$pkgname-$pkgver.tar.bz2"
        "console_pyqt4.diff")
md5sums=('099efb9482a67e3c57f54f4947986e39'
         '636b0fd147d19f50e82080a5819ae10a')

prepare() {
  cd $pkgname-$pkgver

  patch -Np1 -i "$srcdir/console_pyqt4.diff"

  # Fixing shebang for .py files
  sed -i 's/\(env \|\/usr\/bin\/\)python$/&2/' $(find . -iname "*.py")

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
    optdepends+=('fcgi: QGIS Map Server')
  [[ "$(awk -F= '/^WITH_GLOBE:/ {print $2}' build/CMakeCache.txt)" == "TRUE" ]] && \
    optdepends+=('osgearth: QGIS Globe plugin')

  make -C build DESTDIR="$pkgdir" install

  # install some freedesktop.org compatibility
  install -Dm644 debian/{qgis,qbrowser}.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 debian/qgis-icon512x512.png "$pkgdir/usr/share/pixmaps/qgis.png"
  install -Dm644 debian/qbrowser-icon512x512.png "$pkgdir/usr/share/pixmaps/qbrowser.png"
  install -Dm644 images/icons/qgis-mime-icon.png "$pkgdir/usr/share/pixmaps/qgis-mime.png"

  # TODO: these aren't working for some reason, ie, .qgs files are not opened by QGIS...
  # Appears to be a conflict with some file types being defaulted to google-chrome/chromium if that's installed as well.
  for mime in debian/mime/application/*.desktop
    do install -Dm644 "$mime" -t "$pkgdir/usr/share/mimelnk/application/"
  done

  # compile python files, since the cmake option doesn't seem to account for DESTDIR
  python2 -m compileall -q "$pkgdir"
}
