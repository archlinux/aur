pkgname=fixplay-diagnosetool
pkgver=0.1.6
pkgrel=1
pkgdesc="Cross-platform diagnostic tool for gaming consoles"
arch=('x86_64')
url="https://github.com/fabioudev/fixplay-diagnoseTool"
license=('custom:unknown')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
  'hicolor-icon-theme'
)
makedepends=('rust' 'cargo' 'npm' 'curl')
provides=('fixplay-diagnosetool')
conflicts=('fixplay-diagnosetool-bin')
source=("fixplay-diagnoseTool-v${pkgver}.tar.gz::https://github.com/fabioudev/fixplay-diagnoseTool/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "fixplay-diagnoseTool-${pkgver}"

  npm ci

  curl -fsSL "https://raw.githubusercontent.com/amoamare/Console-Service-Tool/master/Resources/ErrorCodes.json" \
    -o src-tauri/resources/error_codes.json

  # Build frontend first (tauri-build embeds it into the binary)
  npm run build

  # Build Rust binary directly — skips AppImage/deb/rpm bundling
  # Set Tauri production env vars (normally set by tauri CLI)
  TAURI_ENV_DEBUG=false \
  TAURI_ENV_PLATFORM=linux \
  TAURI_ENV_ARCH=x86_64 \
  TAURI_ENV_FAMILY=unix \
  TAURI_ENV_TARGET_TRIPLE=x86_64-unknown-linux-gnu \
  cargo build --release
}

package() {
  cd "fixplay-diagnoseTool-${pkgver}"

  install -Dm755 "target/release/fixplay-tauri" "${pkgdir}/usr/bin/fixplay-diagnosetool"

  install -Dm644 "src-tauri/resources/error_codes.json" \
    "${pkgdir}/usr/lib/fixplay-diagnosetool/resources/error_codes.json"

  install -Dm755 "src-tauri/binaries/flashrom" \
    "${pkgdir}/usr/lib/fixplay-diagnosetool/binaries/flashrom"

  install -Dm644 "src-tauri/icons/icon_256x256.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/fixplay-diagnosetool.png"

  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/fixplay-diagnosetool.desktop" <<'EOF'
[Desktop Entry]
Name=fixplay-diagnoseTool
Comment=Cross-platform diagnostic tool for gaming consoles
Exec=fixplay-diagnosetool
Icon=fixplay-diagnosetool
Type=Application
Categories=Utility;Development;
Terminal=false
StartupNotify=true
EOF
}
