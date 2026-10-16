# Maintainer: Ivan Odnoorov <elcheshirecat at yandex dot ru>
# Fork of https://github.com/Rexilone/yamusic-cli
pkgname=ymusic-cli
_repo=ymusic
pkgver=0.8.0
pkgrel=1
pkgdesc="Terminal client for Yandex Music: My Wave, likes, stations (TUI); fork of https://github.com/Rexilone/yamusic-cli"
arch=('x86_64' 'aarch64')
url="https://github.com/iodnoorov/ymusic"
license=('MIT')
depends=('mpv' 'libgcc' 'glibc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('284709eba118461986d631c58f58081265222746d95c72da2e6b548ea90574b9')

prepare() {
  cd "$_repo-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_repo-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_repo-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$_repo-$pkgver"
  install -Dm755 target/release/ymusic "$pkgdir/usr/bin/ymusic"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
