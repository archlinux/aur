# Maintainer: willemw <willemw12@gmail.com>

pkgname=termusic-git
pkgver=0.7.9.r1252.11c0452
pkgrel=1
pkgdesc='Music Player TUI written in Rust'
arch=('x86_64')
url=https://github.com/tramhao/termusic
license=('GPL3' 'MIT')
depends=('dbus' 'gst-libav' 'gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'gstreamer' 'mpv') # 'libmpv.so'
makedepends=('cargo' 'git')
optdepends=('ffmpeg: extract audio by downloader' 'ueberzug: display album covers' 'youtube-dl: download files' 'yt-dlp: download files')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=(SKIP)

pkgver() {
  cd $pkgname
  printf '%s.r%s.%s' "$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cargo fetch --locked --manifest-path=$pkgname/Cargo.toml --target="$CARCH-unknown-linux-gnu"
}

build() {
  RUSTUP_TOOLCHAIN=stable cargo build --release --manifest-path=$pkgname/Cargo.toml --target-dir=target --all-features
}

check() {
  RUSTUP_TOOLCHAIN=stable cargo test --release --manifest-path=$pkgname/Cargo.toml --target-dir=target
}

package() {
  install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm644 $pkgname/LICENSE_MIT -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  mkdir -p "$pkgdir/usr/share/${pkgname%-git}"
  cp -a $pkgname/themes "$pkgdir/usr/share/${pkgname%-git}"
}
