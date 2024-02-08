# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_git="false"
_pkg="metamask"
_browsers=(
  "chrome"
  "firefox"
  # "opera"
)
_pkgbase="${_pkg}"
pkgbase="${_pkg}-git"
_pkgname="${pkgbase}-extension"
pkgname=()
for _browser \
  in "${_browsers[@]}"; do
  pkgname+=(
    "${_pkg}-${_browser}-git"
  )
done
_addon_id="2e742fd4-1e66-4604-89a2-b99cc03f171a"
_pkgver=10.25.0
pkgver=10.32.0
pkgrel=1
_pkgdesc() {
  local \
    _browser="${1}" \
    _desc=()
  _desc=(
    "${_browser} extension that enables"
    "interacting with Ethereum Virtual Machine"
    "networks enabled websites"
  )
  echo \
    "${_desc[@]}"
}
pkgdesc="$( \
  _pkgdesc \
    "Browser")"
_http="https://github.com"
_ns="MetaMask"
url="${_http}/${_ns}/${_pkgname}"
license=(
  'custom:consensys'
)
arch=(
  'any'
)
depends=()
provides=(
  "${_pkg}=${pkgver}"
)
conflicts=(
  "${_pkg}"
)
makedepends=(
  'nodejs>=20.0'
  'yarn'
  'typescript'
)
source=(
  "${_pkg}_policy.json"
)
sha512sums=(
  '912bc9a9ac604b8603bbc34bbc7793caaad4b796ecd3fe59dea2e2e53e22de9573fb9f84e5b2e3601bf2d9193d71f858b066e4a086a8818d9a97cb8fc8d141e4'
  'SKIP'
)
[[ "${_git}" == true ]] && \
  makedepends+=(
    "git"
  ) && \
  source+=(
    "${_pkg}::git+${url}.git"
  )
[[ "${_git}" == false ]] && \
  source+=(
    "${url}/archive/refs/heads/develop.zip"
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
    "${_pkg}"
  _pkgver="$( \
    git \
      describe \
      --tags | \
      sed \
        's/-/+/g')"
  _parse_ver \
    "${_pkgver}"
}
build() {
  cd \
    "${srcdir}/${_pkg}"
  ls \
    -a
  yarn # setup
  cp \
    ".${_pkg}rc.dist" \
    ".${_pkg}rc"
  sed \
    -i \
    -e \
    's/00000000000/2f8ebfee0f81453d83fe6219b9a59754/g' \
    ".${_pkg}rc"
  yarn \
    dist
}

package_metamask-chrome-git() {
  local \
    _browser="chromium"
  pkgdesc="$( \
    _pkgdesc \
      "Chrome")"
  depends+=(
    "${_browser}"
  )
  provides=(
    "${_pkg}-${_browser}=${pkgver}"
    "${_pkg}-chrome=${pkgver}"
  )
  conflicts=(
    "${_pkg}-${_browser}"
    "${_pkg}-chrome"
  )
  install \
    -Dm644 \
    "${srcdir}/${_pkg}_policy.json" \
    "${pkgdir}/etc/${_browser}/policies/managed/${_pkg}_policy.json"
}

package_metamask-firefox-git() {
  local \
    _browser="firefox"
  pkgdesc="$( \
    _pkgdesc \
      "Firefox")"
  depends+=(
    "${_browser}"
  )
  provides=(
    "${_pkg}-${_browser}=${pkgver}"
  )
  conflicts=(
    "${_pkg}-${_browser}"
  )
  extensions_dir="${pkgdir}/usr/lib/${_browser}/browser/extensions"
  install \
    -Dm644 \
    "${srcdir}/${_pkg}/builds/${_pkg}-${_browser}-${_pkgver}.zip" \
    "${extensions_dir}/webextension@${_pkg}.io.xpi"
}

# vim:set sw=2 sts=-1 et:
