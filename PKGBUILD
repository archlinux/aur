# Maintainer: Zaid Ajo <zaidejjodev@gmail.com>
# Template — replace zaidejjo and sha256sums before publishing.

pkgname=omniapi-desktop-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="Blazing-fast API client — desktop GUI (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/zaidejjo/omniapi"
license=('MIT')
depends=(
  'fuse2'
  'gtk3'
  'webkit2gtk-4.1'
)
optdepends=('libappindicator-gtk3: tray icon')

# Tauri Linux AppImage — name is `{productName}_{version}_amd64.AppImage`
# e.g. omniapi_0.1.0_amd64.AppImage
source=(
  "${url}/releases/download/v${pkgver}/omniapi_${pkgver}_amd64.AppImage"
  "https://raw.githubusercontent.com/zaidejjo/omniapi/v${pkgver}/README.md"
  "https://raw.githubusercontent.com/zaidejjo/omniapi/v${pkgver}/LICENSE"
)
sha256sums=('bbe50ba110b8e14323b2766ce13cbd2aee7e6ebcc43f96c9dcc373baba3a5b27')

package() {
  install -d "${pkgdir}/usr/bin"

  # AppImage is a self-contained executable
  install -Dm755 "${srcdir}/omniapi_${pkgver}_amd64.AppImage" \
    "${pkgdir}/usr/bin/omniapi-desktop"

  # Desktop entry
  install -d "${pkgdir}/usr/share/applications"
  cat >"${pkgdir}/usr/share/applications/omniapi-desktop.desktop" <<EOF
[Desktop Entry]
Name=OmniAPI
Comment=Blazing-fast API client
Exec=/usr/bin/omniapi-desktop
Icon=omniapi-desktop
Terminal=false
Type=Application
Categories=Development;Utility;
StartupWMClass=omniapi-desktop
EOF

  # Install docs
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Extract icon from AppImage (it's an ISO mount or you can embed one)
  # For now, provide a minimal placeholder. Replace with a real icon later.
  install -d "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  # If the AppImage was extracted already, you can grab its icon from there.
}
