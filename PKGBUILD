# Maintainer: Mr.Zero88 <huesmann.mats+aur@gmail.com>
# Contributor: peelz <peelz.dev+arch@gmail.com>

pkgname="xrizer-multilib-git"
pkgver=bb7e2e5
pkgrel=1
pkgdesc="Reimplementation of OpenVR, translating calls to OpenXR. (32-bit support)"
arch=("x86_64")
url="https://github.com/Mr-Zero88/xrizer"
license=("GPL-3.0-or-later")
depends=(
  "glibc"
  "gcc-libs"
)
makedepends=(
  "git"
  "rust"
  "lib32-rust-libs"
  "cargo"
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
  git describe --long --tags --abbrev=7 --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  rustup target add x86_64-unknown-linux-gnu
  rustup target add i686-unknown-linux-gnu
  cargo fetch --locked --target x86_64-unknown-linux-gnu
  cargo fetch --locked --target i686-unknown-linux-gnu
}

build() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo xbuild --frozen --release --target x86_64-unknown-linux-gnu
  cargo xbuild --frozen --release --target i686-unknown-linux-gnu
}

package() {
  install -Dm644 \
    /dev/null \
    "${pkgdir}/opt/xrizer/bin/version.txt"
  install -Dm755 \
    "${srcdir}/${pkgname}/target/x86_64-unknown-linux-gnu/release/libxrizer.so" \
    "${pkgdir}/opt/xrizer/bin/linux64/vrclient.so"
  install -Dm755 \
    "${srcdir}/${pkgname}/target/i686-unknown-linux-gnu/release/libxrizer.so" \
    "${pkgdir}/opt/xrizer/bin/vrclient.so"
}
