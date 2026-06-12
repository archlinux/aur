# Maintainer: EFG Technologies <release@efg-technologies.com>
pkgname=zeed-bin
_pkgname=zeed-browser
pkgver=149.0.7827.102.58
pkgrel=1
pkgdesc="Chromium-based browser with bundled Zeed AI assistant (prebuilt)"
arch=('x86_64')
url="https://github.com/efg-technologies/zeed-browser-dist"
license=('custom:Zeed' 'MPL2' 'BSD')
provides=('zeed-browser' 'zeed')
conflicts=('zeed-browser' 'zeed')
depends=(
  'gtk3'
  'nss'
  'alsa-lib'
  'libxss'
  'libcups'
  'libdrm'
  'mesa'
  'pciutils'
  'libxkbcommon'
  'pango'
  'cairo'
  'at-spi2-core'
  'hicolor-icon-theme'
  'desktop-file-utils'
  'xdg-utils'
)
optdepends=(
  'libnotify: native notifications'
  'libappindicator-gtk3: tray icon'
  'pipewire: screen sharing'
)
options=('!strip' '!emptydirs')
source_x86_64=("zeed-${pkgver}-linux-x86_64.tar.xz::${url}/releases/download/v${pkgver}/zeed-${pkgver}-linux-x86_64.tar.xz")
source=(
  'zeed.sh'
  'zeed.desktop'
)
# sha256sums — committed in this repo and verified by the GitHub Action
# against the released tarball before deployment. Use 'SKIP' only for the
# very first publish of a new pkgver; the action's updpkgsums will fill it.
sha256sums=('dc3dde573f52183911a897b1a8e3160c9d3aacdaa88c4df02c1bd216958e320e'
            '44643ac4148288223db5829f4b1ccb3bd84fea19e4e43711e91ee5f52cf6401f')
sha256sums_x86_64=('082eae0bcd90f03c54969c40d06faf30a4fa34b8f7bd7c93480ff4af19175a75')

package() {
  # Browser binaries + resources live under /opt like every other Chromium
  # fork on AUR (brave-bin, microsoft-edge-stable-bin, ungoogled-chromium-bin).
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -a "${srcdir}/zeed-${pkgver}-linux-x86_64/." "${pkgdir}/opt/${_pkgname}/"

  # /usr/bin wrapper — sources ~/.config/zeed-flags.conf like chromium-launcher
  install -Dm755 "${srcdir}/zeed.sh" "${pkgdir}/usr/bin/zeed-browser"
  ln -s zeed-browser "${pkgdir}/usr/bin/zeed"

  # Desktop entry (http/https/mailto handlers enable default-browser support)
  install -Dm644 "${srcdir}/zeed.desktop" "${pkgdir}/usr/share/applications/zeed-browser.desktop"

  # Icons from the tarball (bundled in /opt/zeed-browser/icons/<size>.png)
  for s in 16 24 32 48 64 128 256; do
    src="${pkgdir}/opt/${_pkgname}/icons/${s}.png"
    [[ -f "$src" ]] || continue
    install -Dm644 "$src" \
      "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/zeed-browser.png"
  done

  # License(s)
  if [[ -f "${pkgdir}/opt/${_pkgname}/LICENSE" ]]; then
    install -Dm644 "${pkgdir}/opt/${_pkgname}/LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
