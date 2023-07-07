# Maintainer: qs9rx <qs9rx.aur@enjoys.it>

# Previous Maintainers: scimmia, XavierCLL, SaultDon, Lantald, Thomas
#     Dziedzic, dibblethewrecker, Gerardo Exequiel Pozzi, Eric Forgeot,
#     Fincer, gaelic

pkgname=qgis-git
_pkgname=qgis
pkgver=3.99_master.r82542.5064b265645
_pkgver=3.99_master  # fake pkgver prefix for the name
pkgrel=1
pkgdesc='Geographic Information System (GIS) that supports vector, raster & database formats - Development master'
url='http://qgis.org/'
license=('GPL')
arch=('x86_64')
depends=(
  'proj' 'geos' 'sqlite' 'qwtpolar' 'expat' 'spatialindex' 'gsl' 'libzip' 'exiv2' 'ocl-icd' 'protobuf' 'pdal-git'
  'qt5-tools' 'qt5-script' 'qtkeychain' 'sip' 'qca-qt5' 'qt5-webkit' 'qt5-3d' 'qt5-serialport' 'qt5-xmlpatterns'
  'python-gdal' 'python-owslib' 'python-future' 'python-psycopg2' 'python-yaml' 'python-numpy' 'python-jinja' 'python-pygments'
  'python-pyqt5' 'python-qscintilla-qt5'
)
makedepends=(git cmake ninja pyqt-builder opencl-clhpp fcgi qt5-tools sip)
optdepends=('grass: for GRASS providers and plugin (6 or 7)'
#            'gsl: for georeferencer'
            'postgresql: for postgis and SPIT support'
            'gpsbabel: for gps plugin'
            'ocilib: oracle provider')

source=("${_pkgname}::git+https://github.com/qgis/QGIS.git"
        exiv2-0.28.patch
        protobuf-23.patch)
sha256sums=('SKIP'
            '746ce9fe26f52e1e93b36b0f7738cce618aaaa44393914e9c5661dcfdd374511'
            'ac6c96e88346c1cec739b1e628afb02aef1895c0d09213269bad75b1a8cee617')
provides=('qgis')

pkgver(){
  cd "$_pkgname"
  printf "%s.r%s" "$_pkgver" "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  patch -d $_pkgname -p1 < exiv2-0.28.patch # Fix build with exiv2 0.28
  patch -d $_pkgname -p1 < protobuf-23.patch # Fix build with protobuf 23

  cd $_pkgname

  # Fix desktop file for /usr/bin/qgis-github
#   sed -e 's/\/usr\/bin\/qgis/\/usr\/bin\/qgis-git/g' \
   sed -e 's/Exec=qgis/Exec=qgis-git/g' \
  		-e 's/Icon=qgis/Icon=qgis-git/g' \
  		-i linux/org.qgis.qgis.desktop.in
#   cp linux/org.qgis.qgis.desktop.in linux/org.qgis.qgis-git.desktop

  # Remove mime types already defined by freedesktop.org
  sed -e '/type="image\/tiff"/,/<\/mime-type>/d' \
      -e '/type="image\/jpeg"/,/<\/mime-type>/d' \
      -e '/type="image\/jp2"/,/<\/mime-type>/d' \
      -e '/type="application\/x-adobe-mif"/,/<\/mime-type>/d' \
      -i debian/qgis.xml

  [[ -d build ]] || mkdir build
}

