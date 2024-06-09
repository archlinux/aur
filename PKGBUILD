# Maintainer:
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: aimileus < me at aimileus dot nl >

## useful links
# http://0ldsk00l.ca/nestopia/
# https://github.com/0ldsk00l/nestopia

## options
: ${_build_clang:=true}
: ${_build_noglu:=true}

: ${_build_avx:=false}
: ${_build_git:=true}

unset _pkgtype
[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="nestopia"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=1.52.1.r39.ga316c9b
pkgrel=1
pkgdesc="High-accuracy NES/Famicom emulator"
url="https://github.com/0ldsk00l/nestopia"
license=('GPL-2.0-only')
arch=('x86_64')

depends=(
  fltk
  libarchive
  libepoxy
  libsamplerate
  sdl2
  zlib
)
makedepends=(
  autoconf-archive
  git
  mesa
)

[ "${_build_clang::1}" == "t" ] && makedepends+=('clang' 'lld')
[ "${_build_noglu::1}" != "t" ] && makedepends+=('glu')

install="$_pkgname.install"

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  export CC CXX CFLAGS CXXFLAGS LDFLAGS
  CFLAGS=${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}
  CXXFLAGS=${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}

  if [[ "${_build_clang::1}" == "t" ]]; then
    CC=clang
    CXX=clang++
    CXXFLAGS+=" -Wno-narrowing -Wno-ignored-optimization-argument"
    LDFLAGS+=" -fuse-ld=lld"
  fi

  if [[ "${_build_avx::1}" == "t" ]]; then
    CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
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
