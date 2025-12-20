# Maintainer: nardholio <nardholio@gmail.com>
# Contributor: Xeonacid <h.dwwwwww@gmail.com>
# Contributor: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
# Contributor: BlackCatDevel0per
pkgname=solana
epoch=1
pkgver=3.0.12
# https://github.com/anza-xyz/agave/blob/v$pkgver/scripts/spl-token-cli-version.sh
_splTokenCliVersion=5.4.0
pkgrel=2
pkgdesc="A fast, secure, and censorship resistant blockchain."
url="https://www.solana.com"
arch=(x86_64)
license=(Apache-2.0)
depends=(bash bzip2 cargo gcc-libs glibc systemd-libs)
makedepends=(git protobuf clang llvm curl)
provides=(spl-token)
source=(git+https://github.com/anza-xyz/agave.git#tag=v$pkgver
        git+https://github.com/solana-program/token-2022.git#tag=cli@v$_splTokenCliVersion
        $pkgname.sysusers
        $pkgname.tmpfiles
        $pkgname-sbf_sdk-path.patch)
sha256sums=('4ca988c916c619d226dd9ae53dfb6ba2fc6f5dbbfa488bdb30ae8a235320d8ea'
            '1ba58902aa5e0bb707fb6315a2944d9ed72ca19f519b344ff31e32a52cc98197'
            'bf7e015436e3d15e70fc67f323bbd04163f79a4de7d06a254a5409bd031227b0'
            'a0f9ee2a24ab97da977eed1dd68a92165c2f2e6d5467462fe83c762031f4e02b'
            'f2251e4057350ec795d6ea5402cffbaa5678883996e68ba8688c3f250cb9a173')
install=$pkgname.install
options=(!lto)

# Core binaries (non-DCOU)
_MAIN_BINS=(
  cargo-build-sbf
  cargo-test-sbf
  solana-test-validator
  agave-install
  solana
  solana-keygen
  agave-validator
  agave-watchtower
  solana-gossip
  solana-genesis
  solana-faucet
  solana-stake-accounts
  solana-tokens
  agave-install-init
)

# DCOU/tainted binaries (benches, tools)
_DCOU_BINS=(
  agave-ledger-tool
  agave-store-histogram
  agave-store-tool
  solana-accounts-cluster-bench
  solana-banking-bench
  solana-bench-tps
  solana-dos
  solana-transaction-dos
  solana-vortexor
)

# Tainted packages to exclude from main workspace build
_dcou_tainted_packages=(
  agave-ledger-tool
  agave-store-histogram
  agave-store-tool
  solana-accounts-cluster-bench
  solana-banking-bench
  solana-bench-tps
  solana-dos
  solana-local-cluster
  solana-transaction-dos
  solana-vortexor
)

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/agave"
  patch -Np1 -i ../$pkgname-sbf_sdk-path.patch
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  cd "$srcdir/token-2022"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$srcdir/agave"
  # Fix lints
  sed -i '/^\[workspace\.lints\.rust\]$/,+1d' Cargo.toml
  # Fix rocksdb
  export CXXFLAGS="$CXXFLAGS -include cstdint"

  # Main build: exclude tainted packages to prevent DCOU feature leakage
  local main_binargs=()
  for bin in "${_MAIN_BINS[@]}"; do
    main_binargs+=(--bin "$bin")
  done
  local excludeArgs=()
  for package in "${_dcou_tainted_packages[@]}"; do
    excludeArgs+=(--exclude "$package")
  done
  cargo build --frozen --release --workspace "${main_binargs[@]}" "${excludeArgs[@]}"

  # DCOU/tainted build: targeted without workspace
  local dcou_binargs=()
  for bin in "${_DCOU_BINS[@]}"; do
    dcou_binargs+=(--bin "$bin")
  done
  cargo build --frozen --release "${dcou_binargs[@]}"

  # Additional build tools
  cargo build --frozen --release --manifest-path syscalls/gen-syscall-list/Cargo.toml
  cargo run --frozen --release --bin gen-headers

  # Fetch perf-libs
  ./fetch-perf-libs.sh

  # Build spl-token-cli
  cd "$srcdir/token-2022"
  cargo build --frozen --release --bin spl-token
}

package() {
  cd "$srcdir/agave"
  for bin in "${_MAIN_BINS[@]}" "${_DCOU_BINS[@]}"; do
    install -Dm755 "target/release/$bin" -t "$pkgdir/usr/bin"
  done

  # Install platform tools
  install -dm755 "$pkgdir/usr/lib/$pkgname/platform-tools-sdk"
  cp -a platform-tools-sdk/sbf "$pkgdir/usr/lib/$pkgname/platform-tools-sdk"

  # Install perf-libs
  # export SOLANA_PERF_LIBS=/usr/lib/solana/perf-libs at runtime to enable
  install -dm755 "$pkgdir/usr/lib/$pkgname/perf-libs"
  cp -a target/perf-libs/* "$pkgdir/usr/lib/$pkgname/perf-libs/"

  # Install program deps
  install -dm755 "$pkgdir/usr/lib/$pkgname/deps"
  shopt -s nullglob
  for dep in target/release/deps/libsolana*program.*; do
    install -Dm755 "$dep" -t "$pkgdir/usr/lib/$pkgname/deps"
  done

  cd "$srcdir/token-2022"
  install -Dm755 "target/release/spl-token" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  find "$pkgdir/usr/bin" -type f -executable -exec strip --strip-unneeded {} + || true
}
