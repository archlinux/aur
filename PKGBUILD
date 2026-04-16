# Maintainer: Istiak <istiakm30@gmail.com>
pkgname=quillscribe
pkgver=0.1.3
pkgrel=1
pkgdesc="Beautiful Voice-to-Text Transcription App with local and cloud speech-to-text support"
arch=('x86_64')
url="https://github.com/theguy000/QuillScribe"
license=('MIT')
options=('!lto')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'hicolor-icon-theme'
  'libappindicator-gtk3'
  'alsa-lib'
)
makedepends=(
  'rust'
  'cargo'
  'nodejs'
  'npm'
  'cmake'
  'clang'
  'patchelf'
  'librsvg'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/theguy000/QuillScribe/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b8882dabee782de6d1ee4c24d03db71f1e6228430495214f7f3d77357bb8ac10')

build() {
  cd "QuillScribe-$pkgver"

  # Force the system linker (gcc/ld) instead of the bundled rust-lld,
  # which fails to resolve native C symbols embedded in rlibs
  # (e.g. ring, whisper-rs) with Arch's default toolchain flags.
  export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc
  export RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-fuse-ld=bfd"

  npm install
  npx tauri build --no-bundle
}

package() {
  cd "QuillScribe-$pkgver"

  # Binary
  install -Dm755 "src-tauri/target/release/quillscribe" "$pkgdir/usr/bin/quillscribe"

  # Icons
  install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/quillscribe.png"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/quillscribe.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/quillscribe.png"

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
