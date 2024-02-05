# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="metamask"
pkgbase="${_pkg}"
_pkgname="${pkgbase}-extension"
pkgname=(
  "${pkgbase}-chrome"
  "${pkgbase}-firefox"
)
_addon_id="2e742fd4-1e66-4604-89a2-b99cc03f171a"
_pkgver=10.25.0
pkgver=10.32.0
pkgrel=1
pkgdesc='Chrome extension that enables browsing Ethereum blockchain enabled websites'
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
makedepends=(
  'git'
  'nodejs-lts-gallium'
  'yarn'
  'typescript'
)
_commit="d52ef735146a58016f870322adfb901ee1d95f6c" # $pkgver
source=(
  "${_pkg}::git+${url}.git#commit=${_commit}"
  "${_pkg}_policy.json"
)
sha512sums=(
  'SKIP'
  '912bc9a9ac604b8603bbc34bbc7793caaad4b796ecd3fe59dea2e2e53e22de9573fb9f84e5b2e3601bf2d9193d71f858b066e4a086a8818d9a97cb8fc8d141e4'
)

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

package_metamask-chrome() {
  depends+=(
    'chromium'
  )
  install \
    -Dm644 \
    "${srcdir}/${_pkg}_policy.json" \
    "${pkgdir}/etc/chromium/policies/managed/${_pkg}_policy.json"
}

package_metamask-firefox() {
  depends+=(
    'firefox'
  )
  extensions_dir="${pkgdir}/usr/lib/firefox/browser/extensions"
  install \
    -Dm644 \
    "${srcdir}/${_pkg}/builds/${_pkg}-firefox-${_pkgver}.zip" \
    "${extensions_dir}/webextension@${_pkg}.io.xpi"
}

# vim:set sw=2 sts=-1 et:
