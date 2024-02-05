# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Marcell Meszaros (MarsSeed) <marcell.meszaros@runbox.eu>

_py="python"
_py2="${_py}2"
_pkgname=reallymakepkg
pkgname="${_pkgname}-git"
pkgver=1.1.1.1.1.r1.g3d24765
pkgrel=1
pkgdesc="System-independent makepkg"
arch=(
  any
)
_repo="https://github.com"
_ns="themartiancompany"
url="${_repo}/${_ns}/${_pkgname}"
license=(
  AGPL3
)
depends=(
  pacman
)
makedepends=(
  git
)
optdepends=(
  "${_py}-pygments: colorized output and syntax highlighting"
  # "${_py2}-pygments: colorized output and syntax highlighting"
)
provides=(
  "${_pkgname}=${pkgver}")
conflicts=(
  "${_pkgname}")
_url="file://${HOME}/${_pkgname}"
source=(
  "git+${url}"
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
      --tags | \
      sed \
        's/-/+/g')"
  _parse_ver \
    "${_pkgver}"
}

package() {
  cd \
    "${_pkgname}"
  make \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ft=sh syn=sh et
