# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
# Contributor: BlackCatDevel0per

pkgname=solana  
pkgver=1.13.5
epoch=1
_tokenver=2.0.17
_perflibsver=0.19.3
_rustver=1.59.0
pkgrel=2
pkgdesc="A fast, secure, and censorship resistant blockchain."
url="https://www.solana.com"
arch=('x86_64' 'aarch64')
license=('Apache')
depends=("systemd-libs")
makedepends=("rustup" "clang")
optdepends_x86_64=("ocl-icd: for operations requiring CUDA")
conflicts=("solana-aarch64" "solana-bin" "solana-testnet" "spl-token")
provides=("spl-token")
install="$pkgname.install"
source=("cargo-build-bpf"
	"$pkgname.sysusers"
	"$pkgname.tmpfiles"
	"$pkgname-$pkgver.tar.gz::https://github.com/solana-labs/$pkgname/archive/v$pkgver.tar.gz"
        "spl-token-cli-$_tokenver.tar.gz::https://github.com/solana-labs/solana-program-library/archive/refs/tags/token-cli-v$_tokenver.tar.gz")
source_x86_64=("perf-libs-$_perflibsver.tar.gz::https://github.com/solana-labs/solana-perf-libs/releases/download/v$_perflibsver/solana-perf.tgz")
sha256sums=('94bdd2014eea655a3576a0c67e2a56db33cb957636ca72186711be75615c1cf5'
            'bf7e015436e3d15e70fc67f323bbd04163f79a4de7d06a254a5409bd031227b0'
            '70cd710d4037210af9ea27ebcfe1be4c36992bad2a2fe816b7c371e352aecaed'
            '62db6f48488413cf727c1f2525dc1e56b817c4365f40d75773ca4760f7eb71f9'
            'c17d42533fb666392cd577ecbc67eddad950ab8b911fa8e82e9c03dceaf37862')
sha256sums_x86_64=('5850dc8ba63017cdb0c97357cc0e26e60f445abc1ef3c95a61b88e59afae71a4')
noextract=("perf-libs-$_perflibsver.tar.gz")

prepare() {
  if [ $CARCH="x86_64" ]; then
    mkdir -p "$srcdir/$pkgname-$pkgver/target/perf-libs"
    tar -x -f "$srcdir/perf-libs-$_perflibsver.tar.gz" -C "$srcdir/$pkgname-$pkgver/target/perf-libs"
  fi
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
  install -Dm644 $srcdir/$pkgname.sysusers $pkgdir/usr/lib/sysusers.d/$pkgname.conf
  install -Dm644 $srcdir/$pkgname.tmpfiles $pkgdir/usr/lib/tmpfiles.d/$pkgname.conf
  install -dm755 $pkgdir/usr/lib/$pkgname/sdk
  cp -a $srcdir/$pkgname-$pkgver/sdk/bpf $pkgdir/usr/lib/$pkgname/sdk
  if [ $CARCH="x86_64" ]; then
    cp -a $srcdir/$pkgname-$pkgver/target/perf-libs $pkgdir/usr/lib/$pkgname
  fi
  install -dm755 $pkgdir/usr/lib/$pkgname/deps
  cp -a $srcdir/$pkgname-$pkgver/target/release/deps/libsolana*program.* $pkgdir/usr/lib/$pkgname/deps
  install -Dm755 $srcdir/$pkgname-$pkgver/target/release/cargo-build-bpf $pkgdir/usr/lib/$pkgname
  install -Dm755 $srcdir/cargo-build-bpf $pkgdir/usr/bin/cargo-build-bpf
  install -Dm755 $srcdir/solana-program-library-token-cli-v$_tokenver/target/release/spl-token $pkgdir/usr/bin/spl-token
  
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
    install -Dm755 $srcdir/$pkgname-$pkgver/target/release/$bin -t $pkgdir/usr/bin
  done
}
