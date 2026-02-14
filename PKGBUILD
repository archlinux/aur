# Maintainer: Illium <illia.pukalov@teleinformatika.eu> https://github.com/IlyaP358
pkgname=disk-spinner
pkgver=0.2.0
pkgrel=1
pkgdesc="A burn-in tool for spinning rust HDDs"
arch=('x86_64' 'aarch64')
url="https://github.com/boinkor-net/disk-spinner"
license=('MIT')
options=(!debug)
depends=('glibc' 'gcc-libs' 'systemd-libs')
makedepends=('cargo' 'git' 'pkgconf')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --all-features
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
