# Contributor: Splex
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=inkscape-git
pkgver=20180912.20612
pkgrel=1
pkgdesc="An Open Source vector graphics editor, using SVG file format, from git master"
url="https://launchpad.net/inkscape"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gc' 'poppler-glib' 'libxslt' 'gsl' 'libyaml' 'potrace' 'gdl>=3.8.0.25'
	 'gtkmm3' 'libcdr' 'libvisio' 'dbus-glib' 'jemalloc' 'gtkspell3' 'libsm'
	 'libmagick6')
optdepends=('python2-numpy: some extensions'
            'python2-lxml: some extensions and filters'
            'uniconvertor: reading/writing to some proprietary formats'
	    'ruby: for simplepath extension'
	    'imagemagick6: for some file conversions')
makedepends=('cmake' 'boost' 'intltool' 'git' 'gettext' 'pango' 'python' 'fontconfig')
provides=('inkscape')
conflicts=('inkscape')
options=('!libtool' '!buildflags' '!makeflags')
source=('inkscape.git::git+https://gitlab.com/inkscape/inkscape')
sha1sums=('SKIP')
_gitname="inkscape.git"

pkgver() {
  cd "$_gitname"
  printf %s.%s $(git log -1 --format="%cd" --date=short|tr -d -) $(git rev-list --count HEAD)
}

prepare() {
  cd "$_gitname"
  sed -i 's|"python"|"python2"|g' src/main.cpp
  find share -type f -name "*.py" -exec \
       sed -i '1s|/usr/bin/env python\>|/usr/bin/env python2|g' {} \;
  sed -i '1s|/usr/bin/env python3\>|/usr/bin/env python2|g' CMakeScripts/cmake_consistency_check.py
  sed -i 's|"python" },|"python2" },|g' src/extension/implementation/script.cpp
  sed -i 's|"python"|"python2"|g' src/main.cpp
}

build() {
  cd "$_gitname"
  [[ -d build ]] || mkdir build
  cd build
  export PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig"
  cmake .. \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=RELEASE \
	-DWITH_DBUS=ON
  make 
}

package() {
  cd "$_gitname/build"
  make DESTDIR="$pkgdir" install
}
