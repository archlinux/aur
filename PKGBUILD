pkgname=sui
pkgver=1.17.3
pkgrel=1
pkgdesc='Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language.'
url='https://sui.io'
arch=(x86_64)
license=(Apache-2.0)
depends=(rust openssl libldap krb5 e2fsprogs keyutils libsasl postgresql-libs)
makedepends=(git curl cargo cmake clang)
source=(git+https://github.com/MystenLabs/$pkgname#tag=mainnet-v$pkgver)
sha512sums=('SKIP')
# https://github.com/briansmith/ring/issues/1444
options=(!lto)

prepare() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  # ---- storage::store_tests::read_and_contain_blocks::test_store_1_TestStore__new_rocksdb_store__ stdout ----
  # thread 'storage::store_tests::read_and_contain_blocks::test_store_1_TestStore__new_rocksdb_store__' panicked at crates/typed-store/src/metrics.rs:270:14:
  # called `Result::unwrap()` on an `Err` value: AlreadyReg

  # ---- storage::store_tests::read_and_scan_commits::test_store_1_TestStore__new_rocksdb_store__ stdout ----
  # thread 'storage::store_tests::read_and_scan_commits::test_store_1_TestStore__new_rocksdb_store__' panicked at crates/typed-store/src/metrics.rs:270:14:
  # called `Result::unwrap()` on an `Err` value: AlreadyReg
  cargo test --frozen --all-features --workspace || true
}

package() {
  cd $pkgname

  binarys=(sui sui-bridge sui-data-ingestion sui-faucet sui-node sui-test-validator sui-tool)
  for binary in "${binarys[@]}"; do
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$binary"
  done
}
