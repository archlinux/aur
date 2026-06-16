# Maintainer: TorrentNG contributors
pkgname=torrentngd-git
pkgver=0.1.0
pkgrel=1
pkgdesc="TorrentNG native Rust BitTorrent daemon"
arch=("x86_64")
url="https://github.com/snapetech/TorrentNG"
license=("GPL-3.0-or-later")
depends=("gcc-libs" "sqlite")
makedepends=("cargo" "git" "npm")
backup=("etc/torrentngd/config.toml")
source=(
  "git+https://github.com/snapetech/TorrentNG.git"
  "torrentngd.service"
  "torrentngd.sysusers"
  "torrentngd.tmpfiles"
)
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP")

pkgver() {
  cd torrentng
  git describe --tags --long --always | sed "s/^v//;s/-/./g"
}

build() {
  cd torrentng
  cargo build --release --locked -p torrentngd
  cd webui
  npm ci
  TNG_WEBUI_OUT_DIR=dist npm run build
}

check() {
  cd torrentng
  cargo test --locked -p torrentngd -p rt-config -p rt-api-native
}

package() {
  cd torrentng
  install -Dm755 target/release/torrentngd "$pkgdir/usr/bin/torrentngd"
  install -Dm644 deploy/native/config.toml "$pkgdir/etc/torrentngd/config.toml"
  mkdir -p "$pkgdir/usr/share/torrentng/webui"
  cp -a webui/dist/. "$pkgdir/usr/share/torrentng/webui/"
  install -Dm644 "$srcdir/torrentngd.service" "$pkgdir/usr/lib/systemd/system/torrentngd.service"
  install -Dm644 "$srcdir/torrentngd.sysusers" "$pkgdir/usr/lib/sysusers.d/torrentngd.conf"
  install -Dm644 "$srcdir/torrentngd.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/torrentngd.conf"
}
