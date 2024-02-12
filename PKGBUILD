# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete (dvorak) <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>

# shellcheck disable=SC2034
_git=true
_offline=true
_proj="hip"
_pkg="grub"
_pkgname="arch-${_pkg}"
pkgname="${_pkgname}-git"
pkgver=0.1.1.1.r3.g263f802
pkgrel=1
_pkgdesc=(
  'Produces a standalone GRUB binary'
  'compatible with Arch Linux.'
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'any'
)
license=(
  'AGPL3'
)
_gh="https://github.com"
_arch="https://gitlab.archlinux.org"
_arch_ns="tallero"
_gh_ns="themartiancompany"
_ns="${_gh_ns}"
_http="${_gh}"
url="${_http}/${_ns}/${_pkgname}"
_local="file://${HOME}/${_pkgname}"
depends=(
  "${_pkg}"
  bash
)
makedepends=(
  "make"
)
groups=(
  "${_proj}"
)
checkdepends=(
  'shellcheck'
)
optdepends=(
  'luks-tools: Format LUKS volume in a GRUB compatible format'  
)
provides=(
  "${_pkgname}=${pkgver}"
  "mk${_pkg}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
sha256sums=()
source=()
_url="${url}.git"
_branch="master"
[[ "${_offline}" == true ]] && \
  _url="${_local}"
[[ "${_git}" == true ]] && \
  makedepends+=(
    'git'
  ) && \
  source+=(
    "${_pkgname}::git+${_url}"
  ) && \
  sha256sums+=(
    'SKIP'
  )
[[ "${_git}" == false ]] && \
  source+=(
    "${pkgname}-${pkgver}.tar.gz::${url}/${_branch}.tar.gz"
  ) && \
  sha256sums+=(
    "SKIP"
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
    _pkgver
  cd \
    "${_pkgname}" || \
    exit
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
  make \
    -k check \
    -C \
      "${_pkgname}"
}

# shellcheck disable=SC2154
package() {
  make \
    DESTDIR="${pkgdir}" \
    PREFIX="/usr" \
    install \
      -C \
        "${_pkgname}"
}

# vim:set sw=2 sts=-1 et:
