# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Lantald < lantald at gmx.com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Eric Forgeot < http://esclinux.tk >

# Globe Plugin and QGIS Map Server are disabled in cmake by default.
# Uncomment them in the build() portion if you'd like enabled during the build.

pkgname=qgis
pkgver=2.12.0
pkgrel=1
pkgdesc='Geographic Information System (GIS) that supports vector, raster & database formats'
url='http://qgis.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt4'
         'qca-qt4'
         'proj'
         'geos'
         'sqlite'
         'gdal'
         'expat'
         'qwt'
         'qwtpolar'
         'gsl'
         'python2'
         'python2-pyqt4'
         'python2-qscintilla'
         'python2-sip'
         'python2-psycopg2'
         'python2-pygments'
         'python2-dateutil'
         'python2-jinja'
         'python2-markupsafe'
         'python2-pytz'
         'python2-httplib2'
         'libspatialite'
         'spatialindex'
         'icu')
makedepends=('cmake'
             'flex'
             'bison'
             'txt2tags'
             'perl')
optdepends=('grass: GRASS plugin support'
            'fcgi: QGIS Map Server support'         # if you want GRASS, QGIS Map Server
            'osgearth: QGIS Globe plugin support'   # or the Globe Plugin enabled
            'gpsbabel: GPS toolbar support')
install="$pkgname.install"
source=("http://qgis.org/downloads/$pkgname-$pkgver.tar.bz2"
        "console_pyqt4.diff")
md5sums=('099efb9482a67e3c57f54f4947986e39'
         '636b0fd147d19f50e82080a5819ae10a')

prepare() {
   cd $pkgname-$pkgver

   patch -Np1 -i "$srcdir/console_pyqt4.diff"

   # Fixing by hand shebang for .py files.
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
}
