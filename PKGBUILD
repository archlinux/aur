#!/bin/bash
# Contributor: Splex
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Co-Maintainer: bartus <arch-user-repo@bartus.33mail.com>

pkgname=inkscape-git
pkgver=1.2.alpha.r869.gfe5602913d
pkgrel=1
epoch=5
pkgdesc="An Open Source vector graphics editor, using SVG file format, from git master"
url="https://gitlab.com/inkscape"
license=('GPL' 'LGPL')
arch=('i686' 'x86_64')
makedepends=('cmake' 'boost' 'git' 'ninja')
depends=(
	'dbus-glib'
	'double-conversion'
	'gc'
	'graphicsmagick'
	'gsl'
	'gspell'
	'gtkmm3'
	'lcms2'
	'lib2geom-git'
	'libcdr'
	'libjpeg-turbo'
	'libmagick6'
	'libsoup'
	'libvisio'
	'libxslt'
	'poppler-glib'
	'potrace'
	'python'
	'python-lxml'
	'python-numpy'
	'ttf-font'
)

optdepends=(
	'fig2dev: xfig input'
	'gvfs: import clip art'
	'pstoedit: latex formulas'
	'scour: optimized SVG output, some extensions'
	'texlive-core: latex formulas'
)
provides=('inkscape')
conflicts=('inkscape')
source=("inkscape.git::git+$url/inkscape.git"
	"extensions.git::git+$url/extensions.git"
	"lib2geom.git::git+$url/lib2geom.git")
sha1sums=('SKIP'
          'SKIP'
          'SKIP')
_gitname="inkscape.git"

prepare() {
  cd  "$_gitname"
  git config submodule.share/extensions.url "${srcdir}"/extensions.git
  git config submodule.src/3rdparty/2geom.url "${srcdir}"/lib2geom.git
  git -c protocol.file.allow=always submodule update --init --remote
# fix track_obj deprecated in libsigc
  sed '/DSIGCXX_DISABLE_DEPRECATED/d' -i CMakeScripts/DefineDependsandFlags.cmake
}

pkgver() {
  cd "$_gitname"
  git describe --long --tags| sed 's/^INKSCAPE_//;s/.*/\L&/;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  cmake -S "${_gitname}" -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RELEASE 
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