build() {
  cd $_pkgname/build

  cmake -G "Ninja" ../ \
    -DCMAKE_INSTALL_PREFIX=/opt/$pkgname \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DWITH_3D=TRUE \
    -DWITH_QUICK=TRUE \
    -DWITH_SERVER=TRUE \
    -DBINDINGS_GLOBAL_INSTALL=FALSE \
    -DWITH_QTWEBKIT=FALSE \
    -DWITH_QWTPOLAR=TRUE \
    -DQWTPOLAR_LIBRARY=/usr/lib/libqwt.so \
    -DQWTPOLAR_INCLUDE_DIR=/usr/include/qwt \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -DQWT_POLAR_VERSION=0x060200" \
    -DWITH_INTERNAL_QWTPOLAR=FALSE \
    -DWITH_PDAL=TRUE \
    -DHAS_KDE_QT5_PDF_TRANSFORM_FIX=TRUE \
    -DHAS_KDE_QT5_SMALL_CAPS_FIX=TRUE \
    -DHAS_KDE_QT5_FONT_STRETCH_FIX=TRUE
    # https://github.com/qgis/QGIS/issues/48374
    #-DWITH_INTERNAL_LAZPERF=FALSE \
    # https://github.com/qgis/QGIS/issues/35440
    #-DWITH_PY_COMPILE=TRUE \

  ninja
}

package() {
  cd $_pkgname/build

  # Add optional deps based on selected or autodetected options
  [[ -n "$(sed -n '/^GRASS_PREFIX:/ s/.*=//p' CMakeCache.txt)" ]] && optdepends+=('grass6: GRASS6 plugin')
  [[ -n "$(sed -n '/^GRASS_PREFIX7:/ s/.*=//p' CMakeCache.txt)" ]] && optdepends+=('grass: GRASS7 plugin')
  [[ "$(sed -n '/^WITH_SERVER:/ s/.*=//p' CMakeCache.txt)" == "TRUE" ]] && optdepends+=('fcgi: Map Server')

  DESTDIR="$pkgdir" cmake --install .

  cd "$srcdir/$_pkgname"
  
  install -d -m755 $pkgdir/usr/bin
  ln -s /opt/$pkgname/bin/qgis "$pkgdir/usr/bin/qgis-git"
  
  # install desktop files and icons
  install -Dm644 build/org.qgis.qgis.desktop "$pkgdir/usr/share/applications/org.qgis.qgis-git.desktop"
  for resolution in `ls /usr/share/icons/hicolor/|egrep '[0-9]'`; do
  	if [ -e debian/icons/qgis-icon{$resolution}.png ]
  	then
	  	install -Dm644 debian/icons/qgis-icon${resolution}.png "$pkgdir/usr/share/icons/hicolor/${resolution}/apps/$pkgname.png"
	  fi 
  done
	install -Dm644 images/icons/qgis_icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
	
  # install mime information and icon
  install -Dm644 debian/qgis.xml "$pkgdir/usr/share/mime/packages/qgis-git.xml"
  for resolution in `ls /usr/share/icons/hicolor/|egrep '[0-9]'`; do
  	if [ -e debian/icons/qgis-mime-icon{$resolution}.png ]
  	then
	  	install -Dm644 debian/icons/qgis-mime-icon${resolution}.png "$pkgdir/usr/share/icons/hicolor/${resolution}/mimetypes/qgis-git-mime.png"
	  fi
	done
	install -Dm644 images/icons/qgis_mime_icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/mimetypes/qgis-git-mime.svg"
	  
	for type in qgs qlr qml qpt; do
		for resolution in `ls /usr/share/icons/hicolor/|egrep '[0-9]'`; do
			if [ -e debian/icons/qgis-${type}${resolution}.png ]
  		then
	  		install -Dm644 debian/icons/qgis-${type}${resolution}.png "$pkgdir/usr/share/icons/hicolor/${resolution}/mimetypes/qgis-git-$type.png"
	  	fi
		done
	done
	for type in asc ddf dem dt0 dxf gml img mime mldata qgs qlr qml qpt shp sqlite; do
    install -Dm644 images/icons/qgis_${type}_icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/mimetypes/qgis-git-$type.svg"
  done

  # compile python files, since the cmake option doesn't seem to account for DESTDIR
  python -m compileall -q "$pkgdir"
  
  # link libraries
  install -d -m755 "${pkgdir}"/etc/ld.so.conf.d/
  echo '/opt/qgis-git/lib' > "${pkgdir}"/etc/ld.so.conf.d/qgis-git.conf
}

