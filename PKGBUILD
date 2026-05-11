# Maintainer: Itonia <itonia149@gmail.com>
pkgname=gst-cam-rs
pkgver=0.1.0
pkgrel=2
pkgdesc="A Rust-based webcam viewer and recorder using egui and GStreamer"
arch=('x86_64')
url="https://github.com/itonia149/gst-cam-rs"
license=('MIT')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --offline
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 "target/release/gst-cam-rs" "$pkgdir/usr/bin/$pkgname"

  # Install Documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Create and install Desktop Entry
  install -dm755 "$pkgdir/usr/share/applications"
  cat <<EOF > "$pkgdir/usr/share/applications/$pkgname.desktop"
[Desktop Entry]
Name=Gst Cam
Comment=Lightweight webcam viewer and recorder
Exec=$pkgname
Icon=camera-web
Terminal=false
Type=Application
Categories=Video;AudioVideo;
EOF
}
