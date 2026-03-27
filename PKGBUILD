pkgname=hermes-desktop
pkgver=0.1.4
pkgrel=1
pkgdesc="Native speech-to-text desktop app"
arch=('x86_64' 'aarch64')
url="https://github.com/adityamiskin/hermes"
license=('custom')
options=('!lto')
depends=(
  'glibc'
  'gcc-libs'
  'gtk3'
  'webkit2gtk-4.1'
  'libsoup3'
  'libayatana-appindicator'
  'librsvg'
  'alsa-lib'
  'wl-clipboard'
)
makedepends=('bun' 'cargo' 'git')
source=(
  "git+https://github.com/adityamiskin/hermes.git#tag=v${pkgver}"
  "hermes-desktop.desktop"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "${srcdir}/hermes"
  bun install --frozen-lockfile
}

build() {
  cd "${srcdir}/hermes"
  bun run tauri build --no-bundle
}

package() {
  cd "${srcdir}/hermes"

  install -Dm755 src-tauri/target/release/hermes-desktop "${pkgdir}/usr/bin/hermes-desktop"
  install -Dm644 src-tauri/icons/128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/hermes.png"
  install -Dm644 "${srcdir}/hermes-desktop.desktop" \
    "${pkgdir}/usr/share/applications/hermes-desktop.desktop"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
