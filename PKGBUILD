# Contributor: Splex
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=inkscape-092-bzr
pkgver=r15367
pkgrel=1
pkgdesc="An Open Source vector graphics editor, using Scalable Vector Graphics (SVG) file format"
url="https://launchpad.net/inkscape"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtkspell' 'gtkmm' 'gc' 'poppler-glib' 'potrace' 'libxslt' 'gsl' 'imagemagick'
	 'python2' 'popt' 'libcdr' 'libvisio' 'popt' 'dbus-glib')
optdepends=('python2-numpy: some extensions'
            'python2-lxml: some extensions and filters'
            'uniconvertor: reading/writing to some proprietary formats'
 	    'gtkspell3: for spelling'
	    'ruby: for simplepath extension')
makedepends=('boost' 'intltool' 'bzr' 'gettext' 'pango' 'fontconfig' 'python' 'cmake')
provides=('inkscape')
conflicts=('inkscape')
options=('!libtool' '!makeflags')
source=('inkscape-0.92.x::bzr+http://bazaar.launchpad.net/~inkscape.dev/inkscape/0.92.x')
md5sums=('SKIP')
_bzrmod="inkscape-0.92.x"

pkgver() {
  cd $srcdir/$_bzrmod
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd "$srcdir/$_bzrmod"
  #fix for inkscape to use python2 with the python 3 package installed.
  sed -i '1s|/usr/bin/python\>|/usr/bin/python2|' cxxtest/*.py
  sed -i '1s|/usr/bin/env python\>|/usr/bin/env python2|g' share/*/{test/,}*.py
  sed -i 's|"python" },|"python2" },|g' src/extension/implementation/script.cpp
  sed -i 's|python -c |python2 -c|g' share/extensions/uniconv*.py
  sed -i 's|"python"|"python2"|g' src/main.cpp
  sed -i '1s|/usr/bin/env python\>|/usr/bin/env python2|g' share/extensions/ink2canvas/svg.py
  sed -i '1s|/usr/bin/env python\>|/usr/bin/env python2|g' share/extensions/ink2canvas/canvas.py
  sed -i '1s|/usr/bin/env python3\>|/usr/bin/env python2|g' CMakeScripts/cmake_consistency_check.py
}

build() {
  cd "$srcdir/$_bzrmod"
  [[ -d build ]] || mkdir build
  cd build
  
  cmake .. \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=RELEASE \
	-DWITH_GNOME_VFS=OFF \
  	-DWITH_DBUS=ON
  
  sed -i 's|"python"|"python2"|g' ../share/filters/CMakeLists.txt
  make 
}

package() {
  cd "$srcdir/$_bzrmod/build"
  make DESTDIR=$pkgdir install
}
