# Maintainer: goshitsarch <goshitsarch@proton.me>
pkgname=gosh-fetch-bin
pkgver=2.0.6
pkgrel=2
pkgdesc='Modern download manager with HTTP and BitTorrent support, built with Electron and a native Rust engine'
arch=('x86_64' 'aarch64')
url='https://github.com/goshitsarch-eng/Gosh-Fetch'
license=('AGPL-3.0-only')
depends=('gtk3' 'nss' 'alsa-lib' 'hicolor-icon-theme')
optdepends=('libnotify: desktop notifications'
            'libappindicator-gtk3: system tray support')
provides=('gosh-fetch')
conflicts=('gosh-fetch')
options=(!strip !debug)
_appimage_x86_64="Gosh-Fetch-${pkgver}.AppImage"
_appimage_aarch64="Gosh-Fetch-${pkgver}-arm64.AppImage"
source_x86_64=("${_appimage_x86_64}::${url}/releases/download/v${pkgver}/${_appimage_x86_64}")
source_aarch64=("${_appimage_aarch64}::${url}/releases/download/v${pkgver}/${_appimage_aarch64}")
sha256sums_x86_64=('377add76fb69c025aeb92f6684186b0a5a1d1b1bf7f02cfd4efab89cc68204e2')
sha256sums_aarch64=('764c0d2e150db5119c1678d5b887f9cbb5fcb5561dcef440385fa458fe4bd564')

prepare() {
  if [[ "$CARCH" == "x86_64" ]]; then
    chmod +x "${_appimage_x86_64}"
    "./${_appimage_x86_64}" --appimage-extract
  else
    chmod +x "${_appimage_aarch64}"
    "./${_appimage_aarch64}" --appimage-extract
  fi
}

package() {
  # Install app files
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a squashfs-root/. "${pkgdir}/opt/${pkgname}/"

  # Fix permissions — squashfs-root extracts as 700, need world-readable
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} +
  find "${pkgdir}/opt/${pkgname}" -type f -name "*.so*" -exec chmod 755 {} +
  chmod 755 "${pkgdir}/opt/${pkgname}/gosh-fetch"
  chmod 755 "${pkgdir}/opt/${pkgname}/chrome_crashpad_handler"
  chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox" 2>/dev/null || true

  # Symlink binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/gosh-fetch" "${pkgdir}/usr/bin/gosh-fetch"

  # Desktop entry
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/gosh-fetch.desktop" <<EOF
[Desktop Entry]
Name=Gosh-Fetch
Comment=Modern download manager
Exec=gosh-fetch %U
Icon=gosh-fetch
Type=Application
Categories=Network;FileTransfer;
StartupWMClass=gosh-fetch
MimeType=application/x-bittorrent;x-scheme-handler/magnet;
EOF

  # Icons
  for size in 32x32 128x128 256x256; do
    if [[ -f "squashfs-root/usr/share/icons/hicolor/${size}/apps/gosh-fetch.png" ]]; then
      install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}/apps/gosh-fetch.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}/apps/gosh-fetch.png"
    fi
  done

  # Fallback: use bundled icon
  if [[ -f "squashfs-root/gosh-fetch.png" ]]; then
    install -Dm644 "squashfs-root/gosh-fetch.png" \
      "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gosh-fetch.png"
  fi

  # License
  install -Dm644 "squashfs-root/LICENSE"* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || \
  install -Dm644 "squashfs-root/resources/LICENSE"* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
