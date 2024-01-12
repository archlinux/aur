# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Truocolo <truocolo@aol.com>
# Maintainer:  Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Marcell Meszaros (MarsSeed) <marcell.meszaros@runbox.eu>

_pkgname=aspe
pkgname="${_pkgname}-git"
pkgver=1.0.r8.gcee1c15
pkgrel=2
pkgdesc="Arch Linux build source file clone tool"
arch=(
  any
)
_host='https://github.com'
_ns='themartiancompany'
url="${_host}/${_ns}/${_pkgname}"
license=(
  AGPL3
)
depends=(
  bash
)
makedepends=()
checkdepends=(
  shellcheck
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
_url="file://${HOME}/${_pkgname}"
source=(
  "git+${url}"
  # "git+${_local}"
)
sha256sums=(
  SKIP
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
  local \
    "${_pkgver}"
  cd \
    "${_pkgname}"
  _pkgver="$( \
    git \
      describe \
      --tags | \
      sed \
        's/-/+/g')"
}

package() {
  cd \
    "${_pkgname}"
  make \
    PREFIX="/usr" \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ft=sh syn=sh et
