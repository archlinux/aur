# Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=opentaikohub
pkgver=0.2.9
pkgrel=1
pkgdesc='Launcher, updater and asset manager for OpenTaiko'
arch=('x86_64')
url='https://github.com/OpenTaiko/OpenTaiko-Hub'
license=('MIT')
depends=(
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'webkit2gtk-4.1'
  'xdg-utils'
)
makedepends=(
  'cargo'
  'nodejs'
  'npm'
  'pkgconf'
)
# Avoid passing GCC LTO objects from native dependencies to rust-lld.
options=('!lto')
conflicts=('opentaikohub-bin')
source=(
  "opentaikohub-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  'opentaikohub.desktop'
)
sha256sums=(
  '084e258dfd3dda50e0bccb9f4b5b8373a158b47664990fe11fe124909ac5662f'
  'ad3a2077b69122ea1282d600a981cf21cf8f1f3177e0db2f891715310d53051e'
)

_srcname="OpenTaiko-Hub-${pkgver}"

prepare() {
  cd "${srcdir}/${_srcname}"

  npm ci --cache "${srcdir}/npm-cache" --no-audit --no-fund
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu" --manifest-path src-tauri/Cargo.toml
}

build() {
  cd "${srcdir}/${_srcname}"

  npm run build

  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo build --frozen --release --features custom-protocol --manifest-path src-tauri/Cargo.toml
}

package() {
  cd "${srcdir}/${_srcname}"

  install -Dm0755 "${srcdir}/target/release/OpenTaiko-Hub" "${pkgdir}/usr/bin/opentaikohub"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 "${srcdir}/opentaikohub.desktop" "${pkgdir}/usr/share/applications/opentaikohub.desktop"

  install -Dm0644 src-tauri/icons/32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/opentaikohub.png"
  install -Dm0644 src-tauri/icons/128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/opentaikohub.png"
  install -Dm0644 src-tauri/icons/128x128@2x.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/opentaikohub.png"
  install -Dm0644 src-tauri/icons/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/opentaikohub.png"
}
