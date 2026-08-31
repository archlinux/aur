# Maintainer: kazu0617 <archlinux at kazu0617 dot net>

pkgname=vrcx-0
pkgver=2.27.1
pkgrel=1
pkgdesc='Fast, lightweight VRCX implementation built with Tauri and Rust'
arch=('x86_64')
url='https://github.com/Map1en/VRCX-0'
license=('GPL-3.0-only' 'MIT')
options=('!lto')
depends=(
  'glibc'
  'gtk3'
  'libayatana-appindicator'
  'librsvg'
  'openssl'
  'webkit2gtk-4.1'
  'xdotool'
)
makedepends=(
  'clang'
  'cmake'
  'git'
  'nodejs'
  'npm>=11.5.0'
  'rust'
)
source=(
  "VRCX-0-${pkgver}.tar.gz::https://github.com/Map1en/VRCX-0/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('3444bd1f56bccc8fac7c591288a4de08a565890e54ca60287993d60321881fd3')
prepare() {
  cd "VRCX-0-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo"
  export npm_config_cache="${srcdir}/npm-cache"
  export HUSKY=0

  npm ci
  cargo fetch --locked
}

build() {
  cd "VRCX-0-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo"
  export CARGO_NET_OFFLINE=true
  export npm_config_cache="${srcdir}/npm-cache"
  export VRCX_0_DISABLE_UPDATE_CHECK=1
  export VRCX_0_WEBKIT_BUILD_TARGET=safari18.2

  npm run tauri:build -- --ci --no-bundle --config src-tauri/tauri.linux.conf.json
}

check() {
  cd "VRCX-0-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo"
  export CARGO_NET_OFFLINE=true
  export npm_config_cache="${srcdir}/npm-cache"
  unset VRCX_0_DISABLE_UPDATE_CHECK

  npm run format:check
  npm run lint
  npm run typecheck
  npm test
  cargo test --workspace --exclude vrcx-0 --locked --frozen
}

package() {
  cd "VRCX-0-${pkgver}"

  install -Dm755 target/release/vrcx-0 \
    "${pkgdir}/usr/bin/vrcx-0"

  install -d "${pkgdir}/usr/share/applications"
  printf '%s\n' \
    '[Desktop Entry]' \
    'Type=Application' \
    'Name=VRCX-0' \
    'Comment=Fast, lightweight VRCX implementation' \
    'Exec=vrcx-0 %u' \
    'Icon=vrcx-0' \
    'Terminal=false' \
    'Categories=Network;' \
    'StartupWMClass=VRCX-0' \
    'MimeType=x-scheme-handler/vrcx-0;' \
    >"${pkgdir}/usr/share/applications/vrcx-0.desktop"
  install -Dm644 src-tauri/icons/32x32.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/vrcx-0.png"
  install -Dm644 src-tauri/icons/64x64.png \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/vrcx-0.png"
  install -Dm644 src-tauri/icons/128x128.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/vrcx-0.png"
  install -Dm644 src-tauri/icons/128x128@2x.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/vrcx-0.png"
  install -Dm644 src-tauri/icons/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/vrcx-0.png"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 LICENSES/MIT.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 src-tauri/resources/licenses/THIRD_PARTY_NOTICES.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.txt"
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
