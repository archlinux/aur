# Maintainer:
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: aimileus, Sergej Pupykin, Tiago Pierezan Camargo, robb_force

## useful links
# http://0ldsk00l.ca/nestopia/
# https://github.com/0ldsk00l/nestopia

## options
: ${_build_clang:=true}
: ${_build_noglu:=true}

: ${_build_avx:=false}

unset _pkgtype
[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"

## basic info
_pkgname="nestopia"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=1.52.1
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

[ "${_build_clang::1}" == "t" ] && makedepends+=('clang' 'lld')
[ "${_build_noglu::1}" != "t" ] && makedepends+=('glu')

install="$_pkgname.install"

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"https://github.com/0ldsk00l/nestopia/archive/$pkgver.$_pkgext")
sha256sums=('c9c0bce673eb3b625b538b462e49c00ed1ee1ded1e0bad09be780076880968b5')

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
