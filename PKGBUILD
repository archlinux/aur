# Maintainer: Michael Dilger <mike@mikedilger.com>
# Maintainer: soloturn@gmail.com

_basename=gossip
pkgname=${_basename}-git
pkgver=.r2635.g72ffea6a
pkgrel=1
pkgdesc="gossip nostr client, rust, egui based."
arch=('x86_64')
url="https://github.com/mikedilger/$_basename"
license=(MIT)
makedepends=(cargo cmake ffmpeg git mold)
optdepends=(xdg-utils)
provides=($pkgname)
conflicts=($pkgname)
source=(
  "$pkgname::git+https://github.com/mikedilger/gossip.git"
  "$pkgname.desktop"
)
sha256sums=(
  'SKIP'
  '3629a8d3fbe5ea9e7e008b28b0c108e03dfdeb5a0747df6a3728989dc8477a00'
)

pkgver() {
  cd $pkgname
  echo $(cat Cargo.toml | grep ^version | awk -F= '{print $2}' | awk -F\" '{print $2}' | awk -F- '{print $1}').$(git describe --long --tags | awk -F- '{print "r"$2"." $3}')
}

build() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  CARGO_TARGET_DIR=target
  RUSTFLAGS="-C link-arg=-fuse-ld=mold -C target-cpu=native --cfg tokio_unstable"
  cargo build --release --features=lang-cjk,video-ffmpeg
}

package() {
  cd $pkgname
  install -Dm755 "target/release/$_basename" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "gossip.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
