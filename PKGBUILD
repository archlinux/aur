# Maintainer: Istiak <istiakm30@gmail.com>
pkgname=quillscribe
pkgver=0.3.0
pkgrel=1
pkgdesc="Beautiful Voice-to-Text Transcription App with local and cloud speech-to-text support"
arch=('x86_64')
url="https://github.com/theguy000/QuillScribe"
license=('MIT')
options=('!lto')
depends=(
  'hicolor-icon-theme'
  'alsa-lib'
  'libgl'
  'dbus'
)
makedepends=(
  'rust'
  'cargo'
  'cmake'
  'clang'
  'patchelf'
  'librsvg'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/theguy000/QuillScribe/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('74be1da4c9c7903b33e7e57d900b5063c6190b1250de685bc2383c5c0088437b')

build() {
  cd "QuillScribe-$pkgver"

  # Force the system linker (gcc/ld) instead of the bundled rust-lld,
  # which fails to resolve native C symbols embedded in rlibs
  # (e.g. ring, whisper-rs) with Arch's default toolchain flags.
  export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc
  export RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-fuse-ld=bfd"

  cargo build --release
}

package() {
  cd "QuillScribe-$pkgver"

  # Binary
  install -Dm755 "target/release/quillscribe" "$pkgdir/usr/bin/quillscribe"

  # Icons
  install -Dm644 "icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/quillscribe.png"
  install -Dm644 "icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/quillscribe.png"
  install -Dm644 "icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/quillscribe.png"

  # Desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/quillscribe.desktop" <<EOF
[Desktop Entry]
Name=QuillScribe
Comment=Voice-to-Text Transcription App
Exec=quillscribe
Icon=quillscribe
Type=Application
Categories=AudioVideo;Audio;Utility;
StartupWMClass=QuillScribe
EOF
}
