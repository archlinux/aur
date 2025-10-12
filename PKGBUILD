# Maintainer: willemw <willemw12@gmail.com>

pkgname=termusic-git
pkgver=0.12.0.r0.g46d2639
pkgrel=2
pkgdesc='Music Player TUI written in Rust'
arch=(x86_64)
url=https://github.com/tramhao/termusic
license=(GPL-3.0-or-later MIT)
depends=(
  dbus gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly gstreamer
  libsixel mpv opus soundtouch ueberzug) # alsa-lib libmpv.so
makedepends=(cargo clang cmake git protobuf)
optdepends=(
  'emoji-font: display emojis'
  'ffmpeg: extract audio by downloader'
  'yt-dlp: download files')
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
  export RUSTUP_TOOLCHAIN=stable
  cd $pkgname
  #cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cd $pkgname
  cargo build --frozen --release --all-features # --features=cover,gst
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd $pkgname
  cargo test --frozen --all-features # --features=cover,gst
}

package() {
  install -Dm755 "$pkgname/target/release/${pkgname%-git}"{,-server} -t "$pkgdir/usr/bin"
  install -Dm644 $pkgname/LICENSE_MIT "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
