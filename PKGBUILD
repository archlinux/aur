# Maintainer: nardholio <nardholio@gmail.com>
# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: Xeonacid <h.dwwwwww@gmail.com>
# Contributor: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
# Contributor: BlackCatDevel0per

pkgbase=solana
pkgname=(solana-cli agave-validator solana-dev solana)
epoch=1
pkgver=4.3.0
# https://github.com/anza-xyz/agave/blob/v$pkgver/scripts/spl-token-cli-version.sh
_splTokenCliVersion=5.6.1
# https://github.com/anza-xyz/agave/blob/$pkgver/scripts/cargo-build-sbf-version.sh
_cargoBuildSbfVersion=4.4.0
# cargo-build-sbf 4.4.0 default.
_platformToolsVersion=v1.57
pkgrel=2
url="https://github.com/anza-xyz/agave"
arch=(x86_64)
license=(Apache-2.0)
makedepends=(clang cargo git protobuf rust systemd-libs)
source=("git+https://github.com/anza-xyz/agave.git#tag=v${pkgver}"
        "git+https://github.com/anza-xyz/cargo-build-sbf.git#tag=cargo-build-sbf@v${_cargoBuildSbfVersion}"
        "git+https://github.com/solana-program/token-2022.git#tag=cli@v${_splTokenCliVersion}"
        "https://github.com/anza-xyz/platform-tools/releases/download/${_platformToolsVersion}/platform-tools-linux-x86_64.tar.bz2"
        $pkgbase.sysusers
        $pkgbase.tmpfiles
        $pkgbase-sbf_sdk-path.patch)
noextract=(platform-tools-linux-x86_64.tar.bz2)
sha256sums=('61b3f3d214474425ff6954c471af7ba8ad1813763d47b2da1f8df30dec0cf25c'
            'b039350d6d73488e1b4296c78475738c3c2e5c54e8370d031983c6e59a6d7c8d'
            '5191648d2bb219c91774966900e6fcf44e2e5b08cfe2b2c483cf955dd36d9cd8'
            'b0f7af104adf726fff2a6a09ea2eb2f2d2965c92295f4d7388c08d140e0c2b00'
            'bf7e015436e3d15e70fc67f323bbd04163f79a4de7d06a254a5409bd031227b0'
            'a0f9ee2a24ab97da977eed1dd68a92165c2f2e6d5467462fe83c762031f4e02b'
            '34b4ca06956669e23b7043a4b025365a43b42a6c3f13b21d5a60a6ac7d8b7c3f')
options=(!lto)

# Build lists
# https://github.com/anza-xyz/agave/blob/v$pkgver/scripts/agave-build-lists.sh
# Core binaries (non-DCOU)
_MAIN_BINS=(
  solana-test-validator
  solana
  solana-keygen
  agave-validator
  agave-watchtower
  solana-gossip
  solana-genesis
  solana-faucet
  solana-stake-accounts
  solana-tokens
  solana-poh-bench
  rbpf-cli
)

# Root-workspace bins that pull in dev-context-only-utils. Built separately
# so that feature does not unify into the binaries above.
_ROOT_DCOU_BINS=(
  agave-store-histogram
  solana-accounts-cluster-bench
)

# Devbins https://github.com/anza-xyz/agave/blob/v$pkgver/dev-bins/Cargo.toml
_DEVBINS=(
  agave-ledger-tool
  agave-store-tool
)

# Tainted packages to exclude from main workspace build
_dcou_tainted_packages=(
  agave-store-histogram
  solana-accounts-cluster-bench
  solana-local-cluster
)

# Packaging lists
_solana_bins=(solana solana-keygen solana-gossip solana-faucet solana-stake-accounts solana-tokens)
_validator_bins=(agave-validator agave-watchtower solana-genesis agave-store-histogram solana-accounts-cluster-bench)
_dev_bins=(solana-test-validator agave-ledger-tool agave-store-tool solana-poh-bench rbpf-cli)

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  mkdir -p "$srcdir/platform-tools"
  tar --no-same-owner -xjf "$srcdir/platform-tools-linux-x86_64.tar.bz2" \
    -C "$srcdir/platform-tools"

  cd "$srcdir/agave"
  rm rust-toolchain.toml
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  cd "$srcdir/agave/dev-bins"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  cd "$srcdir/cargo-build-sbf/cargo-build-sbf"
  patch -Np1 -i "$srcdir/$pkgbase-sbf_sdk-path.patch"
  cd "$srcdir/cargo-build-sbf"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  cd "$srcdir/token-2022"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "$srcdir/agave"
  # fix lints
  export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }-A deprecated -A semicolon_in_expressions_from_non_local_macros"
  # Find system LD
  export LD_LIBRARY_PATH="$(rustc --print sysroot)/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

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

  cd "$srcdir/cargo-build-sbf"
  cargo build --frozen --release --bin cargo-build-sbf --bin cargo-test-sbf

  cd "$srcdir/token-2022"
  cargo build --frozen --release --bin spl-token
}

package_solana-cli() {
  pkgdesc="Solana CLI tools"
  depends=(bzip2 glibc libgcc systemd-libs zstd)
  provides=(spl-token)
  conflicts=(spl-token solana-bin)

  cd "$srcdir/agave"
  for bin in "${_solana_bins[@]}"; do
    install -Dm755 "target/release/$bin" -t "$pkgdir/usr/bin"
  done

  # Install spl-token
  cd "$srcdir/token-2022"
  install -Dm755 "target/release/spl-token" -t "$pkgdir/usr/bin"

  # Install systemd integration
  install -Dm644 "$srcdir/$pkgbase.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgbase.conf"
  install -Dm644 "$srcdir/$pkgbase.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgbase.conf"
}

package_agave-validator() {
  pkgdesc="Agave validator and node operator tools for Solana"
  install=$pkgname.install
  depends=(bzip2 glibc libcap libgcc libstdc++ zlib zstd)

  cd "$srcdir/agave"
  for bin in "${_validator_bins[@]}"; do
    install -Dm755 "target/release/$bin" -t "$pkgdir/usr/bin"
  done
}

package_solana-dev() {
  pkgdesc="Solana program developer tools"
  install=$pkgname.install
  # The toolchain is a prebuilt sysroot. strip/debug here breaks rustc and clang.
  options=(!strip !debug !lto)
  depends=(bzip2 cargo clang glibc libgcc libstdc++ lld llvm rust zlib zstd)
  conflicts=(solana-dev-bin)

  cd "$srcdir/agave"
  for bin in "${_dev_bins[@]}"; do
    install -Dm755 "target/release/$bin" -t "$pkgdir/usr/bin"
  done

  install -Dm755 "$srcdir/cargo-build-sbf/target/release/cargo-build-sbf" \
    -t "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/cargo-build-sbf/target/release/cargo-test-sbf" \
    -t "$pkgdir/usr/bin"

  install -d "$pkgdir/usr/lib/solana"
  cp -a "$srcdir/platform-tools" "$pkgdir/usr/lib/solana/platform-tools"
}

package_solana() {
  pkgdesc="A fast, secure, and censorship resistant blockchain (meta package)"
  depends=(solana-cli agave-validator solana-dev)
}
