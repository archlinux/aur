# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

pkgbase="xrizer-git"
pkgname=(
  "xrizer-git"
  "xrizer-common-git"
)
pkgver="0.2.r12.g89474fa"
pkgrel="1"
pkgdesc="Reimplementation of OpenVR, translating calls to OpenXR"
arch=("x86_64")
url="https://github.com/Supreeeme/xrizer"
license=("GPL-3.0-or-later")
makedepends=(
  "git"
  "rust"
  "cmake"
  "libx11"
  "libxcb"
  "wayland"
  "clang"
  "shaderc"
)
source=(
  "xrizer::git+${url}.git"
)
sha256sums=(
  "SKIP"
)
options=("!lto")

pkgver() {
  cd "${srcdir}/xrizer"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/xrizer"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/xrizer"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package_xrizer-common-git() {
  pkgdesc+=" (common files)"
  provides=("xrizer-common")
  conflicts=("xrizer-common")

  install -Dm644 \
    /dev/null \
    "${pkgdir}/opt/xrizer/bin/version.txt"
}

package_xrizer-git() {
  depends=(
    "xrizer-common"
    "glibc"
    "gcc-libs"
  )
  provides=("xrizer")
  conflicts=("xrizer")

  install -Dm755 \
    "${srcdir}/xrizer/target/release/libxrizer.so" \
    "${pkgdir}/opt/xrizer/bin/linux64/vrclient.so"
}
