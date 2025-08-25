# Maintainer: demir
# https://man.archlinux.org/man/PKGBUILD.5

pkgname="zedless-git"
pkgver=0.192.0.dev.r980.gadb21022b5
pkgrel=1
pkgdesc="Zed fork focused on privacy and being local-first"
url="https://github.com/zedless-editor/zedless"
license=("GPL-3.0-or-later")
source=("git+https://github.com/zedless-editor/zedless.git")
sha512sums=("SKIP")
arch=("x86_64")
depends=(
  alsa-lib
  gcc-libs
  glibc
  libgit2
  libx11
  libxcb
  libxkbcommon
  libxkbcommon-x11
)
makedepends=(cargo)
checkdepends=(cargo)
conflicts=("zed" "zed-preview" "zed-preview-bin" "zedless" "zedless-bin")
provides=("zed")
options=('!lto')

pkgver() {
  cd "zedless"
  set -o pipefail
  git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^[^0-9]*//g'
}

prepare() {
  cd "zedless"
  export RUSTUP_TOOLCHAIN=stable
  # cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "zedless"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "zedless"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "zedless"
  # export RUSTUP_TOOLCHAIN=stable
  # cargo install --no-track --all-features --root "${pkgdir}/usr/" --frozen --path .
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/zed"
}
