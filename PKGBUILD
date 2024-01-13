# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <pellegrinoprevete@gmail.com>
#
# Contributor: Marcell Meszaros (MarsSeed) <marcell.meszaros@runbox.eu>
# Contributor: Ernesto Castellotti <erny.castell@gmail.com>

# shellcheck disable=SC2034
_py="python"
_pkg="blivet"
_pkgname="python-${_pkg}"
pkgname="${_pkgname}-git"
pkgver=2.0.2+1+r1649+gbadffc78
pkgrel=1
pkgdesc='a python module for management of a system storage configuration - python 3.x pkg'
arch=(
  'x86_64'
  'i686'
  'pentium4'
  'arm'
  'armv7h'
  'aarch64'
)
depends=(
  'hawkey'
  'mdadm'
  'mpathconf'
  'multipath-tools'
  'libblockdev'
  'libselinux'
  "${_py}-six"
  "${_py}-pyudev"
  "${_py}-pyparted"
  "${_py}-pykickstart"
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
makedepends=(
  'git'
  "${_py}-setuptools"
)
license=(
  'LGPL2.1'
)
url='http://fedoraproject.org/wiki/Blivet'
source=(
  "git+https://github.com/storaged-project/${_pkg}.git"
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
  local \
    _pkgver
  cd \
    "${_pkg}" || \
    exit
  _pkgver="$( \
    git \
      describe \
      --tags | \
      sed \
        's/[^-]*-g/r&/;s/-/+/g')"
  _pkgver="${_pkgver##blivet+}"
  _parse_ver \
    "${_pkgver}"
}

# shellcheck disable=SC2154
package() {
  cd \
    "${srcdir}/${_pkg}" || \
    exit
  "${_py}" \
    setup.py \
    install \
      --root="${pkgdir}" \
      --optimize=1
}

# vim:set sw=2 sts=-1 et:
