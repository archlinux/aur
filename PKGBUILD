# Maintainer:
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: aimileus, Sergej Pupykin, Tiago Pierezan Camargo, robb_force

## links
# http://0ldsk00l.ca/nestopia/
# https://github.com/0ldsk00l/nestopia

## options
: ${_build_clang:=true}

_pkgname="nestopia"
pkgname="$_pkgname"
pkgver=1.53.2
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
)

[[ "${_build_clang::1}" == "t" ]] && makedepends+=('clang' 'lld')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"https://github.com/0ldsk00l/nestopia/archive/$pkgver.$_pkgext")
sha256sums=('7783d2673ad496109e7dd3d75756cfef30c5b400409131b83b45c2fa3ddd735b')

prepare() {
  # glu is not technically needed
  # create dummy archive for ld to find
  echo '!<arch>' > libGLU.a
}

build() {
  export CXX LDFLAGS
  local _ldflags=(${LDFLAGS})
  LDFLAGS="${_ldflags[@]//*fuse-ld*/} -L${srcdir@Q}"

  if [[ "${_build_clang::1}" == "t" ]]; then
    CXX=clang++
    LDFLAGS+=" -fuse-ld=lld"
  fi

  cd "$_pkgsrc"
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  make -C "$_pkgsrc" install DESTDIR="$pkgdir"
}
