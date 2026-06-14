# Maintainer: Woro <woro@tanieddosy.pl>
pkgname=simplevoice
pkgver=0.1.4
pkgrel=1
pkgdesc="Simplevoice — fast speech-to-text transcription (Tauri)"
arch=('x86_64')
url="https://github.com/MaciejKolerski/simplevoice"
license=('Apache-2.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3'
         'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1'
         'alsa-lib' 'vulkan-icd-loader')
makedepends=('git' 'rust' 'nodejs' 'pnpm' 'cmake' 'clang'
             'librsvg' 'libayatana-appindicator'
             'shaderc' 'vulkan-headers' 'vulkan-icd-loader')
provides=('simplevoice')
conflicts=('simplevoice-bin')
# Arch enables LTO by default; the cc crate then compiles the `ring` crate's C
# sources (pulled in via whisper-rs/sherpa-onnx) with -flto, leaving LTO bitcode
# whose symbols the link step can't resolve (undefined reference to ring_core_*).
# Disabling LTO keeps ring's native objects linkable.
options=('!lto')
install=simplevoice.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('01bfd0268825c3ccd2e1dd5d0f094000d83d2a58e59a781701360f5638718181')

prepare() {
  cd "${pkgname}-${pkgver}"
  pnpm install --frozen-lockfile
}

build() {
  cd "${pkgname}-${pkgver}"
  # The release config sets createUpdaterArtifacts, which makes tauri sign the
  # bundle with the updater key (TAURI_SIGNING_PRIVATE_KEY) — only present in CI.
  # AUR builds ship no updater artifacts (pacman handles upgrades), so turn it off.
  pnpm tauri build -b deb --config '{"bundle":{"createUpdaterArtifacts":false}}'
}

package() {
  cd "${pkgname}-${pkgver}"
  cp -a src-tauri/target/release/bundle/deb/*/data/* "${pkgdir}/"
}
