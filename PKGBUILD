# Maintainer: Daan Hessen <daanhessen@notbadcompany.com>
pkgname=vector-view
pkgver=0.3.3
pkgrel=1
pkgdesc='Vector View: GTK4 viewer for images, videos (mpv), PDFs and office documents'
arch=('x86_64' 'aarch64')
url='https://github.com/Not-Bad-Company/vector'
license=('MIT')
depends=('gtk4' 'glib2' 'gdk-pixbuf2' 'libjpeg-turbo' 'libheif' 'xz' 'mpv' 'poppler-glib' 'cairo' 'libglvnd' 'graphene' 'glibc' 'libgcc' 'hicolor-icon-theme')
makedepends=('cargo')
optdepends=(
  'ttf-jetbrains-mono-nerd: the intended font and icons'
  'libreoffice-fresh: preview Word, Excel and PowerPoint files (or libreoffice-still)'
  'ffmpegthumbnailer: video thumbnails in the gallery'
  'ffmpeg: video details (ffprobe)'
  'poppler: PDF details (pdfinfo)'
  'webp-pixbuf-loader: WebP images'
  'libavif: AVIF images'
  'libheif: HEIC images'
  'libjxl: JPEG XL images'
  'librsvg: SVG images'
)
options=('!lto')
source=("vector-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('201ce7228e3095c759ffe303bf98a71afcebe8c34d63dce2024903aa99ffa1cb')

prepare() {
  cd "vector-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "vector-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release -p vector-view
}

check() {
  cd "vector-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  VECTOR_NO_CLIPBOARD=1 cargo test --frozen -p vector-core -p vector-view
}

package() {
  cd "vector-$pkgver"
  local id=io.github.not_bad_company.VectorView
  install -Dm755 target/release/vector-view "$pkgdir/usr/bin/vector-view"
  install -Dm644 "data/$id.desktop" "$pkgdir/usr/share/applications/$id.desktop"
  install -Dm644 "data/$id.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$id.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
