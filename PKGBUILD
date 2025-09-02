# Maintainer: demir
# https://man.archlinux.org/man/PKGBUILD.5

pkgname="zedless-git"
pkgver=0.192.0.dev.r980.gadb21022b5
pkgrel=3
pkgdesc="Zed fork focused on privacy and being local-first"
url="https://github.com/zedless-editor/zedless"
license=("GPL-3.0-or-later")
source=("git+https://github.com/zedless-editor/zedless.git")
sha512sums=("SKIP")
arch=("x86_64")
depends=(
  alsa-lib
  fontconfig
  gcc-libs
  git
  glibc
  jq
  libgit2
  libx11
  libxcb
  libxkbcommon
  libxkbcommon-x11
  mold
  musl
  openssl
  sqlite
  wayland
  zstd
)
makedepends=(
  cargo
  clang
  cmake
  pkgconf
)
checkdepends=(cargo)
conflicts=("zed" "zed-preview" "zed-preview-bin" "zedless" "zedless-bin")
provides=("zed")
options=('!lto')

_binname=zeditor
_appid=dev.zed.Zedless

pkgver() {
  cd "zedless"
  set -o pipefail
  git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^[^0-9]*//g'
}

prepare() {
  cd "zedless"
  export RUSTUP_TOOLCHAIN=stable
  # cargo update # not our responsibility
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  export APP_NAME="Zed"
  export APP_CLI="${_binname}"
  export DO_STARTUP_NOTIFY="true"
  export APP_ARGS="%U"
  export APP_ICON="zed"
  envsubst < "crates/zed/resources/zed.desktop.in" > ${_appid}.desktop
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
  # cargo test --frozen --all-features # not our responsibility
}

package() {
  cd "zedless"
  # export RUSTUP_TOOLCHAIN=stable
  # cargo install --no-track --all-features --root "${pkgdir}/usr/" --frozen --path .
  install -D --mode=0755 --no-target-directory "target/release/zed" "${pkgdir}/usr/bin/${_binname}"
  install -D --mode=0644 --target-directory "${pkgdir}/usr/share/applications/" "${_appid}.desktop"
  install -D --mode=0644 --no-target-directory crates/zed/resources/app-icon.png "${pkgdir}/usr/share/pixmaps/zed.png"
}
