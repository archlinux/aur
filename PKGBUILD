# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
pkgname=solana  
pkgver=1.10.37
_splver=0.1.8
_rustver=1.59.0
pkgrel=1
pkgdesc="A fast, secure, and censorship resistant blockchain."
url="https://www.solana.com"
arch=('i686' 'x86_64')
license=('Apache')
depends=()
makedepends=("rustup" "clang")
conflicts=("solana-bin")
provides=("solana")
source=("$pkgname-$pkgver.tar.gz::https://github.com/solana-labs/$pkgname/archive/v$pkgver.tar.gz"
        "spl-token-$_splver.tar.gz::https://github.com/solana-labs/solana-program-library/archive/refs/tags/@solana/spl-token@v$_splver.tar.gz")
sha256sums=('b6a5bb4d5ed09775c098e9d7b911c71f487bf20e82b0248fcff585b495cd20e8'
            '09d57f880688e3dfafae22801500b3de09f7da8fc43281c11fed8cf0b0c31e7e')

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
  cd "$srcdir/solana-program-library--solana-spl-token-v$_splver"
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
  install -Dm755 $srcdir/solana-program-library--solana-spl-token-v$_splver/target/release/spl-token $pkgdir/usr/bin

##  mkdir -p $pkgdir/usr/bin/sdk
##  cp -a $srcdir/$pkgname-$pkgver/sdk/bpf $pkgdir/usr/bin/sdk

##  mkdir -p $pkgdir/usr/bin/deps
##  cp -a $srcdir/$pkgname-$pkgver/target/release/deps/libsolana*program.* $pkgdir/usr/bin/deps
}
