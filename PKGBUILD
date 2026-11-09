# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=drydock
pkgver=1.3.1
pkgrel=1
pkgdesc="A live TUI dashboard for a fleet of git repos"
arch=(x86_64)
url=https://github.com/yetidevworks/drydock
license=(MIT)
makedepends=(cargo)
checkdepends=(git)
depends=(glibc libgcc)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('a22ee71cb99f98b6f3d2b769cccd7f629323c9f3463cbe1914de95c6042da229')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --all --release --frozen
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 target/release/drydock "$pkgdir/usr/bin/drydock"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
