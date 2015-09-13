# Contributor: MutantMonkey <mutantmonkey@gmail.com>
pkgname=qgis-1.6
pkgver=15265
pkgrel=7
pkgdesc="Quantum GIS, Geographic Information System; old 1.6 stable version"
arch=('i686' 'x86_64')
url="http://qgis.org/"
license=('GPL')
depends=('libmysqlclient' 'postgresql-libs' 'sqlite3' 'jasper' 'curl' 'qt4' 'python2' 'python2-pyqt' 'giflib' 'xerces-c' 'cfitsio' 'qwt5' 'gdal')
makedepends=('subversion' 'grass64' 'gsl' 'postgis' 'netcdf' 'cmake' 'fcgi' 'python2-sip' 'pyqt')
optdepends=('postgis: postgis support and SPIT plugin'
            'fcgi: qgis mapserver'
            'python2-sip: python-support'
            'grass64: grass plugin'
            'gsl: georeferencer  ')
provides=('qgis')
conflicts=('qgis' 'qgis-git' 'qwt')
options=('!makeflags')
source=('qgis.desktop'
	'fix-bunch_errors.patch'
	'FindPyQt.py')
md5sums=('8ab66039f2aba519b92f52272ec3c13e'
	 'a4ebe0567ab3c35437039412e27d1ac0'
	 'e14fc64843d36a7301928b4efd4a3274')

_svntrunk=https://svn.osgeo.org/qgis/branches/Release-1_6_0
_svnmod=qgis-1.6

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"
  patch -p0 -i ${srcdir}/fix-bunch_errors.patch
  
   mv "${srcdir}/FindPyQt.py" cmake/
   find . -iname '*.py' | xargs sed -ie 's:^#!/usr/bin/env python$:#!/usr/bin/env python2:'
   find . -iname '*.py' | xargs sed -ie 's:^#!/usr/bin/python$:#!/usr/bin/env python2:'
   
   
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DPEDANTIC=TRUE \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGRASS_PREFIX=/opt/grass64 \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
	-DPYTHON_EXECUTABLE=/usr/bin/python2 \
	-DPYTHON_SITE_PACKAGES_DIR=/usr/lib/python2.7/site-packages \
	-DPYTHON_INCLUDE_PATH=/usr/include/python2.7/ 

	make || return 1
}

package() {
        cd "$srcdir/$_svnmod-build"
	make install DESTDIR=${pkgdir}

	# install some freedesktop.org compatibility
	install -D -m644 ${srcdir}/qgis.desktop \
		${pkgdir}/usr/share/applications/qgis.desktop
}
