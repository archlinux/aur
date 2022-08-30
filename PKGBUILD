# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
pkgname=solana  
pkgver=1.10.38
_tokenver=2.0.17
_rustver=1.59.0
pkgrel=2
pkgdesc="A fast, secure, and censorship resistant blockchain."
url="https://www.solana.com"
arch=('x86_64')
license=('Apache')
depends=()
makedepends=("rustup" "clang")
conflicts=("solana-bin")
provides=("solana")
source=("$pkgname-$pkgver.tar.gz::https://github.com/solana-labs/$pkgname/archive/v$pkgver.tar.gz"
        "spl-token-cli-$_tokenver.tar.gz::https://github.com/solana-labs/solana-program-library/archive/refs/tags/token-cli-v$_tokenver.tar.gz")
sha256sums=('276a5a7e12208770954e9bfa86339f49943767e9ad869fe6dd20bd7a4dfc4ea4'
            'c17d42533fb666392cd577ecbc67eddad950ab8b911fa8e82e9c03dceaf37862')

prepare() {
  rustup toolchain install $_rustver
}

build() {
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
  cargo +$_rustver build --release --locked "${binargs[@]}"
  cd "$srcdir/solana-program-library-token-cli-v$_tokenver"
  cargo +$_rustver build --release --locked --bin spl-token
}

package() {
  mkdir -p $pkgdir/usr/bin
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
     install -Dm755 $srcdir/$pkgname-$pkgver/target/release/$bin $pkgdir/usr/bin
  done
  install -Dm755 $srcdir/solana-program-library-token-cli-v$_tokenver/target/release/spl-token $pkgdir/usr/bin

##  mkdir -p $pkgdir/usr/bin/sdk
##  cp -a $srcdir/$pkgname-$pkgver/sdk/bpf $pkgdir/usr/bin/sdk

##  mkdir -p $pkgdir/usr/bin/deps
##  cp -a $srcdir/$pkgname-$pkgver/target/release/deps/libsolana*program.* $pkgdir/usr/bin/deps
}
