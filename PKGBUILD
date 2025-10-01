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
pkgver=1.5.0.r1200.f0abf76788
pkgrel=1
epoch=5
pkgdesc="An Open Source vector graphics editor, using SVG file format, from git master"
url="https://gitlab.com/inkscape"
license=('GPL' 'LGPL')
arch=('i686' 'x86_64')
makedepends=('cmake' 'boost' 'git' 'glib2-devel' 'ninja' 'meson')
depends=(
	'boost-libs'
	'dbus-glib'
	'double-conversion'
	'gc'
	'gsl'
	'gtkmm-4.0'
	'gtksourceview5'
	'lcms2'
	'lib2geom-git'
	'libcdr'
	'libjpeg-turbo'
	'libvisio'
	'libxslt'
	'poppler-glib'
	'potrace'
	'python'
	'python-appdirs'
	'python-beautifulsoup4'
	'python-cachecontrol'
	'python-cssselect'
	'python-gobject'
	'python-lxml'
	'python-numpy'
	'python-packaging'
	'python-pillow'
	'python-pyparsing'
	'python-pyserial'
	'python-pytest'
	'python-requests'
	'python-tinycss2'
	'python-typing_extensions'
	'ttf-font'
	'cairomm'
	'pangomm'
	'graphene'
	'libwpg'
	'libspelling'
	'capypdf'
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
          'SKIP'
          'SKIP')
_gitname="inkscape.git"

prepare() {
  cd  "$_gitname"
  prepare_submodule
# fix lib2geom header location
  sed -E 's:#include "(bezier-utils.h|sbasis-to-bezier.h)":#include <2geom/\1>:' -i src/ui/tools/pencil-tool.cpp
}

pkgver() {
  cd "$_gitname"
  printf "%d.%d.%d.r%d.%s" \
    $(grep -Po 'INKSCAPE_VERSION_(MAJOR|MINOR|PATCH)\s+\K\d+' CMakeLists.txt) \
    $(git rev-list  $(git rev-list --tags --no-walk --max-count=1)..HEAD --count) \
    $(git rev-parse --short HEAD)
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
  git -C "$srcdir/extensions.git" config submodule.other/extension-afread.url "$srcdir/extension-afdesign"
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
  "extension-afdesign::git+https://gitlab.com/inkscape/extras/extension-afdesign"
  "extensions.git::git+https://gitlab.com/inkscape/extensions"
  "lib2geom::git+https://gitlab.com/inkscape/lib2geom"
  "themes::git+https://gitlab.com/inkscape/themes"
  "libcroco::git+https://gitlab.com/inkscape/libcroco"
)
