# Maintainer: taotieren <admin@taotieren.com>

pkgbase=svdtools
pkgname=svdtools
pkgver=0.4.6
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
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('bd706f6137b221a2eef1c413d3e6affdf1c323663e7cc12b1397f4a608609e2d')
#validpgpkeys=()

export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=target

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  #   cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  cargo build --release --all-features
}

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
}
