# Maintainer: Lucas Lugao <lugaosmurf@gmail.com>
# Contributor: Splex
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Co-Maintainer: bartus <arch-user-repo@bartus.33mail.com>

pkgname=inkscape-shallow-git
pkgver=1.0+devel.r2.g6edc3e959f
pkgrel=1
epoch=2
pkgdesc="An Open Source vector graphics editor, using SVG file format, from git master (shallow clone)"
url="https://gitlab.com/inkscape/inkscape"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('double-conversion' 'gc' 'poppler-glib' 'libxslt' 'gsl' 'libyaml' 'potrace' 'gdl>=3.8.0.25'
	 'gtkmm3' 'libcdr' 'libvisio' 'gtkspell3' 'libsm' 'libmagick6' 'libsoup' 'python')
optdepends=('python-numpy: some extensions'
            'python-lxml: some extensions and filters'
            'uniconvertor: reading/writing to some proprietary formats'
	    'ruby: for simplepath extension'
	    'imagemagick: for some file conversions')
makedepends=('cmake' 'boost' 'intltool' 'git' 'gettext' 'pango' 'python' 'fontconfig')
provides=('inkscape' 'inkscape-git')
conflicts=('inkscape' 'inkscape-git')
options=('!libtool' '!buildflags')
_gitname="inkscape.git"

pkgver() {
  cd "$_gitname"
  printf %s "1.0+devel.r2.g6edc3e959f"
}

prepare() {
  git clone --depth 1 https://gitlab.com/inkscape/inkscape "$_gitname"
  cd "$_gitname"
  git submodule update --init --recursive
}

build() {
  cd "$_gitname"
  [[ -d build ]] || mkdir build
  cd build
  export PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig"
  cmake .. \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=RELEASE 
  make 
}

package() {
  cd "$_gitname"/build
  make DESTDIR="$pkgdir" install
}
