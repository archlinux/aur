# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: SaultDon <sault.don gmail>
# Contributor: Lantald < lantald at gmx.com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Eric Forgeot < http://esclinux.tk >

# Globe Plugin and Map Server are disabled in cmake by default.
# Uncomment them in the build() portion if you'd like them enabled.
# You will also need to install osgearth-qt4 or fcgi, respectively, before building.

pkgname=qgis-ltr
_pkgname=${pkgname//-ltr}
pkgver=2.14.16
pkgrel=1
pkgdesc='Geographic Information System (GIS) that supports vector, raster & database formats; Long Term Release'
url='http://qgis.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('expat' 'gcc-libs' 'gdal' 'geos' 'glibc' 'libspatialite' 'postgresql-libs' 'proj'
         'qt4' 'qca-qt4' 'qscintilla-qt4' 'qtwebkit' 'qwt-qt4' 'qwtpolar-qt4' 'spatialindex' 'sqlite'
         'python2' 'python2-httplib2' 'python2-qscintilla-qt4' 'python2-sip' 'python2-six')
makedepends=('cmake' 'gsl' 'perl' 'txt2tags')
optdepends=('gpsbabel: GPS Tool plugin'
            'gsl: Georeferencer plugin'
            'python2-jinja: MetaSearch plugin'
            'python2-owslib: MetaSearch plugin'
            'python2-pygments: MetaSearch plugin'
            'python2-psycopg2: DB Manager plugin'
            'python2-pygments: DB Manager plugin'
            'python2-pyspatialite: DB Manager plugin'
            'python2-psycopg2: Processing plugin'
            'python2-pyspatialite: Processing plugin'
            'python2-yaml: Processing plugin')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("https://qgis.org/downloads/$_pkgname-$pkgver.tar.bz2"
        "qgis_sip-ftbfs.patch::https://src.fedoraproject.org/cgit/rpms/qgis.git/plain/qgis_sip-ftbfs.patch?id=25b8f81ccabbfdb183d4850a66e884c183444f14")
md5sums=('364851be6a7c64b7f3b5902179902a68'
         '0575d848604f0fc6dda0a643523e7e48')

prepare() {
  cd $_pkgname-$pkgver

  # Fedora patch to fix with newer sip/pyqt4
  patch -Np1 -i <(sed '184,$d' ../qgis_sip-ftbfs.patch)

  # Make sure we find the -qt4 versions of qwt and qwtpolar
  sed -i '/QWT_LIBRARY_NAMES/ s/qwt /qwt-qt4 /' cmake/FindQwt.cmake
  sed -i '/PATH_SUFFIXES/ s/qwt$/&-qt4/;/LIBRARY NAMES/ s/qwtpolar/&-qt4/' cmake/FindQwtPolar.cmake

  # Fix references to "python"
  sed -i 's/\(env \|\/usr\/bin\/\)python$/&2/' $(find . -iname "*.py")
  sed -i 's/python /python2 /' scripts/pyuic4-wrapper.sh

  # Remove mime types already defined by freedesktop.org
  sed -e '/type="image\/tiff"/,/<\/mime-type>/d' \
      -e '/type="image\/jpeg"/,/<\/mime-type>/d' \
      -e '/type="image\/jp2"/,/<\/mime-type>/d' \
      -e '/type="application\/x-adobe-mif"/,/<\/mime-type>/d' \
      -i debian/qgis.xml

  [[ -d build ]] || mkdir build
}

build() {
  cd $_pkgname-$pkgver/build

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
  cd $_pkgname-$pkgver/build

  # Add optional deps based on selected or autodetected options
  [[ -n "$(sed -n '/^GRASS_PREFIX:/ s/.*=//p' CMakeCache.txt)" ]] && optdepends+=('grass6: GRASS6 plugin')
  [[ -n "$(sed -n '/^GRASS_PREFIX7:/ s/.*=//p' CMakeCache.txt)" ]] && optdepends+=('grass: GRASS7 plugin')
  [[ "$(sed -n '/^WITH_SERVER:/ s/.*=//p' CMakeCache.txt)" == "TRUE" ]] && optdepends+=('fcgi: Map Server')
  [[ "$(sed -n '/^WITH_GLOBE:/ s/.*=//p' CMakeCache.txt)" == "TRUE" ]] && optdepends+=('osgearth-qt4: Globe plugin')

  make DESTDIR="$pkgdir" install

  cd "$srcdir/$_pkgname-$pkgver"

  # install desktop files and icons
  install -Dm644 debian/{qgis,qbrowser}.desktop -t "$pkgdir/usr/share/applications/"
  for icon in qgis-icon{,-16x16,-60x60} qbrowser-icon{,-60x60}; do
    local _resolution="${icon##*-}"; [[ "$_resolution" == "icon" ]] && _resolution="512x512"
    install -Dm644 images/icons/$icon.png "$pkgdir/usr/share/icons/hicolor/$_resolution/apps/${icon%%-*}.png"
  done
  for prog in qgis qbrowser; do
    install -Dm644 images/icons/${prog}_icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$prog.svg"
  done

  # install mime information and icon
  install -Dm644 debian/qgis.xml "$pkgdir/usr/share/mime/packages/qgis.xml"
  install -Dm644 images/icons/qgis-mime-icon.png "$pkgdir/usr/share/icons/hicolor/128x128/mimetypes/qgis-mime.png"

  # compile python files, since the cmake option doesn't seem to account for DESTDIR
  python2 -m compileall -q "$pkgdir"
}
