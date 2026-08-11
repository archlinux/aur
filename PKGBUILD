# Maintainer: Gino O. <aur@1337.io>
# Upstream canonical: https://git.iris.to/#/npub1xdhnr9mrv47kkrn95k6cwecearydeh8e895990n3acntwvmgk2dsdeeycm/nostr-vpn
# GitHub below is the upstream-maintained mirror used for clickable links and release artifacts.
pkgname=nostr-vpn-bin
_pkgname=nostr-vpn
pkgver=4.1.7
pkgrel=1
pkgdesc='GTK4/libadwaita desktop client for Nostr VPN, a Tailscale-style private mesh VPN (prebuilt)'
arch=('x86_64')
url='https://github.com/mmalmi/nostr-vpn'
license=('MIT')
depends=(
  'gtk4'
  'libadwaita'
  'glib2'
  'cairo'
  'zbar'
  'curl'
  'xdg-utils'
  'nostr-vpn-cli'
)
provides=("nostr-vpn=${pkgver}")
conflicts=('nostr-vpn' 'nostr-vpn-git')
source=(
  "${pkgname}-${pkgver}.deb::https://github.com/mmalmi/nostr-vpn/releases/download/v${pkgver}/nostr-vpn-v${pkgver}-linux-x64.deb"
  'LICENSE'
)
sha256sums=(
  'c787ebaa56b6e302ddda7c1a3f3d8ec704e5fbba50e8bb4c1e9d0f73edeeecf8'
  '0db560024163fbcc5ee5cff1971684ca448da90088f341db083a38548846c3d5'
)

prepare() {
  cd "${srcdir}"
  rm -rf data
  install -d data
  bsdtar -xOf "${pkgname}-${pkgver}.deb" data.tar.xz | bsdtar -xf - -C data
}

package() {
  cd "${srcdir}/data"

  install -Dm755 usr/bin/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 usr/share/applications/${_pkgname}.desktop \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  local size
  for size in 16 22 24 32 48 64 128 256 512; do
    install -Dm644 "usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
  done

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
