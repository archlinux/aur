#! /bin/bash
# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

_pkgname=desmume
pkgname=${_pkgname}-git
pkgdesc='Nintendo DS emulator'
url='http://desmume.org/'
arch=('i686' 'x86_64')
license=('GPL')

# The developers do not seem to make consistent use of tags
# I've manually specified the commit where the branch of the latest release (as
# of this writing) split from master, and we use this to get the rev number.
_last_rtm_ver=0.9.11
_last_rtm_commit=ccbf85ed42e4350af415d56b1465e83614c85ef8
pkgver="${_last_rtm_ver}.r583.07a68db"
pkgrel=1

depends=('agg'
         'gtkglext'
         'libglade'
         'libpcap'
         'libgl'
         'openal'
         'sdl'
         'soundtouch'
         'lua51')
makedepends=('autoconf'
             'automake'
             'pkg-config'
             'git'
             #'clang'
             'lua')

provides=('desmume')
replaces=('desmume-sourceforge'
          'desmume-svn'
          'desmume-jit-svn')
conflicts=("${provides[@]}" "${replaces[@]}")

source=('git+https://github.com/TASVideos/desmume.git')
sha512sums=('SKIP')

_builddir="${_pkgname}/src/frontend/posix"

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local revnum="$(git rev-list --count ${_last_rtm_commit}..HEAD)"
  local shorthash="$(git rev-parse --short HEAD)"

  printf "%s.r%s.%s" "${_last_rtm_ver}" "${revnum}" "${shorthash}"
}

prepare(){
  cd "${srcdir}/${_pkgname}/${_builddir}"

  # lua5.1 package is named lua51 on Arch
  # we could probably just make it compile against the current lua
  sed -i 's/lua5.1/lua51/' configure.ac

  # Make clang happy
  #sed -e 's/^\([[:space:]]\+\) \(line_profile_aa& profile\)/\1 const \2/' /usr/include/agg2/agg_renderer_outline_aa.h > ../modules/osd/agg/agg_renderer_outline_aa.h

  ./autogen.sh

  # Using clang to workaround FS#41476
  # Not sure if we need to do this, since it seems the current codebase
  # doesn't quite work anyway.
  #CC=clang \
  #CXX=clang++ \
  CFLAGS="-O3 -march=native" \
  CXXFLAGS="-O3 -march=native" \
  ./configure \
    --prefix=/usr \
    --enable-osmesa \
    --enable-glx \
    --enable-hud \
    --enable-openal \
    --enable-glade \
    --enable-wifi
}

build() {
  cd "${srcdir}/${_pkgname}/${_builddir}"

  make -j6
}

package() {
  cd "${srcdir}/${_pkgname}/${_builddir}"

  make DESTDIR="${pkgdir}" install
}
