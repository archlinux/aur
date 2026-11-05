# Maintainer: Nikolay Bryskin <nikicat@users.noreply.github.com>
# Ethereum's Foundry, built from a pinned source release. Arch's own `foundry`
# (extra) is GNOME's, hence the -rs name.
pkgname=foundry-rs
pkgver=1.9.0
pkgrel=1
_commit=6056c5845d34205a83cf7108042adb137325c9df
pkgdesc='Ethereum development toolkit: forge, cast, anvil and chisel'
arch=(x86_64 aarch64)
url='https://github.com/foundry-rs/foundry'
license=(MIT Apache-2.0)
depends=(glibc libgcc libusb)
makedepends=(cargo cmake)
conflicts=(foundry-bin foundry-git)
# makepkg's -flto turns aws-lc's C objects into GCC bitcode, which rust-lld can't link
options=(!lto)
source=("foundry-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('06e1a9f00435384126c20638dd50c7df6b50eccbc09ff2cf0deb502ad10d1228')

_bins=(forge cast anvil chisel)

prepare() {
  cd foundry-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd foundry-$pkgver
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  # what upstream's release.yml sets; the tarball has no .git to read them from
  export TAG_NAME=v$pkgver VERGEN_GIT_SHA=$_commit
  # cc-rs appends makepkg's -O2 after jitterentropy's required -O0; cmake keeps it last
  export AWS_LC_SYS_CMAKE_BUILDER=1
  # upstream's release features, minus PGO; jemalloc is x86_64-only upstream too
  local features=aws-kms,gcp-kms,turnkey,cli,asm-keccak,js-tracer,base,monad,optimism
  [[ $CARCH == x86_64 ]] && features+=,jemalloc
  cargo build --frozen --release --no-default-features --features "$features" \
    "${_bins[@]/#/--bin=}"
}

package() {
  cd foundry-$pkgver
  local bin
  for bin in "${_bins[@]}"; do
    install -Dm755 target/release/$bin -t "$pkgdir/usr/bin"
  done
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
}
