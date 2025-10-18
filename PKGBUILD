pkgname=streambooru-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="StreamBooru — cross‑platform Electron app to browse multiple booru sites"
arch=('x86_64')
url="https://github.com/Amateur-God/StreamBooru"
license=('GPL3')

# Electron runtime deps commonly needed on Arch
depends=('alsa-lib' 'nss' 'gtk3' 'libxss' 'libxtst')
optdepends=(
  'libappindicator-gtk3: tray icon support'
  'libnotify: desktop notifications'
  'xdg-utils: open links with xdg-open'
)

provides=('streambooru')
conflicts=('streambooru')

# Download the prebuilt Linux tarball from Releases and install wrapper + desktop entry
source=(
  "https://github.com/Amateur-God/StreamBooru/releases/download/v${pkgver}/StreamBooru-${pkgver}-linux-x64.tar.gz"
  "streambooru.sh"
  "streambooru.desktop"
)
sha256sums=(
  '0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5' # StreamBooru-${pkgver}-linux-x64.tar.gz
  'SKIP'       # streambooru.sh (tracked in this repo)
  'SKIP'       # streambooru.desktop (tracked in this repo)
)

package() {
  install -d "${pkgdir}/opt/streambooru-bin" \
             "${pkgdir}/usr/bin" \
             "${pkgdir}/usr/share/applications" \
             "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

  # Unpack prebuilt app into /opt/streambooru-bin
  tar -xzf "${srcdir}/StreamBooru-${pkgver}-linux-x64.tar.gz" \
      -C "${pkgdir}/opt/streambooru-bin" --strip-components=1

  # Ensure chrome-sandbox has correct permissions for Electron's sandbox (common for -bin packages)
  if [[ -f "${pkgdir}/opt/streambooru-bin/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/streambooru-bin/chrome-sandbox" || true
  fi

  # Install launcher wrapper and a compatibility symlink
  install -Dm755 "${srcdir}/streambooru.sh" "${pkgdir}/usr/bin/streambooru"
  ln -s streambooru "${pkgdir}/usr/bin/streambooru-bin"

  # Desktop entry
  install -Dm644 "${srcdir}/streambooru.desktop" "${pkgdir}/usr/share/applications/streambooru.desktop"

  # Icon if present (adjust if your build keeps icons elsewhere)
  if [[ -f "${pkgdir}/opt/streambooru-bin/resources/app.asar.unpacked/build/icon.png" ]]; then
    install -Dm644 "${pkgdir}/opt/streambooru-bin/resources/app.asar.unpacked/build/icon.png" \
      "${pkgdir}/usr/share/icons/hicolor/256x256/apps/streambooru.png"
  fi
}
