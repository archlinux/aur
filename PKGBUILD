# Maintainer:
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: aimileus < me at aimileus dot nl >
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

## useful links
# http://0ldsk00l.ca/nestopia/
# https://github.com/0ldsk00l/nestopia

## options
: ${_build_clang:=true}
: ${_build_mold:=false}
: ${_build_noglu:=true}

: ${_build_avx:=false}
: ${_build_git:=true}

[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="nestopia"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=1.52.0.r4.gaca778f
pkgrel=1
pkgdesc="High-accuracy NES/Famicom emulator"
url="https://github.com/0ldsk00l/nestopia"
license=('GPL-2.0-only')
arch=('x86_64')

depends=(
  fltk
  libarchive
  sdl2
  zlib
)
makedepends=(
  autoconf-archive
  mesa
)

[ "${_build_clang::1}" == "t" ] && makedepends+=('clang' 'lld' )
[ "${_build_mold::1}" == "t" ] && makedepends+=('mold' )
[ "${_build_noglu::1}" != "t" ] && makedepends+=('glu')

install="$_pkgname.install"

if [ "${_build_git::1}" != "t" ] ; then
  _pkgsrc="$_pkgname-$pkgver"
  _pkgext="tar.gz"
  source=("$_pkgsrc.$_pkgext"::"https://github.com/0ldsk00l/nestopia/archive/$pkgver.$_pkgext")
  sha256sums=('eae1d2f536ae8585edb8d723caf905f4ae65349edee4ffbee45f9f52b5e3b06c')
else
  makedepends+=('git')

  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

build() {
  if [[ "${_build_clang::1}" == "t" ]] ; then
    export CC=clang
    export CXX=clang++
    export CXXFLAGS+=" -Wno-narrowing -Wno-ignored-optimization-argument"
  fi

  if [[ "${_build_mold::1}" == "t" ]] ; then
    export LDFLAGS+=" -flto -fuse-ld=mold"
  elif [[ "${_build_clang::1}" == "t" ]] ; then
    export LDFLAGS+=" -fuse-ld=lld"
  fi

  if [[ "${_build_avx::1}" == "t" ]] ; then
    export CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    export CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
  fi

  cd "$_pkgsrc"
  autoreconf -fi
  ./configure --prefix=/usr

  [ "${_build_noglu::1}" == "t" ] && sed -E -i Makefile -e "s#-lGLU ##g"

  # respect CFLAGS -march=...
  local _march=$(sed -E 's#^.*(-march.*-O\S*) .*$#\1#' <<< "${CFLAGS}")
  [ -n _march ] && sed -E -i Makefile -e "s#-march.*-O\S* #$_march #g"

  make
}

package() {
  make -C "$_pkgsrc" install DESTDIR="$pkgdir"
}
