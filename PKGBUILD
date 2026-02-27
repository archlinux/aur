# Maintainer: Gravus <gravusbit@proton.me>
pkgname=ustb-wifi-tools
pkgver=1.2.1
pkgrel=1
pkgdesc="Tool for querying USTB campus WiFi usage information"
arch=('x86_64')
url="https://github.com/CakeAL/ustb-wifi-tools"
license=('MIT')
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
  'pkg-config'
)

options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CakeAL/ustb-wifi-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dec9e6bc3682de1c2a424a17ca3211b5ac17485ddfc22fce485b470a8e13af34')

prepare() {
  cd "${srcdir}/ustb-wifi-tools-${pkgver}"
  # Fix Linux build: remove unused `update` import (upstream PR: https://github.com/CakeAL/ustb-wifi-tools/pull/19)
  sed -i 's/utils::{complete_month_pay_data, get_session_id, get_store_path, update}/utils::{complete_month_pay_data, get_session_id, get_store_path}/' \
    src-tauri/src/commands.rs
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

