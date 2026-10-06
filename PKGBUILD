# Maintainer: Yubo-Cao <cao2006721 at gmail dot com>

pkgname=thyra-bin
_pkgname=thyra
pkgver=0.10.1
pkgrel=1
pkgdesc="Browser and PWA door into your Herdr terminals and agents, with first-class mobile support"
arch=('x86_64' 'aarch64')
url="https://github.com/Yubo-Cao/thyra"
license=('MIT')
depends=('glibc' 'hicolor-icon-theme')
optdepends=(
  'herdr: local Herdr server (Thyra works with stock Herdr 0.9.x; the Yubo-Cao/herdr fork adds collaboration and live handoff)'
  'openssh: connect to remote Herdr servers'
  'cloudflared: public access through thyra-tunnel.service'
  'xdg-utils: open the browser with --open'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
# The executable is a Bun single-file build; stripping it removes the embedded app.
options=('!strip' '!debug')
install=${pkgname}.install
_raw="${url}/raw/v${pkgver}"
source=(
  "${_pkgname}-${pkgver}-LICENSE::${_raw}/LICENSE"
  "${_pkgname}-${pkgver}-THIRD_PARTY_NOTICES.md::${_raw}/THIRD_PARTY_NOTICES.md"
  "${_pkgname}-${pkgver}-LOBE-ICONS.txt::${_raw}/LICENSES/LOBE-ICONS.txt"
  "${_pkgname}-${pkgver}-MAPLE-MONO.txt::${_raw}/LICENSES/MAPLE-MONO.txt"
  "${_pkgname}-${pkgver}-NERD-FONTS.txt::${_raw}/LICENSES/NERD-FONTS.txt"
  "${_pkgname}-${pkgver}-PI.txt::${_raw}/LICENSES/PI.txt"
  "${_pkgname}-${pkgver}-WEBRTC-VAD.txt::${_raw}/LICENSES/WEBRTC-VAD.txt"
  "${_pkgname}-${pkgver}.service::${_raw}/deploy/systemd/thyra.service"
  "${_pkgname}-${pkgver}-tunnel.service::${_raw}/deploy/systemd/thyra-tunnel.service"
  "${_pkgname}-${pkgver}.env.example::${_raw}/deploy/thyra.env.example"
  "${_pkgname}-${pkgver}-icon.svg::${_raw}/web/public/thyra-icon.svg"
  "${_pkgname}-${pkgver}-icon-32.png::${_raw}/web/public/thyra-icon-32.png"
  "${_pkgname}-${pkgver}-icon-192.png::${_raw}/web/public/thyra-icon-192.png"
  "${_pkgname}-${pkgver}-icon-512.png::${_raw}/web/public/thyra-icon-512.png"
  "${_pkgname}.desktop"
)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.xz")
sha256sums=('f0366103e89c5b21afe3f414c1f708dfa2e6d261e54cd2ea1b893cb2188ea61e'
            '63456db6d1e58df6f36aef0494e074c64c1227e76e77da78d924a6d221874a94'
            'add9d7531d1b21646317a8958e38fc727506fa39d24bdecb44154d943c82753a'
            '15006f5caa12d350e1d4ba9e33f9c61c30a87fea96f6f4a6d46f18f9d50f990c'
            'a288de4db829f0a0b0cd028b0020bc2daef1de9f3d6b4a82790fd4ae898f26a1'
            '4f6a1985796db5225e3b1e59972bd47e07a27a0748427cb3d3c8fbf39f9311f0'
            '7248ba5228172e152b8004ad624232444d3d3f591080a99cdbd2bf0d4383365c'
            '50dd6d4a1a9884b733acfc1f5066e0579816fada7f9ababd075cc16f9a81c12c'
            '26b0fa9a5e74926eb914f124ba8f7da305580782f60c37d9fcc71b659efb4abb'
            '176d937e34a260db1afdccfd4d0cb6b1318f9e0bfb34ea63463b5e6383770e2e'
            '552da7262d150a990c88f3641589ae8d65d815d4def58ba0efc04a01b36b5017'
            'c394bad2e598bb64721ad67cf85c0c6fa0e6e0f6f4a88ba5acff8a59783fd07f'
            '5b254c6df910a4347975080a85f64faeb2824768094bb293b6ddbee313bec376'
            '0e31760f5aa03e410af905c3d9ee852d8fb54c5889b8baf609c3c35a70bdfeba'
            'd6cd4a014074753669705195719930dd55ed8483a180dfd16318508a65f41b0c')
sha256sums_x86_64=('a5e980d5d8d97c8c8c9d489b369bdccc0025600d93c68d6ee0185f6ede8e8138')
sha256sums_aarch64=('e0a80b7156d42487ef63f74a00795dab2ef9ec758f211d8bdd69e44f7d48081f')

prepare() {
  # Point upstream's user unit at the packaged binary and turn off the in-app
  # updater, which cannot replace a pacman-owned /usr/bin/thyra.
  sed -e 's|^ExecStart=%h/\.local/bin/thyra$|ExecStart=/usr/bin/thyra|' \
    -e '/^\[Service\]$/a Environment=THYRA_DISABLE_UPDATE_CHECK=1' \
    "${_pkgname}-${pkgver}.service" > "${_pkgname}.service"
  if ! grep -qx 'ExecStart=/usr/bin/thyra' "${_pkgname}.service"; then
    echo "upstream thyra.service ExecStart changed; update prepare()" >&2
    return 1
  fi
}

package() {
  local platform='x64'
  [[ $CARCH == aarch64 ]] && platform='arm64'

  install -Dm755 "${_pkgname}-linux-${platform}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
  install -Dm644 "${_pkgname}-${pkgver}-tunnel.service" \
    "${pkgdir}/usr/lib/systemd/user/${_pkgname}-tunnel.service"
  install -Dm644 "${_pkgname}-${pkgver}.env.example" \
    "${pkgdir}/usr/share/doc/${_pkgname}/thyra.env.example"

  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${_pkgname}-${pkgver}-icon.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  local size
  for size in 32 192 512; do
    install -Dm644 "${_pkgname}-${pkgver}-icon-${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
  done

  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  local notice
  for notice in LOBE-ICONS MAPLE-MONO NERD-FONTS PI WEBRTC-VAD; do
    install -Dm644 "${_pkgname}-${pkgver}-${notice}.txt" \
      "${pkgdir}/usr/share/licenses/${pkgname}/${notice}.txt"
  done
  install -Dm644 "${_pkgname}-${pkgver}-THIRD_PARTY_NOTICES.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
}
