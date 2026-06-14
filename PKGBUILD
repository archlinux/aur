# Maintainer: eltonff <eltonfabricio10@gmail.com>
# BigTube — Universal Multimedia Downloader (Rust port: GTK4/libadwaita + GStreamer).
# This replaces the former Python implementation under the same `bigtube` package.
pkgname=bigtube
_pkgname=python-bigtube
pkgver=2.0.65
pkgrel=1
pkgdesc="Universal Multimedia Downloader (GTK4/libadwaita + GStreamer)"
arch=('x86_64')
url="https://github.com/eltonfabricio10/python-bigtube"
license=('MIT')
depends=('gtk4' 'libadwaita' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good'
         'gst-plugins-bad' 'gst-plugin-gtk4' 'yt-dlp')
makedepends=('rust' 'git' 'gettext')
optdepends=('ffmpeg: audio extraction and media conversion')
provides=('bigtube')
conflicts=('bigtube-rs')
# Disable makepkg LTO: it mangles the `ring` crate's bundled C/asm objects and
# breaks linking ("undefined symbol: ring_core_*") under ld.lld.
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eltonfabricio10/python-bigtube/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('db0bdd8d86963bda0344efdb7737d36cda3dabb930c26b75cb1bf6cfe87317c0')

prepare() {
  cd "${_pkgname}-${pkgver}/rust"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
}

build() {
  cd "${_pkgname}-${pkgver}/rust"
  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --frozen
}

check() {
  cd "${_pkgname}-${pkgver}/rust"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo test --release --frozen -p bigtube-core
}

package() {
  cd "${_pkgname}-${pkgver}"

  # Binaries: GUI (bigtube-gui) and headless CLI (bigtube).
  install -Dm755 "rust/target/release/bigtube-gui" "${pkgdir}/usr/bin/bigtube-gui"
  install -Dm755 "rust/target/release/bigtube" "${pkgdir}/usr/bin/bigtube"

  # Desktop entry + icon (icon reused from the original app assets).
  install -Dm644 "rust/packaging/org.big.bigtube.desktop" \
    "${pkgdir}/usr/share/applications/org.big.bigtube.desktop"
  install -Dm644 "src/bigtube/data/bigtube.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/bigtube.png"

  # Compile and install translation catalogs (reuse existing po/*.po).
  for po in po/*.po; do
    [ -e "$po" ] || continue
    lang="$(basename "$po" .po)"
    install -d "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES"
    msgfmt "$po" -o "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/bigtube.mo"
  done

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
