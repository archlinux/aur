# Contributor: Splex
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Co-Maintainer: bartus <arch-user-repo@bartus.33mail.com>

pkgname=inkscape-git
pkgver=1.1.alpha.r9.g158a1947eb
pkgrel=1
epoch=5
pkgdesc="An Open Source vector graphics editor, using SVG file format, from git master"
url="https://gitlab.com/inkscape"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('double-conversion' 'gc' 'poppler-glib' 'libxslt' 'gsl' 'libyaml' 'potrace' 'gdl>=3.8.0.25'
	 'gtkmm3' 'libcdr' 'libvisio' 'gtkspell3' 'libsm' 'libmagick6' 'libsoup' 'python')
optdepends=('python-numpy: some extensions'
            'python-lxml: some extensions and filters'
            'uniconvertor: reading/writing to some proprietary formats'
	    'ruby: for simplepath extension'
	    'imagemagick: for some file conversions')
makedepends=('cmake' 'boost' 'intltool' 'git' 'gettext' 'gtest' 'pango' 'python' 'fontconfig')
provides=('inkscape')
conflicts=('inkscape')
options=('!libtool' '!buildflags')
source=("inkscape.git::git+$url/inkscape.git"
	"extensions.git::git+$url/extensions.git"
	"lib2geom.git::git+$url/lib2geom.git")
sha1sums=('SKIP'
          'SKIP'
          'SKIP')
_gitname="inkscape.git"

prepare() {
  cd  "$_gitname"
  git config submodule.share/extensions.url ${srcdir}/extensions.git
  git config submodule.src/3rdparty/2geom.url ${srcdir}/lib2geom.git
  git submodule update --init --remote
}

pkgver() {
  cd "$_gitname"
  git describe --long --tags| sed 's/^INKSCAPE_//;s/.*/\L&/;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  cd "$_gitname"
  [[ -d build ]] || mkdir build
  cd build
  export PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig"
  export CXXFLAGS="${CXXFLAGS} -fpermissive"
  cmake .. \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=RELEASE 
  make 
}

package() {
  cd "$_gitname"/build
  make DESTDIR="$pkgdir" install
}
