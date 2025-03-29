# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

pkgname="xrizer-git"
pkgver="0.1.r20.g4fbcfc6"
pkgrel="1"
pkgdesc="Reimplementation of OpenVR, translating calls to OpenXR."
arch=("x86_64")
url="https://github.com/Supreeeme/xrizer"
license=("GPL-3.0-or-later")
depends=(
  "glibc"
  "gcc-libs"
)
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
provides=("xrizer")
conflicts=("xrizer")
source=(
  "${pkgname}::git+${url}.git"
)
sha256sums=(
  "SKIP"
)
options=("!lto")

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm644 \
    /dev/null \
    "${pkgdir}/opt/xrizer/bin/version.txt"
  install -Dm755 \
    "${srcdir}/${pkgname}/target/release/libxrizer.so" \
    "${pkgdir}/opt/xrizer/bin/linux64/vrclient.so"
}
