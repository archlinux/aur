# Maintainer: nardholio <nardholio@gmail.com>
# Contributor: Xeonacid <h.dwwwwww@gmail.com>
# Contributor: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>
# Contributor: BlackCatDevel0per

pkgname=solana
epoch=1
pkgver=3.0.12
_splTokenCliVersion=5.4.0
pkgrel=1
pkgdesc="A fast, secure, and censorship resistant blockchain."
url="https://www.solana.com"
arch=(x86_64)
license=(Apache-2.0)
depends=(bash bzip2 cargo gcc-libs glibc systemd-libs)
makedepends=(git protobuf clang llvm)
provides=(spl-token)
source=(git+https://github.com/anza-xyz/agave.git#tag=v$pkgver
        "spl-token-cli-$_splTokenCliVersion.crate::https://static.crates.io/crates/spl-token-cli/spl-token-cli-$_splTokenCliVersion.crate"
        $pkgname.sysusers
        $pkgname.tmpfiles)
sha256sums=('4ca988c916c619d226dd9ae53dfb6ba2fc6f5dbbfa488bdb30ae8a235320d8ea'
            '6c1044b2b001a9fb3994031e5f63b5d3b81db3314cf924f4633bfd2a5708b5aa'
            'bf7e015436e3d15e70fc67f323bbd04163f79a4de7d06a254a5409bd031227b0'
            'a0f9ee2a24ab97da977eed1dd68a92165c2f2e6d5467462fe83c762031f4e02b')
install=$pkgname.install
options=(!lto)

_BINS=(
  agave-install
  solana
  solana-keygen
  agave-validator
  agave-watchtower
  solana-gossip
  solana-genesis
  solana-faucet
  agave-ledger-tool
  cargo-build-sbf
  cargo-test-sbf
  solana-test-validator
  solana-stake-accounts
  solana-tokens
  agave-install-init
)

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd $srcdir/agave
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Extract and fetch deps for spl-token-cli
  cd "$srcdir"
  tar -xzf spl-token-cli-*.crate
  rm -rf spl-token-cli-src
  mv spl-token-cli-$_splTokenCliVersion spl-token-cli-src
  cd spl-token-cli-src
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd $srcdir/agave

  # error: hiding a lifetime that's elided elsewhere is confusing
  sed -i '/^\[workspace\.lints\.rust\]$/,+1d' Cargo.toml

  # C flags
  export CXXFLAGS="$CXXFLAGS -include cstdint"

  local binargs=()
  for bin in "${_BINS[@]}"; do
    binargs+=(--bin "$bin")
  done

  cargo build --frozen --release --workspace "${binargs[@]}"

  # Build spl-token-cli
  cd $srcdir/spl-token-cli-src
  cargo build --frozen --release
}

package() {
  cd $srcdir/agave

  for bin in "${_BINS[@]}"; do
    install -Dm755 target/release/$bin -t $pkgdir/usr/bin
  done

  install -Dm755 $srcdir/spl-token-cli-src/target/release/spl-token $pkgdir/usr/bin/spl-token

  install -Dm644 $srcdir/$pkgname.sysusers $pkgdir/usr/lib/sysusers.d/$pkgname.conf
  install -Dm644 $srcdir/$pkgname.tmpfiles $pkgdir/usr/lib/tmpfiles.d/$pkgname.conf

  find "$pkgdir/usr/bin" -type f -executable -exec strip --strip-unneeded {} + || true
}
