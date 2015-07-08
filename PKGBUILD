# Maintainer: SaultDon <sault.don gmail>
# Contributor: Lantald < lantald at gmx.com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Eric Forgeot < http://esclinux.tk >

# GRASS 6 or 7 Processing and Plugin, Globe Plugin and QGIS Map Server are disabled in cmake by default.
# Uncomment them in the build() portion if you'd like enabled during the build.

pkgname=qgis
_pkgver=2.10
pkgver=2.10
pkgrel=1
pkgdesc='Quantum GIS is a Geographic Information System (GIS) that supports vector, raster & database formats'
url='http://qgis.org/'
license=('GPL')
arch=('i686' 'x86_64')
# https://raw.githubusercontent.com/qgis/QGIS/final-2_6_0/INSTALL
depends=('qt4'
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
         'spatialindex')
makedepends=('cmake'
             'flex'
             'bison'
             'txt2tags'
             'perl'
             'git')
optdepends=('grass: GRASS plugin support'           # Uncomment relevant cmake option in build() below
            'fcgi: QGIS Map Server support'         # if you want GRASS, QGIS Map Server
            'osgearth: QGIS Globe plugin support'   # or the Globe Plugin enabled
            'gpsbabel: GPS toolbar support')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname-git" "$pkgname")
install="$pkgname.install"
source=("${pkgname}::git://github.com/qgis/QGIS.git#branch=release-${_pkgver//./_}"
        "https://raw.githubusercontent.com/Ariki/QGIS/support-configure-ng/python/console/console.py")
md5sums=('SKIP'
         '57efd9c869ed2d0a50fb7cf35048d99d')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^final.//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g' ||
    printf "%s.r%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
   cd "${srcdir}/${pkgname}"

   mv "${srcdir}/console.py" python/console/

   # Fixing by hand shebang for .py files.
   find . -iname '*.py' | xargs sed -ie 's:^#!/usr/bin/env python$:#!/usr/bin/env python2:'
   find . -iname '*.py' | xargs sed -ie 's:^#!/usr/bin/python$:#!/usr/bin/env python2:'
}

build() {
  # Fix insecure RPATH is weird, but just works ;)
  # echo "os.system(\"sed -i '/^LFLAGS/s|-Wl,-rpath,.\+ ||g' gui/Makefile core/Makefile\")" >> python/configure.py.in

  cd "$srcdir/$pkgname"

  if [ -d build ]; then
    rm -rf build
  fi
  mkdir build
  cd build

  cmake ../ \
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

  # TODO: fix $srcdir warning if it's a real problem...
  # Looks like it's only showing up in non-critical files so can ignore warning.

}

package() {
  cd "$srcdir/$pkgname"
  cd build

  make DESTDIR="$pkgdir/" install
  
  # install some freedesktop.org compatibility
  install -D -m644 "$srcdir/$pkgname/debian/qgis.desktop" \
    "$pkgdir/usr/share/applications/qgis.desktop"
  install -D -m644 "$srcdir/$pkgname/debian/qbrowser.desktop" \
    "$pkgdir/usr/share/applications/qbrowser.desktop"

  # TODO: these aren't working for some reason, ie, .qgs files are not opened by QGIS...
  # Appears to be a conflict with some file types being defaulted to google-chrome/chromium if that's installed as well.
  install -dm755 "$pkgdir/usr/share/pixmaps" \
    "$pkgdir/usr/share/mimelnk/application"
  for mime in "$srcdir/$pkgname/debian/mime/application/"*.desktop
    do install -m644 "$mime" "$pkgdir/usr/share/mimelnk/application"
  done
  ln -s /usr/share/qgis/images/icons/qgis-icon.png "$pkgdir/usr/share/pixmaps/qgis.png"
  ln -s /usr/share/qgis/images/icons/qbrowser-icon.png "$pkgdir/usr/share/pixmaps/qbrowser.png"
  ln -s /usr/share/qgis/images/icons/qgis-mime-icon.png "$pkgdir/usr/share/pixmaps/qgis-mime-icon.png"  
}
