# Maintainer: willemw <willemw12@gmail.com>

pkgname=termusic-git
pkgver=0.6.5.r626.78dfd9b
pkgrel=1
pkgdesc="Terminal Music Player written in Rust"
arch=('x86_64')
url="https://github.com/tramhao/termusic"
license=('GPL3' 'MIT')
depends=('dbus' 'gst-libav' 'gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'gstreamer' 'mpv')    # 'libmpv.so'
makedepends=('cargo' 'git')
optdepends=('ffmpeg: extract audio by downloader' 'ueberzug: display album covers' 'youtube-dl: download files' 'yt-dlp: download files')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "%s.r%s.%s" "$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  RUSTUP_TOOLCHAIN=stable cargo build --release --all-features --manifest-path=$pkgname/Cargo.toml --target-dir=target
}

#check() {
#  RUSTUP_TOOLCHAIN=stable cargo test --release --manifest-path=$pkgname/Cargo.toml --target-dir=target
#}

package() {
  install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm644 $pkgname/LICENSE_MIT             -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  mkdir -p              "$pkgdir/usr/share/${pkgname%-git}"
  cp -a $pkgname/themes "$pkgdir/usr/share/${pkgname%-git}"
}

