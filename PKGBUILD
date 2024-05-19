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
pkgver=2023.07.30.r143.gc5a68d6
pkgrel=1
pkgdesc="A full-screen Exposé-style task switcher for X11"
url="https://github.com/felixfung/skippy-xd"
license=("GPL-2.0-or-later")
arch=("i686" "x86_64")

depends=(
  giflib
  libjpeg
  libxcomposite
  libxdamage
  libxft
  libxinerama
  xorg-server
)
makedepends=(
  git
)

if [ "${_build_git::1}" != "t" ]; then
  : ${_pkgver=${pkgver%%.r*}}

  _pkgsrc=$(sed -E -e 's&^\S+*/(\S+/\S+)$&\1&; s&/&.&' <<< "$url")
  source+=("$_pkgsrc"::"git+$url.git#tag=v$_pkgver")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${_pkgver:?}"
  }
else
  provides+=("$_pkgname=${pkgver%%.r*}")
  conflicts+=("$_pkgname")

  _pkgsrc=$(sed -E -e 's&^\S+*/(\S+/\S+)$&\1&; s&/&.&' <<< "$url")
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"

    local _regex='^\s*SKIPPYXD_VERSION = .* \((20[0-9]{2}\.[0-9]{2}\.[0-9]{2}).*\).*$'
    local _file='Makefile'

    local _version=$(grep -Esm1 "$_regex" "$_file" | sed -E "s@$_regex@\1@")
    local _line_num=$(grep -Ensm1 "$_regex" "$_file" | cut -d':' -f1)

    local _commit=$(git blame -L $_line_num,+1 -- "$_file" | awk '{print $1;}')

    local _revision=$(git rev-list --count --cherry-pick "$_commit"...HEAD)
    local _hash=$(git rev-parse --short=7 HEAD)

    printf "%s.r%s.g%s" "${_version:?}" "${_revision:?}" "${_hash:?}"
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
