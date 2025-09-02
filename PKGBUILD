# Maintainer: demir <iron-actress-music@duck.com>

pkgname="zedless-git"
pkgver=0.192.0.dev.r980.gadb21022b5
pkgrel=4
pkgdesc="Zed fork focused on privacy and being local-first"
url="https://github.com/zedless-editor/zedless"
license=("AGPL-3.0-or-later" "APACHE-2.0" "GPL-3.0-or-later")
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
  cmake
  pkgconf
)
optdepends=(
  "clang: improved C/C++ language support"
  "eslint: improved Javascript language support"
  "pyright: improved Python language support"
  "rust-analyzer: improved Rust language support"
)
conflicts=("zed" "zed-preview" "zed-preview-bin" "zedless" "zedless-bin")
provides=("zed")
options=("!lto")

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
  export ZED_UPDATE_EXPLANATION='Updates are handled through AUR'
  cargo build --frozen --release --package zed --package cli
}

package() {
  cd "zedless"
  install -D --mode=0755 "target/release/cli" "${pkgdir}/usr/bin/${_binname}"
  install -D --mode=0755 "target/release/zed" "${pkgdir}/usr/lib/zed/zed-editor"
  install -D --mode=0644 --target-directory "${pkgdir}/usr/share/applications/" "${_appid}.desktop"
  install -D --mode=0644 "crates/zed/resources/app-icon.png" "${pkgdir}/usr/share/pixmaps/zed.png"
  install -D --mode=0444 --target-directory "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE-*
  install -D --mode=0444 --target-directory "${pkgdir}/usr/share/doc/${pkgname}/" README.md
}
