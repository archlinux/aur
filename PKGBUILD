# Maintainer: willemw <willemw12@gmail.com>

pkgname=termusic-git
pkgver=0.9.0.r421.g59c118d
pkgrel=1
pkgdesc='Music Player TUI written in Rust'
arch=(x86_64)
url=https://github.com/tramhao/termusic
license=(GPL-3.0-or-later MIT)
depends=(dbus gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly gstreamer mpv protobuf soundtouch ueberzug) # alsa-lib libmpv.so
makedepends=(cargo clang git)
optdepends=('emoji-font: for displaying emojis' 'ffmpeg: extract audio by downloader' 'yt-dlp: download files')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!lto)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  #cd $pkgname
  #printf '%s.r%s.%s' "$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

  git -C $pkgname describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  RUSTUP_TOOLCHAIN=stable cargo fetch --locked --manifest-path=$pkgname/Cargo.toml --target="$CARCH-unknown-linux-gnu"
}

build() {
  RUSTUP_TOOLCHAIN=stable cargo build --release --manifest-path=$pkgname/Cargo.toml --target-dir=$pkgname/target --all-features
}

check() {
  RUSTUP_TOOLCHAIN=stable cargo test --release --manifest-path=$pkgname/Cargo.toml --target-dir=$pkgname/target
}

package() {
  install -Dm755 "$pkgname/target/release/${pkgname%-git}"{,-server} -t "$pkgdir/usr/bin"
  install -Dm644 $pkgname/LICENSE_MIT "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
