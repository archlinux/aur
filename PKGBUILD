pkgname=cproxy
pkgver=4.2.1
pkgrel=3
pkgdesc="Easy per application transparent proxy built on cgroup."
url="https://github.com/NOBLES5E/cproxy"
arch=(x86_64)
license=(AGPL)
depends=(iptables)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/NOBLES5E/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('511090a5200c275cf71986262dd0f36b5f6ec04c5221e0e3d50e27c2c9080e6f3eeb48f13b410a28df0d393a5c825e3432e537c1e4aeb6f28e78d60694a95c7f')

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
  # no tests for now
  # cargo test --release --frozen
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir/usr/bin" target/release/cproxy
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 README.md
}
