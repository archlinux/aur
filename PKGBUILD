# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=toggl-cli
pkgver=0.4.4
pkgrel=1
pkgdesc='Unofficial CLI for Toggl Track written in Rust, using the v9 API.'
arch=(i686 x86_64)
url=https://github.com/watercooler-labs/toggl-cli
license=(MIT)
depends=(openssl)
makedepends=(cargo)
conflicts=("${pkgname}-bin")
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('9b30a49f96b7dd44abe797297709db88f0485e235fc0f3e1be05a7a5b124e6664926d8cde6b94ede0fb9de13ff00facfc5305b15bfd908228ace2923f50e98ce')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-*}"
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
}
