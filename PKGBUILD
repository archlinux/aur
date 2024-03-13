#!/bin/bash
# Contributor: Splex
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Co-Maintainer: bartus <arch-user-repo@bartus.33mail.com>

# Configuration:
# Use: makepkg VAR1=0 VAR2=1 to enable(1) disable(0) a feature
# Use: {yay,paru} --mflags=VAR1=0,VAR2=1
# Use: aurutils --margs=VAR1=0,VAR2=1
# Use: VAR1=0 VAR2=1 pamac

# Use FRAGMENT=#{commit,tag,brach}=xxx for bisect build
_fragment="${FRAGMENT:-#branch=master}"
: ${BITMAP_BACKEND:=imagemagick} # select imagemagick implementation {imagemagick,graphicsmagick}

pkgname=inkscape-git
pkgver=1.3.alpha.r987.g07fdc5641e
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
	'gsl'
	'gspell'
	'gtkmm3'
	'gtksourceview4'
	'lcms2'
	'lib2geom-git'
	'libcdr'
	'libjpeg-turbo'
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
case $BITMAP_BACKEND in
	imagemagick) depends+=('libmagick6');;
	graphicsmagick) depends+=('graphicsmagick');;
esac


optdepends=(
	'fig2dev: xfig input'
	'gvfs: import clip art'
	'pstoedit: latex formulas'
	'scour: optimized SVG output, some extensions'
	'texlive-core: latex formulas'
)
provides=('inkscape')
conflicts=('inkscape')
source=("inkscape.git::git+$url/inkscape.git${_fragment}")
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')
_gitname="inkscape.git"

prepare() {
  cd  "$_gitname"
  prepare_submodule
# fix track_obj deprecated in libsigc
  sed '/DSIGCXX_DISABLE_DEPRECATED/d' -i CMakeScripts/DefineDependsandFlags.cmake
# fix lib2geom header location
  sed -E '/^#include/s/"(point.h)/"2geom\/\1/' -i src/path/splinefit/bezier-fit.cpp src/ui/{tool{/path-manipulator,s/object-picker-tool},dialog/{symbols,extensions-gallery}}.cpp
# sed -E '/^#include/s/(forward.h)/2geom\/\1/' -i src/ui/tool/path-manipulator.cpp
  sed -E '/^#include/s/"(rect.h)/"2geom\/\1/' -i src/ui/{dialog/{object-attributes,extensions-gallery},tools/object-picker-tool}.cpp
  sed -E '/^#include/s/"(angle.h)/"2geom\/\1/' -i src/ui/dialog/document-properties.cpp
  sed -E '/^#include/s/"(transforms.h)/"2geom\/\1/' -i src/ui/widget/gradient-editor.cpp
}

pkgver() {
  cd "$_gitname"
  git describe --long --tags| sed 's/^INKSCAPE_//;s/.*/\L&/;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
case $BITMAP_BACKEND in imagemagick) export PKG_CONFIG_PATH="/usr/lib/pkgconfig:/usr/lib/imagemagick6/pkgconfig";; esac
# export CXXFLAGS="${CXXFLAGS} -fpermissive"
  cmake -S "${_gitname}" -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RELEASE 
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  internal_2geom=$(cmake -LA -N build/CMakeCache.txt|grep -oP "WITH_INTERNAL_2GEOM.*=\K.*")
  [[ $internal_2geom == "ON" ]] && conflicts+=('lib2geom') || true
}

# Generated with git_submodule_PKGBUILD_conf.sh ( https://gist.github.com/bartoszek/41a3bfb707f1b258de061f75b109042b )
# Call prepare_submodule in prepare() function

prepare_submodule() {
  git -C "$srcdir/extensions.git" config submodule.other/gcodetools.url "$srcdir/extensions-gcodetools"
  git -C "$srcdir/extensions.git" config submodule.other/inkman.url "$srcdir/extension-manager"
  git -C "$srcdir/extensions.git" config submodule.other/clipart.url "$srcdir/inkscape-import-clipart"
  git -C "$srcdir/extensions.git" config submodule.other/extension-xaml.url "$srcdir/extension-xaml"
  git -C "$srcdir/extensions.git" -c protocol.file.allow=always submodule update --init
  git -C "$srcdir/inkscape.git" config submodule.share/extensions.url "$srcdir/extensions"
  git -C "$srcdir/inkscape.git" config submodule.src/3rdparty/2geom.url "$srcdir/lib2geom"
  git -C "$srcdir/inkscape.git" config submodule.share/themes.url "$srcdir/themes"
  git -C "$srcdir/inkscape.git" config submodule.src/3rdparty/libcroco.url "$srcdir/libcroco"
  git -C "$srcdir/inkscape.git" -c protocol.file.allow=always submodule update --init
}
source+=(
  "extensions-gcodetools::git+https://gitlab.com/inkscape/extras/extensions-gcodetools"
  "extension-manager::git+https://gitlab.com/inkscape/extras/extension-manager"
  "inkscape-import-clipart::git+https://gitlab.com/inkscape/extras/inkscape-import-clipart"
  "extension-xaml::git+https://gitlab.com/inkscape/extras/extension-xaml"
  "extensions.git::git+https://gitlab.com/inkscape/extensions"
  "lib2geom::git+https://gitlab.com/inkscape/lib2geom"
  "themes::git+https://gitlab.com/inkscape/themes"
  "libcroco::git+https://gitlab.com/inkscape/libcroco"
)
