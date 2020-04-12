pkgname=inkscape-shallow-git
pkgver=1.1.dev.r0.g5215a56
pkgrel=1
pkgdesc="An Open Source vector graphics editor, using SVG file format, from git master (shallow clone)"
url="https://gitlab.com/inkscape/inkscape"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('double-conversion' 'gc' 'poppler-glib' 'libxslt' 'gsl' 'libyaml'
         'potrace' 'gdl>=3.8.0.25' 'gtkmm3' 'libcdr' 'libvisio' 'gtkspell3'
         'libsm' 'libmagick6' 'libsoup' 'python')
optdepends=('python-numpy: some extensions'
            'python-lxml: some extensions and filters'
            'uniconvertor: reading/writing to some proprietary formats'
            'ruby: for simplepath extension'
            'imagemagick: for some file conversions')
makedepends=('cmake' 'boost' 'intltool' 'git' 'gettext' 'pango' 'python'
             'fontconfig')
provides=('inkscape' 'inkscape-git')
conflicts=('inkscape' 'inkscape-git')
options=('!libtool' '!buildflags')
_gitname="inkscape.git"

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  if [[ -d "$_gitname" ]]; then
    cd $_gitname
    git pull
  else
    git clone --depth 1 https://gitlab.com/inkscape/inkscape "$_gitname"
    cd "$_gitname"
  fi
  version=$(packaging/snappy/version.sh; git restore -- .)
  git branch $(git symbolic-ref --short HEAD) --contains "$version" 2>/dev/null ||
    git tag -a -m "$version" "$version"
  git submodule update --init --recursive
}

build() {
  cd "${_gitname}"
  export PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig"
  cmake . \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
}
