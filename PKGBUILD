# Maintainer: Yubo-Cao <cao2006721 at gmail dot com>

pkgname=roamgate-bin
_pkgname=roamgate
pkgver=0.8.1
pkgrel=1
pkgdesc="Web and PWA client for Herdr: control terminals, monitor coding agents, review files and diffs (formerly herdr-gui)"
arch=('x86_64' 'aarch64')
url="https://github.com/powerfooI/roamgate"
license=('MIT')
depends=('glibc' 'hicolor-icon-theme')
optdepends=(
  'herdr: local Herdr server to connect to'
  'openssh: connect to remote Herdr servers'
  'xdg-utils: open the browser with --open'
)
provides=("${_pkgname}=${pkgver}" 'herdr-gui')
conflicts=("${_pkgname}" 'herdr-gui' 'herdr-gui-bin')
replaces=('herdr-gui-bin')
# The executable is a Bun single-file build; stripping it removes the embedded app.
options=('!strip' '!debug')
install=${pkgname}.install
_raw="${url}/raw/v${pkgver}"
source=(
  "${_pkgname}-${pkgver}-LICENSE::${_raw}/LICENSE"
  "${_pkgname}-${pkgver}-THIRD_PARTY_NOTICES.md::${_raw}/THIRD_PARTY_NOTICES.md"
  "${_pkgname}-${pkgver}-LOBE-ICONS.txt::${_raw}/LICENSES/LOBE-ICONS.txt"
  "${_pkgname}-${pkgver}-NERD-FONTS.txt::${_raw}/LICENSES/NERD-FONTS.txt"
  "${_pkgname}-${pkgver}-PI.txt::${_raw}/LICENSES/PI.txt"
  "${_pkgname}-${pkgver}-icon-32.png::${_raw}/web/public/roamgate-icon-32.png"
  "${_pkgname}-${pkgver}-icon-192.png::${_raw}/web/public/roamgate-icon-192.png"
  "${_pkgname}-${pkgver}-icon-512.png::${_raw}/web/public/roamgate-icon-512.png"
  "${_pkgname}.service"
  "${_pkgname}.desktop"
)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.xz")
sha256sums=('f0366103e89c5b21afe3f414c1f708dfa2e6d261e54cd2ea1b893cb2188ea61e'
            '2bcdeccfb9769301b5068fa79235231a4c843c7de71d77866fe817b38dae1c2a'
            'add9d7531d1b21646317a8958e38fc727506fa39d24bdecb44154d943c82753a'
            'a288de4db829f0a0b0cd028b0020bc2daef1de9f3d6b4a82790fd4ae898f26a1'
            '4f6a1985796db5225e3b1e59972bd47e07a27a0748427cb3d3c8fbf39f9311f0'
            '53891ff44ee1e375b93608b384f70ab413c47481b3c6ec9138eb1225376d5bad'
            '4c1296d4a45e3bb2c9ecd6e5420a60558fdd1bb6762c002350b0487006267ca4'
            '43b67c7e4667c1bed11495a19bff95d63709c350e2a0cdd5f62c3b192df7e4dc'
            '715b0c13487119c06bb02f30daad92836601b326d32c2232dbe1127d1c98fbb1'
            'dd5f7d359fe16c6bae06ba3cbb199f56b7e87653404eb868c5455132e9122ed1')
sha256sums_x86_64=('a7ae579a4a636e4515f1552b39e131437d94774a9468083fce9c35b4b89bedc4')
sha256sums_aarch64=('b4d0ee9aa9a6cdbf9cca68cb2f15b2d5968e0120d713163d1628344ad4e0d960')

package() {
  local platform='x64'
  [[ $CARCH == aarch64 ]] && platform='arm64'

  install -Dm755 "${_pkgname}-linux-${platform}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  local size
  for size in 32 192 512; do
    install -Dm644 "${_pkgname}-${pkgver}-icon-${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
  done

  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  local notice
  for notice in LOBE-ICONS NERD-FONTS PI; do
    install -Dm644 "${_pkgname}-${pkgver}-${notice}.txt" \
      "${pkgdir}/usr/share/licenses/${pkgname}/${notice}.txt"
  done
  install -Dm644 "${_pkgname}-${pkgver}-THIRD_PARTY_NOTICES.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
}
