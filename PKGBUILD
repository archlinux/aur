# Contributor: Splex
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=inkscape-092-git
epoch=1
pkgver=0.92.4.r48.ga364238274
pkgrel=1
pkgdesc="An Open Source vector graphics editor, using Scalable Vector Graphics (SVG) file format, from git branch 0.92.x"
url="https://gitlab.com/inkscape/inkscape"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtkspell' 'gtkmm' 'gc' 'poppler-glib' 'potrace' 'libxslt' 'gsl' 'libmagick6'
	 'python2' 'popt' 'libcdr' 'libvisio' 'popt' 'dbus-glib' 'gtkspell')
optdepends=('python2-numpy: some extensions'
            'python2-lxml: some extensions and filters'
	    'ruby: for simplepath extension'
	    'imagemagick6: for some file conversions'
            'uniconvertor: reading/writing to some proprietary formats')
makedepends=('boost' 'intltool' 'git' 'gettext' 'pango' 'fontconfig' 'python' 'cmake')

provides=('inkscape')
conflicts=('inkscape')
options=('!libtool')
source=("inkscape.git::git+$url.git#branch=0.92.x")
md5sums=('SKIP')
_gitname="inkscape.git"

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/^INKSCAPE_//;s/\([^-]*-g\)/r\1/;s/[-_]/./g;s/\(.*\)/\L\1/'
}

prepare() {
  cd "$_gitname"
  find share -type f -name "*.py" -exec \
       sed -i '1s|/usr/bin/env python\>|/usr/bin/env python2|g' {} \;
  sed -i 's|"python" },|"python2" },|g' src/extension/implementation/script.cpp
}

build() {
  cd "$_gitname"
  [[ -d build ]] || mkdir build
  cd build
  export PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig"
  cmake .. \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=RELEASE \
	-DWITH_GNOME_VFS=OFF \
  	-DWITH_DBUS=ON 
	  
  sed -i 's|"python"|"python2"|g' ../share/filters/CMakeLists.txt
  make
}

package() {
  cd "$_gitname/build"
  make DESTDIR="$pkgdir" install
}
