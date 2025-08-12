# Maintainer:
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: aimileus < me at aimileus dot nl >

## links
# http://0ldsk00l.ca/nestopia/
# https://github.com/0ldsk00l/nestopia

## options
: ${_build_clang:=true}

_pkgname="nestopia"
pkgname="$_pkgname-git"
pkgver=1.53.2.r1.g39c5ead
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
)

[[ "${_build_clang::1}" == "t" ]] && makedepends+=('clang' 'lld')

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
