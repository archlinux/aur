# Maintainer: SaultDon <sault.don gmail>
# Contributor: Lantald < lantald at gmx.com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Eric Forgeot < http://esclinux.tk >

# GRASS 6 or 7 Processing and Plugin, Globe Plugin and QGIS Map Server are disabled in cmake by default.
# Uncomment them in the build() portion if you'd like enabled during the build.

pkgname=qgis-git
_pkgname=${pkgname//-git}
_pkgver=2.11
pkgver=2.11
pkgrel=2
pkgdesc='QGIS (master) is a Geographic Information System (GIS) that supports vector, raster & database formats'
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
         'spatialindex'
         'icu')
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
install="$pkgname.install"
source=("${_pkgname}::git://github.com/qgis/QGIS.git"
        "https://raw.githubusercontent.com/Ariki/QGIS/support-configure-ng/python/console/console.py")
md5sums=('SKIP'
         '57efd9c869ed2d0a50fb7cf35048d99d')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "%s.r%s" $_pkgver "$(git rev-list --count HEAD)"
}

prepare() {
   cd "${srcdir}/${_pkgname}"

   mv "${srcdir}/console.py" python/console/

   # Fixing by hand shebang for .py files.
   find . -iname '*.py' | xargs sed -ie 's:^#!/usr/bin/env python$:#!/usr/bin/env python2:'
   find . -iname '*.py' | xargs sed -ie 's:^#!/usr/bin/python$:#!/usr/bin/env python2:'
}

build() {
  # Fix insecure RPATH is weird, but just works ;)
  # echo "os.system(\"sed -i '/^LFLAGS/s|-Wl,-rpath,.\+ ||g' gui/Makefile core/Makefile\")" >> python/configure.py.in

  cd "$srcdir/$_pkgname"

  if [ -d build ]; then
    rm -rf build
  fi
  mkdir build
  cd build

  cmake -G "Unix Makefiles" ../ \
    -Wno-dev \
    -DCMAKE_SKIP_BUILD_RPATH=FALSE \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=FALSE \
    -DCMAKE_INSTALL_RPATH=/opt/qgis-git/lib \
    -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=FALSE \
    -DCMAKE_INSTALL_PREFIX=/opt/qgis-git/ \
    -DENABLE_TESTS=OFF \
    -DQGIS_MANUAL_SUBDIR=man \
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
  cd "$srcdir/$_pkgname"
  cd build

  make DESTDIR="$pkgdir/" install
  
  # qgis.desktop
  sed -i -e "s,^Name=QGIS Desktop\$,Name=QGIS Desktop (Master)," \
         -e "s,^Icon=qgis\$,Icon=qgis-dev," \
         -e "s,^TryExec=/usr/bin/qgis\$,TryExec=/usr/bin/qgis-dev," \
         -e "s,^Exec=/usr/bin/qgis %F\$,Exec=QGIS_PREFIX_PATH=/opt/qgis-git /usr/bin/qgis-dev --configpath $HOME/.qgis2-dev %F," \
         "${srcdir}/${_pkgname}/debian/qgis.desktop"

  # qbrowser.desktop
  sed -i -e "s,^Name=QGIS Browser\$,Name=QGIS Browser (Master)," \
         -e "s,^Icon=qbrowser\$,Icon=qbrowser-dev," \
         -e "s,^TryExec=/usr/bin/qbrowser\$,TryExec=/usr/bin/qbrowser-dev," \
         -e "s,^Exec=/usr/bin/qbrowser %F\$,Exec=/usr/bin/qbrowser-dev %F," \
         "${srcdir}/${_pkgname}/debian/qbrowser.desktop"

  # install some freedesktop.org compatibility
  install -D -m644 "$srcdir/$_pkgname/debian/qgis.desktop" \
    "$pkgdir/usr/share/applications/qgis-dev.desktop"

  install -D -m644 "$srcdir/$_pkgname/debian/qbrowser.desktop" \
    "$pkgdir/usr/share/applications/qbrowser-dev.desktop"

  install -Dm644 $srcdir/$_pkgname/debian/qgis-icon.xpm \
    "$pkgdir/usr/share/pixmaps/qgis-dev.xpm"

  install -Dm644 $srcdir/$_pkgname/debian/qbrowser-icon.xpm \
    "$pkgdir/usr/share/pixmaps/qbrowser-dev.xpm"


  # rename executables incase qgis stable/release is already installed
  install -Dm755 $pkgdir/opt/qgis-git/bin/qgis $pkgdir/usr/bin/qgis-dev
  install -Dm755 $pkgdir/opt/qgis-git/bin/qbrowser $pkgdir/usr/bin/qbrowser-dev
  install -Dm755 $pkgdir/opt/qgis-git/bin/qgis_mapserv.fcgi $pkgdir/usr/bin/qgis_mapserv_dev.fcgi

  # TODO: these aren't working for some reason, ie, .qgs files are not opened by QGIS...
  # Appears to be a conflict with some file types being defaulted to google-chrome/chromium if that's installed as well.
  #install -dm755 "$pkgdir/usr/share/pixmaps" \
  #  "$pkgdir/usr/share/mimelnk/application"
  #for mime in "$srcdir/$_pkgname/debian/mime/application/"*.desktop
  #  do install -m644 "$mime" "$pkgdir/usr/share/mimelnk/application"
  #done
}
