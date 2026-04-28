# Maintainer: MiguelRegueiro

pkgname=elio
pkgver=1.3.0
pkgrel=1
pkgdesc='Snappy, batteries-included terminal file manager with rich previews, inline images, bulk actions, and trash support'
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
sha256sums=('bf0b6aef4eae8593d0cc00d5f83ae4b3e87dd303024232d1075de2c9adf02f90')

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
