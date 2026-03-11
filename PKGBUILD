# Maintainer: nardholio <nardholio@gmail.com>
# Contributor: Xeonacid <h.dwwwwww@gmail.com>
# Contributor: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
# Contributor: BlackCatDevel0per
pkgname=solana
epoch=1
pkgver=3.1.10
# https://github.com/anza-xyz/agave/blob/v$pkgver/scripts/spl-token-cli-version.sh
_splTokenCliVersion=5.5.0
pkgrel=1
pkgdesc="A fast, secure, and censorship resistant blockchain."
url="https://github.com/anza-xyz/agave"
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
sha256sums=('613e6e7f5af5f2870e7ed6994d593ebfc394d78bbe3140b3fbf858cbab2b3f7c'
            'a9a0f6e495f68a77e61ce44a39bed42608bd3afd6aa5ddf09e124b50e17d41a6'
            'bf7e015436e3d15e70fc67f323bbd04163f79a4de7d06a254a5409bd031227b0'
            'a0f9ee2a24ab97da977eed1dd68a92165c2f2e6d5467462fe83c762031f4e02b'
            'f2251e4057350ec795d6ea5402cffbaa5678883996e68ba8688c3f250cb9a173')
install=$pkgname.install
options=(!lto)

# Core binaries (non-DCOU) #https://github.com/anza-xyz/agave/blob/v$pkgver/scripts/agave-build-lists.sh
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

# Root-workspace DCOU/tainted binaries
_ROOT_DCOU_BINS=(
  agave-store-histogram
  solana-accounts-cluster-bench
  solana-transaction-dos
  solana-vortexor
)

# Devbins https://github.com/anza-xyz/agave/blob/v$pkgver/dev-bins/Cargo.toml
_DEVBINS=(
  agave-ledger-tool
  agave-store-tool
  solana-banking-bench
  solana-bench-tps
  solana-dos
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

  cd "$srcdir/agave/dev-bins"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  cd "$srcdir/token-2022"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="$RUSTFLAGS -W dangerous_implicit_autorefs"
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

  # Root-workspace DCOU bins
  local root_dcou_binargs=()
  for bin in "${_ROOT_DCOU_BINS[@]}"; do
    root_dcou_binargs+=(--bin "$bin")
  done
  cargo build --frozen --release "${root_dcou_binargs[@]}"

  # Build devbins
  local dev_binargs=()
  for bin in "${_DEVBINS[@]}"; do
    dev_binargs+=(--bin "$bin")
  done
  cargo build --frozen --release --manifest-path dev-bins/Cargo.toml --features=dev-context-only-utils "${dev_binargs[@]}"

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
  for bin in "${_MAIN_BINS[@]}" "${_ROOT_DCOU_BINS[@]}" "${_DEVBINS[@]}"; do
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

  # Install spl-token
  cd "$srcdir/token-2022"
  install -Dm755 "target/release/spl-token" -t "$pkgdir/usr/bin"

  # Install systemd integration
  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # Strip binaries
  find "$pkgdir/usr/bin" -type f -executable -exec strip --strip-unneeded {} + || true
}
