# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
pkgname=solana  
pkgver=1.10.38
_tokenver=2.0.17
_perflibsver=0.19.3
_rustver=1.59.0
pkgrel=2
pkgdesc="A fast, secure, and censorship resistant blockchain."
url="https://www.solana.com"
arch=('x86_64')
license=('Apache')
depends=("systemd-libs")
makedepends=("rustup" "clang")
conflicts=("solana-bin" "spl-token-cli")
provides=("spl-token")
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/solana-labs/$pkgname/archive/v$pkgver.tar.gz"
        "spl-token-cli-$_tokenver.tar.gz::https://github.com/solana-labs/solana-program-library/archive/refs/tags/token-cli-v$_tokenver.tar.gz"
        "perf-libs-$_perflibsver.tar.gz::https://github.com/solana-labs/solana-perf-libs/releases/download/v$_perflibsver/solana-perf.tgz")
sha256sums=('276a5a7e12208770954e9bfa86339f49943767e9ad869fe6dd20bd7a4dfc4ea4'
            'c17d42533fb666392cd577ecbc67eddad950ab8b911fa8e82e9c03dceaf37862'
            '5850dc8ba63017cdb0c97357cc0e26e60f445abc1ef3c95a61b88e59afae71a4')
noextract=("perf-libs-$_perflibsver.tar.gz")

prepare() {
  mkdir -p "$srcdir/$pkgname-$pkgver/target/perf-libs"
  tar -x -f "perf-libs-$_perflibsver.tar.gz" -C "$srcdir/$pkgname-$pkgver/target/perf-libs"
  sed -i '43a \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ .parent()\n\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ .expect("Unable to get parent directory")' $srcdir/$pkgname-$pkgver/sdk/cargo-build-bpf/src/main.rs
  sed -i '46a \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ .join("lib")\n\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ .join("solana")' $srcdir/$pkgname-$pkgver/sdk/cargo-build-bpf/src/main.rs
  rustup toolchain install $_rustver
  cd "$srcdir/$pkgname-$pkgver"
  cargo +$_rustver fetch --locked --target "$CARCH-unknown-linux-gnu"
  cd "$srcdir/solana-program-library-token-cli-v$_tokenver"
  cargo +$_rustver fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$srcdir/$pkgname-$pkgver"
  BINS=(
    solana
    solana-bench-tps
    solana-faucet
    solana-gossip
    solana-install
    solana-keygen
    solana-ledger-tool
    solana-log-analyzer
    solana-net-shaper
    solana-sys-tuner
    solana-validator
    rbpf-cli
    cargo-build-bpf
    cargo-test-bpf
    solana-dos
    solana-install-init
    solana-stake-accounts
    solana-test-validator
    solana-tokens
    solana-watchtower
    solana-genesis
  )
  binargs=()
  for bin in "${BINS[@]}"; do
    binargs+=(--bin "$bin")
  done
  cargo +$_rustver build --release --frozen --locked "${binargs[@]}"
  cd "$srcdir/solana-program-library-token-cli-v$_tokenver"
  cargo +$_rustver build --release --frozen --locked --bin spl-token
}

package() {
  install -d $pkgdir/usr/lib/$pkgname/sdk/bpf
  install -dm775 $pkgdir/usr/lib/$pkgname/sdk/bpf/dependencies
  BINS=(
    solana
    solana-bench-tps
    solana-faucet
    solana-gossip
    solana-install
    solana-keygen
    solana-ledger-tool
    solana-log-analyzer
    solana-net-shaper
    solana-sys-tuner
    solana-validator
    rbpf-cli
    cargo-build-bpf
    cargo-test-bpf
    solana-dos
    solana-install-init
    solana-stake-accounts
    solana-test-validator
    solana-tokens
    solana-watchtower
    solana-genesis
  )
  
  for bin in "${BINS[@]}"; do
     install -Dm755 -t $pkgdir/usr/bin $srcdir/$pkgname-$pkgver/target/release/$bin
  done  
  install -Dm755 -t $pkgdir/usr/bin $srcdir/solana-program-library-token-cli-v$_tokenver/target/release/spl-token
  cp -a $srcdir/$pkgname-$pkgver/sdk/bpf/* $pkgdir/usr/lib/$pkgname/sdk/bpf
}
