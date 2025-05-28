# Maintainer: taotieren <admin@taotieren.com>

pkgbase=svdtools
pkgname=svdtools
pkgver=0.5.0
pkgrel=1
epoch=
pkgdesc="svdtools is a set of tools for modifying vendor-supplied, often buggy SVD files. It can be imported as a library for use in other applications, or run directly via the included svdtools CLI utility."
arch=($CARCH)
url="https://github.com/rust-embedded/svdtools"
license=('MIT AND Apache-2.0')
groups=()
depends=(
  gcc-libs
  glibc
)
makedepends=(
  git
  rust
)
optdepends=('svd2rust: Generate Rust register maps (`struct`s) from SVD files')
provides=(svdtools svdtools-rust)
conflicts=(svdtools svdtools-rust)
replaces=(python-svdtools svdtools-rust)
backup=()
options=('!strip' '!lto')
install=
changelog=
source=("${pkgbase}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('f54a4a2d782d765d5dae739a7acbfa12789df86f90395b10824b8787e00b67f3')
#validpgpkeys=()

export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=target

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
  cd "${srcdir}/${pkgbase}"
  #   cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgbase}"

  cargo build --release --all-features
}

package() {
  cd "${srcdir}/${pkgbase}"

  cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
}
