# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Marcell Meszaros (MarsSeed) <marcell.meszaros@runbox.eu>

_offline="false"
_py="python"
_py2="${_py}2"
_pkgname=bbrightnessctl
pkgname="${_pkgname}-git"
pkgver=0.0.0.1.r1.g063f309
pkgrel=1
pkgdesc="System-independent brightness control tool"
arch=(
  any
)
_repo="https://github.com"
_ns="themartiancompany"
url="${_repo}/${_ns}/${_pkgname}"
license=(
  AGPL3
)
_os="$( \
  uname \
    -o)"
depends=(
)
[[ "${_os}" == "GNU/Linux" ]] && \
  depends+=(
    brightnessctl
  )
[[ "${_os}" == "Android" ]] && \
  depends+=(
    termux-api
  )
makedepends=(
  git
)
optdepends=(
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
_url="${url}"
[[ "${_offline}" == "true" ]] && \
  _url="file://${HOME}/${_pkgname}"
source=(
  "git+${_url}"
)
sha256sums=(
  SKIP
)

_nth() {
  local \
    _str="${1}" \
    _n="${2}"
  echo \
    "${_str}" | \
    awk \
      -F '+' \
      '{print $'"${_n}"'}'
}

_parse_ver() {
  local \
    _pkgver="${1}" \
    _out="" \
    _ver \
    _rev \
    _commit
  _ver="$( \
    _nth \
      "${_pkgver}" \
      "1")"
  _rev="$( \
    _nth \
      "${_pkgver}" \
      "2")"
  _commit="$( \
    _nth \
      "${_pkgver}" \
      "3")"
  _out=${_ver}
  [[ "${_rev}" != "" ]] && \
    _out+=".r${_rev}"
  [[ "${_commit}" != "" ]] && \
    _out+=".${_commit}"
  echo \
    "${_out}"
}

pkgver() {
  local \
    _pkgver
  cd \
    "${_pkgname}"
  _pkgver="$( \
    git \
      describe \
      --tags \
      --long | \
      sed \
        's/-/+/g')"
  _parse_ver \
    "${_pkgver}"
}

_usr="$( \
  dirname \
    "$( \
      command \
        -v \
        "cc" \
        "gcc" | \
        head \
          -n \
            1)")/../"

check() {
  cd \
    "${_pkgname}"
  make \
    -k \
    check
}

package() {
  cd \
    "${_pkgname}"
  make \
    DESTDIR="${pkgdir}" \
    PREFIX="${_usr}" \
    install
}

# vim: ft=sh syn=sh et
