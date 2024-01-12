# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete (dvorak) <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>
# Contributor: Marcell Meszaros (MarsSeed) <marcell.meszaros@runbox.eu>

_pkgbase=termux-setup-pacman
pkgbase="${_pkgbase}-git"
pkgname=(
  "${pkgbase}"
)
pkgdesc="Script to setup a pacman environment on Termux."
_http="https://github.com"
_ns="themartiancompany"
url="${_http}/${_ns}/${_pkgbase}"
pkgver="0.1.1"
pkgrel=2
license=(
  'AGPL3'
)
depends=(
  curl
)
makedepends=(
  'git'
)
checkdepends=(
  'shellcheck'
)
optdepends=(
)
arch=(
  any
)
source=(
  "${pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

_parse_ver() {
  local \
    _pkgver="${1}" \
    _out="" \
    _ver \
    _rev \
    _commit
  _ver="$( \
    echo \
      "${_pkgver}" | \
          awk \
            -F '+' \
            '{print $1}')"
  _rev="$( \
    echo \
      "${_pkgver}" | \
          awk \
            -F '+' \
            '{print $2}')"
  _commit="$( \
    echo \
      "${_pkgver}" | \
          awk \
            -F '+' \
            '{print $3}')"
  _out=${_ver}
  if [[ "${_rev}" != "" ]]; then
    _out+=".r${_rev}"
  fi
  if [[ "${_commit}" != "" ]]; then
    _out+=".${_commit}"
  fi
  echo \
    "${_out}"
}

pkgver() {
  cd \
    "${pkgname}"
  _pkgver="$( \
    git \
      describe \
      --tags | \
      sed \
        's/-/+/g')"
  _parse_ver \
    "${_pkgver}"
}

check() {
  cd \
    "${pkgname}"
  make \
    -k \
    check
}

package() {
  local \
    _opts=()
  _opts=(
    DESTDIR="${pkgdir}"
    PREFIX='/usr'
  )
  cd \
    "${pkgname}"
  make \
    "${_opts[@]}" \
      install
}

# vim:set sw=2 sts=-1 et:
