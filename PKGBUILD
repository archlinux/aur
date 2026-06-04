# Maintainer: Max <max@example.com>
# Contributor: Max Browser Team

pkgname=max-browser-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Max Browser — Chromium-based browser with Firefox WebExtensions support"
arch=('x86_64')
url="https://github.com/max-browser/max-browser"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'atk' 'libdrm'
         'mesa' 'libxcb' 'alsa-lib' 'libxcomposite' 'libxdamage' 'libxrandr'
         'cups' 'libxkbcommon')
makedepends=()
optdepends=('pipewire: WebRTC desktop sharing')
provides=('max-browser')
conflicts=('max-browser')

# Replace this URL with your actual release download link
# Build the tar.gz: npm run build:linux  →  dist/max-browser-1.0.0-x64.tar.gz
# Upload to GitHub Releases or any direct-download host
source=("max-browser-${pkgver}.tar.gz::https://github.com/USER/max-browser/releases/download/v${pkgver}/max-browser-${pkgver}-x64.tar.gz"
        "max-browser.desktop")
sha256sums=('SKIP'
            'SKIP')
install=max-browser.install

package() {
  # Install the application
  install -dm755 "${pkgdir}/opt/max-browser"
  cp -a "${srcdir}/linux-unpacked/." "${pkgdir}/opt/max-browser/"

  # Symlink to /usr/bin
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/max-browser/max-browser" "${pkgdir}/usr/bin/max-browser"

  # Desktop entry
  install -Dm644 "${srcdir}/max-browser.desktop" \
    "${pkgdir}/usr/share/applications/max-browser.desktop"

  # Icons
  for size in 16 24 32 48 64 128 256; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    if [ -f "${pkgdir}/opt/max-browser/resources/app/assets/icon.png" ]; then
      convert "${pkgdir}/opt/max-browser/resources/app/assets/icon.png" \
        -resize ${size}x${size} \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/max-browser.png" 2>/dev/null || true
    fi
  done

  # License
  install -Dm644 "${srcdir}/linux-unpacked/resources/app/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
