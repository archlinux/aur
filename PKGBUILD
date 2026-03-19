# Maintainer: Gravus <gravusbit@proton.me>
pkgname=ustb-wifi-tools
pkgver=1.3.0
pkgrel=1
pkgdesc="Tool for querying USTB campus WiFi usage information"
arch=('x86_64')
url="https://github.com/CakeAL/ustb-wifi-tools"
license=('unknown')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'appmenu-gtk-module'
  'libappindicator-gtk3'
  'librsvg'
  'openssl'
  'curl'
)
makedepends=(
  'rust'
  'nodejs'
  'pnpm'
  'deno'
  'pkg-config'
)

options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CakeAL/ustb-wifi-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ae4f58526b4f831ad3500010ad5e357cac2fa53896b4432339787d1e20558151')

prepare() {
  cd "${srcdir}/ustb-wifi-tools-${pkgver}"
  cd src-tauri
  export CARGO_HOME="${srcdir}/.cargo"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/ustb-wifi-tools-${pkgver}"
  export CARGO_HOME="${srcdir}/.cargo"
  pnpm install
  pnpm build
  pnpm tauri build --no-bundle
}

package() {
  cd "${srcdir}/ustb-wifi-tools-${pkgver}"

  install -Dm755 "src-tauri/target/release/ustb-wifi-tools" \
    "${pkgdir}/usr/bin/ustb-wifi-tools"

  install -Dm644 "src-tauri/icons/32x32.png" \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/ustb-wifi-tools.png"
  install -Dm644 "src-tauri/icons/128x128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ustb-wifi-tools.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ustb-wifi-tools.png"
  install -Dm644 "src-tauri/icons/icon.png" \
    "${pkgdir}/usr/share/pixmaps/ustb-wifi-tools.png"

  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/ustb-wifi-tools.desktop" <<EOF
[Desktop Entry]
Name=USTB WiFi Tools
Comment=A Tauri App for USTB Wifi
Exec=ustb-wifi-tools
Icon=ustb-wifi-tools
Terminal=false
Type=Application
Categories=Network;Utility;
EOF
}
