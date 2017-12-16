# Contributor: Splex
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=inkscape-092-git
pkgver=20171212.18194
pkgrel=1
pkgdesc="An Open Source vector graphics editor, using Scalable Vector Graphics (SVG) file format, from git branch 0.92.x"
url="https://gitlab.com/inkscape/inkscape"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtkspell' 'gtkmm' 'gc' 'poppler-glib' 'potrace' 'libxslt' 'gsl' 'libmagick6'
	 'python2' 'popt' 'libcdr' 'libvisio' 'popt' 'dbus-glib')
optdepends=('python2-numpy: some extensions'
            'python2-lxml: some extensions and filters'
            'uniconvertor: reading/writing to some proprietary formats'
 	    'gtkspell3: for spelling'
	    'ruby: for simplepath extension')
makedepends=('boost' 'intltool' 'git' 'gettext' 'pango' 'fontconfig' 'python' 'cmake')
provides=('inkscape')
conflicts=('inkscape')
options=('!libtool' '!makeflags')
source=('inkscape.git::git+https://gitlab.com/inkscape/inkscape#branch=0.92.x')
md5sums=('SKIP')
_gitname="inkscape.git"

pkgver() {
  cd "$_gitname"
  printf %s.%s $(git log -1 --format="%cd" --date=short|tr -d -) $(git rev-list --count HEAD)
}

prepare() {
  cd "$_gitname"
  #fix for inkscape to use python2 with the python 3 package installed.
   sed -i 's|"python"|"python2"|g' src/main.cpp
  find share -type f -name "*.py" -exec \
       sed -i '1s|/usr/bin/env python\>|/usr/bin/env python2|g' {} \;
  sed -i '1s|/usr/bin/env python3\>|/usr/bin/env python2|g' CMakeScripts/cmake_consistency_check.py
  sed -i 's|/usr/bin/env python\>|/usr/bin/env python2|g' share/*/{test/,}*.py
  sed -i 's|"python" },|"python2" },|g' src/extension/implementation/script.cpp
  sed -i 's|"python"|"python2"|g' src/main.cpp
}

build() {
  cd "$_gitname"
  [[ -d build ]] || mkdir build
  cd build
  
  cmake .. \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=RELEASE \
	-DWITH_GNOME_VFS=OFF \
  	-DWITH_DBUS=ON \
	-DWITH_IMAGE_MAGICK=OFF
  
  sed -i 's|"python"|"python2"|g' ../share/filters/CMakeLists.txt
  make
}

package() {
  cd "$_gitname/build"
  make DESTDIR="$pkgdir" install
}
