# Maintainer: MiguelRegueiro

pkgname=elio
pkgver=1.11.1
pkgrel=1
pkgdesc='Snappy, batteries-included terminal file manager with rich previews, inline images, bulk actions, and trash support'
arch=('x86_64')
url='https://elio-fm.github.io/'
license=('MIT')
depends=('gcc-libs' 'hicolor-icon-theme')
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
source=("${pkgname}-${pkgver}.crate::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('1bcbc1f8f12bed6047e49f405479e6c44354e50ec94654f63d8ef5f7e580f260')

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

  if [[ -f "packaging/linux/${pkgname}.desktop" ]]; then
    install -Dm644 "packaging/linux/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    for size in 48 128 256 512; do
      install -Dm644 "packaging/linux/icons/hicolor/${size}x${size}/apps/${pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    done
  fi
}
