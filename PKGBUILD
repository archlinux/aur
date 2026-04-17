# Maintainer: MiguelRegueiro

pkgname=elio
pkgver=1.0.1
pkgrel=1
pkgdesc='Terminal file manager (TUI) with a three-pane layout, rich previews, inline images, and keyboard-first workflows'
arch=('x86_64')
url='https://elio-fm.github.io/'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('elio-bin')
options=('!lto')
optdepends=(
  'poppler: PDF metadata and rendered page previews'
  'ffmpeg: audio/video metadata, artwork, thumbnails, and ffprobe support'
  'resvg: SVG rasterization'
  '7zip: archive and comic archive preview fallback'
  'libarchive: archive and ISO listing fallback through bsdtar'
)
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha256sums=('593ef72c525bd05e871e6b59e83e39459d3334d94df6d1c442df29d9867d8921')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
