# Maintainer: Aspenini <aspeninifeltner@gmail.com>
pkgname=quark-downloader
pkgver=1.0.1
pkgrel=1
pkgdesc='Interactive CLI and GUI wrapper for yt-dlp'
arch=('x86_64')
url='https://github.com/Aspenini/quark-downloader'
license=('MIT')
depends=(
  'ffmpeg'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'qt6-declarative'
  'yt-dlp'
)
makedepends=('cargo' 'pkgconf')
optdepends=('qt6-wayland: native Wayland support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# Replace after creating the v${pkgver} tag; never publish the AUR package with SKIP.
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd "${pkgname}-${pkgver}"
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo build --frozen --release -p quark-cli -p quark-gui-dispatch
}

check() {
  cd "${pkgname}-${pkgver}"
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo test --frozen --workspace
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/target/release/quark-downloader" "${pkgdir}/usr/lib/${pkgname}/quark-downloader"
  install -Dm755 "${srcdir}/target/release/quark-downloader-gui" "${pkgdir}/usr/lib/${pkgname}/quark-downloader-gui"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "../lib/${pkgname}/quark-downloader" "${pkgdir}/usr/bin/quark-downloader"
  ln -s "../lib/${pkgname}/quark-downloader-gui" "${pkgdir}/usr/bin/quark-downloader-gui"

  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/qml" src/gui/qt/*.qml
  install -Dm644 packaging/quark-downloader.desktop "${pkgdir}/usr/share/applications/quark-downloader.desktop"
  install -Dm644 packaging/quark-downloader-gui.desktop "${pkgdir}/usr/share/applications/quark-downloader-gui.desktop"
  install -Dm644 icons/icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/quark-downloader.png"
  install -Dm644 icons/icon-cli.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/quark-downloader-cli.png"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
