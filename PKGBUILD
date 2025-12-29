# Maintainer: Aetf <aetf at unlimited-code dot works>
pkgname=unftp
pkgver=0.15.2
pkgrel=1
pkgdesc="A FTP(S) server with a couple of twists written in Rust."
arch=('x86_64')
url="https://github.com/bolcom/unFTP"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
# Disable lto as it breaks rust -sys crates (undefined references when linking)
# See also https://github.com/Canop/broot/issues/852
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('678cae9ac53b332b57b8572eb4e3a5ea721fc19e5aa9f3d29f3771d7861bfb95df6d6d8dbeefedd3dcde4f837692700136bc4807f81b70d87375758e2a6c5318')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  CARGO_FEATURE_VENDORED=1 cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"

  install -Dm0644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

