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
   find . -iname '*.py' | xargs sed -ie 's:^#!/usr/bin/env python$:#!/usr/bin/env python2:'
   find . -iname '*.py' | xargs sed -ie 's:^#!/usr/bin/python$:#!/usr/bin/env python2:'

  [[ -d build ]] || mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  cmake -G "Unix Makefiles" ../ \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_TESTS=OFF \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
    -DPYTHON_INCLUDE_PATH=/usr/include/python2.7 \
    -DPYTHON_SITE_PACKAGES_DIR=/usr/lib/python2.7/site-packages \
    -DPYQT4_SIP_DIR=/usr/share/sip/PyQt4 \
    -DQSCI_SIP_DIR=/usr/share/sip/PyQt4 \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 \
    -DWITH_INTERNAL_QWTPOLAR=FALSE \
    -DQWTPOLAR_LIBRARY=/usr/lib/libqwtpolar.so \
    -DQWT_LIBRARY=/usr/lib/libqwt.so \
#    -DWITH_SERVER=TRUE \
#    -DWITH_SERVER_PLUGINS=TRUE \
#    -DWITH_GRASS7=ON \
#    -DGRASS_PREFIX7=/opt/grass \
#    -DGRASS_INCLUDE_DIR7=/opt/grass/include/ \
#    -DWITH_GRASS=ON \
#    -DGRASS_PREFIX=/opt/grass64 \
#    -DGRASS_INCLUDE_DIR=/opt/grass64/include \
#    -DWITH_GLOBE=TRUE \

  make
}

package() {
  cd $pkgname-$pkgver/build

  make DESTDIR="$pkgdir/" install
  
  # install some freedesktop.org compatibility
  install -Dm755 "$srcdir/$pkgname-$pkgver/debian/qgis.desktop" \
    "$pkgdir/usr/share/applications/qgis.desktop"

  install -Dm755 "$srcdir/$pkgname-$pkgver/debian/qbrowser.desktop" \
    "$pkgdir/usr/share/applications/qbrowser.desktop"

  install -Dm644 $srcdir/$pkgname-$pkgver/debian/qgis-icon512x512.png \
    "$pkgdir/usr/share/pixmaps/qgis.png"

  install -Dm644 $srcdir/$pkgname-$pkgver/debian/qbrowser-icon512x512.png \
    "$pkgdir/usr/share/pixmaps/qbrowser.png"

  # TODO: these aren't working for some reason, ie, .qgs files are not opened by QGIS...
  # Appears to be a conflict with some file types being defaulted to google-chrome/chromium if that's installed as well.
  install -dm755 "$pkgdir/usr/share/pixmaps" \
    "$pkgdir/usr/share/mimelnk/application"

  for mime in "$srcdir/$pkgname-$pkgver/debian/mime/application/"*.desktop
    do install -m755 "$mime" "$pkgdir/usr/share/mimelnk/application"
  done

  install -Dm644 "$srcdir/$pkgname-$pkgver/images/icons/qgis-mime-icon.png" \
    "$pkgdir/usr/share/pixmaps/qgis-mime.png"
}
