# Maintainer: Gravus <gravusbit@proton.me>
pkgname=ustb-wifi-tools-git
pkgver=r189.c93c02c
pkgrel=1
pkgdesc="Tool for querying USTB campus WiFi usage information"
arch=('x86_64')
url="https://github.com/CakeAL/ustb-wifi-tools"
license=('unknown')
provides=('ustb-wifi-tools')
conflicts=('ustb-wifi-tools')
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
  'git'
  'rust'
  'nodejs'
  'pnpm'
  'deno'
  'pkg-config'
)

options=('!lto')
source=("${pkgname}::git+https://github.com/CakeAL/ustb-wifi-tools.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  cd src-tauri
  export CARGO_HOME="${srcdir}/.cargo"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}"
  export CARGO_HOME="${srcdir}/.cargo"
  pnpm install
  pnpm build
  pnpm tauri build --no-bundle
}

package() {
  cd "${srcdir}/${pkgname}"

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
