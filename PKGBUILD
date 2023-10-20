# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
# Contributor: BlackCatDevel0per

pkgname=solana  
pkgver=1.16.17
epoch=1
_tokenver=2.3.0
_perflibsver=0.19.4
_rustver=1.69.0
pkgrel=1
pkgdesc="A fast, secure, and censorship resistant blockchain."
url="https://www.solana.com"
arch=('x86_64' 'aarch64')
license=('Apache')
depends=("systemd-libs")
makedepends=("rustup" "openssl" "zlib" "protobuf" "protobuf-c" "clang" "cmake" "llvm" "rocksdb")
optdepends_x86_64=("ocl-icd: for operations requiring CUDA")
conflicts=("solana-aarch64" "solana-bin" "solana-testnet" "spl-token")
provides=("spl-token")
install="$pkgname.install"
source=("cargo-build-bpf"
	"$pkgname.sysusers"
	"$pkgname.tmpfiles"
	"$pkgname-$pkgver.tar.gz::https://github.com/solana-labs/$pkgname/archive/v$pkgver.tar.gz"
        "spl-token-cli-$_tokenver.tar.gz::https://github.com/solana-labs/solana-program-library/archive/refs/tags/token-cli-v$_tokenver.tar.gz")
source_x86_64=("perf-libs-$_perflibsver.tar.gz::https://github.com/solana-labs/solana-perf-libs/archive/refs/tags/v$_perflibsver.tar.gz")
sha256sums=('94bdd2014eea655a3576a0c67e2a56db33cb957636ca72186711be75615c1cf5'
            'bf7e015436e3d15e70fc67f323bbd04163f79a4de7d06a254a5409bd031227b0'
            '70cd710d4037210af9ea27ebcfe1be4c36992bad2a2fe816b7c371e352aecaed'
            '4f486726d75a6c022c1a399d21cfcc6732029aa0ba6a14da7229e789ab8db418'
            'a0deed3548aa9d7517b74f17a9bbe44cb4a022689f38ea9fb30d51ff4566f50a')
sha256sums_x86_64=('d616f89316d401d3d93dd23a5304957cc62b16d93f1e010426e3715418e0f9a6')
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
    solana-validator
    rbpf-cli
    cargo-build-bpf
    cargo-build-sbf
    cargo-test-bpf
    cargo-test-sbf
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
    solana-validator
    rbpf-cli
    cargo-build-sbf
    cargo-test-bpf
    cargo-test-sbf
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
