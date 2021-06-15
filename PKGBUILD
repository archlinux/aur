# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
pkgname=solana  
pkgver=1.6.12
_splver=0.1.6
pkgrel=2
pkgdesc="A fast, secure, and censorship resistant blockchain."
url="https://www.solana.com"
arch=('i686' 'x86_64')
license=('Apache')
depends=()
makedepends=("rustup")
conflicts=("solana-bin")
provides=("solana")
source=("$pkgname-$pkgver.tar.gz::https://github.com/solana-labs/$pkgname/archive/v$pkgver.tar.gz"
        "spl-token-$_splver.tar.gz::https://github.com/solana-labs/solana-program-library/archive/refs/tags/@solana/spl-token@v$_splver.tar.gz")
md5sums=('b93c7508ef48e8749a1e15792356f4f0'
         '83a7a13aa3b28d89859ee74fb6ff2fcf')

prepare() {
  rustup update stable
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  BINS=(
    solana
    solana-bench-exchange
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
    cargo-build-bpf
    cargo-test-bpf
    solana-dos
    solana-install-init
    solana-stake-accounts
    solana-stake-monitor
    solana-stake-o-matic
    solana-test-validator
    solana-tokens
    solana-watchtower
    solana-genesis
  )
  binargs=()
  for bin in "${BINS[@]}"; do
    binargs+=(--bin "$bin")
  done
  cargo build --release "${binargs[@]}"
  cd "$srcdir/solana-program-library--solana-spl-token-v$_splver"
  cargo build --release --bin spl-token
}

package() {
  mkdir -p $pkgdir/usr/bin
  BINS=(
    solana
    solana-bench-exchange
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
    cargo-build-bpf
    cargo-test-bpf
    solana-dos
    solana-install-init
    solana-stake-accounts
    solana-stake-monitor
    solana-stake-o-matic
    solana-test-validator
    solana-tokens
    solana-watchtower
    solana-genesis
  )
  for bin in "${BINS[@]}"; do
     install -Dm755 $srcdir/$pkgname-$pkgver/target/release/$bin $pkgdir/usr/bin
  done
  install -Dm755 $srcdir/solana-program-library--solana-spl-token-v$_splver/target/release/spl-token $pkgdir/usr/bin
}
