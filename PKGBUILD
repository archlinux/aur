#!/bin/bash
# Contributor: Splex
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Co-Maintainer: bartus <arch-user-repo@bartus.33mail.com>

pkgname=inkscape-git
pkgver=1.1.alpha.r776.g85311d94fe
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
makedepends=('cmake' 'boost' 'intltool' 'git' 'gettext' 'gtest' 'gmock' 'pango' 'python' 'fontconfig')
provides=('inkscape')
conflicts=('inkscape')
options=('!libtool' '!buildflags')
source=("inkscape.git::git+$url/inkscape.git"
	"extensions.git::git+$url/extensions.git"
	"lib2geom.git::git+$url/lib2geom.git"
	"poppler:21.11.patch::https://gitlab.com/inkscape/inkscape/-/merge_requests/3622.patch")
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          '60f7b1e065f935d7d055f7d5fbe79f19c737cc3d')
_gitname="inkscape.git"

prepare() {
  cd  "$_gitname"
  git config submodule.share/extensions.url ${srcdir}/extensions.git
  git config submodule.src/3rdparty/2geom.url ${srcdir}/lib2geom.git
  git submodule update --init --remote
  git apply -v "${srcdir}"/poppler:21.11.patch
}

pkgver() {
  cd "$_gitname"
  git describe --long --tags| sed 's/^INKSCAPE_//;s/.*/\L&/;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  export PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig"
  export CXXFLAGS="${CXXFLAGS} -fpermissive"
  cmake -S "${_gitname}" -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RELEASE 
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
