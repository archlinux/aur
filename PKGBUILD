# Maintainer: xiota / aur.chaotic.cx
# Contributor: Jay Ta'ala <jay@jaytaala.com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Florent H. CARRÉ <colundrum@gmail.com>

## options
: ${_build_git:=true}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="skippy-xd"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2023.06.25.r17.g181b143e
pkgrel=2
pkgdesc="A full-screen Exposé-style task switcher for X11"
url="https://github.com/dreamcat4/skippy-xd"
license=("GPL-2.0-or-later")
arch=("i686" "x86_64")

depends=(
  giflib
  libjpeg
  libxcomposite
  libxft
  libxinerama
  xorg-server
)
makedepends=(
  git
)

if [ "${_build_git::1}" != "t" ] ; then
  : ${_pkgver=${pkgver%%.r*}}

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=v$_pkgver")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${_pkgver:?}"
  }
else
  provides+=("$_pkgname=${pkgver%%.r*}")
  conflicts+=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgname"::"git+$url.git")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  }
fi

build() {
  cd "$_pkgsrc"
  make PREFIX=/usr
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
}
