# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="76e01ac8ad79fed226a883985daa3cbe61271ca7"
pkgbase="xrizer"
pkgname=(
  "xrizer"
  "xrizer-common"
  "lib32-xrizer"
)
pkgver="0.3"
pkgrel="3"
pkgdesc="Reimplementation of OpenVR, translating calls to OpenXR"
arch=("x86_64")
url="https://github.com/Supreeeme/xrizer"
license=("GPL-3.0-or-later")
makedepends=(
  "git"
  "rust"
  "lib32-rust-libs"
  "cmake"
  "libx11"
  "libxcb"
  "wayland"
  "clang"
  "shaderc"
)
source=(
  "xrizer::git+${url}.git#commit=${_commit}"
  "openvrpaths.vrpath"
)
sha256sums=(
  "SKIP"
  "SKIP"
)
options=("!lto")

prepare() {
  cd "${srcdir}/xrizer"
  export RUSTUP_TOOLCHAIN=stable
  # XXX: ideally a PKGBUILD should never mess with a user's environment,
  # but considering that many people have rust installed via rustup,
  # we have to make an exception to this rule (I don't want people
  # complaining about the package failing to build).
  # This should have no effect if built in a chroot.
  if command -v rustup >/dev/null 2>&1; then
    rustup target add x86_64-unknown-linux-gnu
    rustup target add i686-unknown-linux-gnu
  fi
  cargo fetch --locked --target x86_64-unknown-linux-gnu
  cargo fetch --locked --target i686-unknown-linux-gnu
}

build() {
  cd "${srcdir}/xrizer"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --target x86_64-unknown-linux-gnu
  cargo build --frozen --release --target i686-unknown-linux-gnu
}

package_xrizer-common() {
  pkgdesc+=" (common files)"
  provides=("xrizer-common")
  conflicts=("xrizer-common")

  install -Dm644 \
    "${srcdir}/openvrpaths.vrpath" \
    "${pkgdir}/opt/xrizer/openvrpaths.vrpath"
  install -Dm644 \
    /dev/null \
    "${pkgdir}/opt/xrizer/bin/version.txt"
}

package_xrizer() {
  depends=(
    "xrizer-common"
    "glibc"
    "gcc-libs"
  )
  provides=("xrizer")
  conflicts=("xrizer")

  install -Dm755 \
    "${srcdir}/xrizer/target/x86_64-unknown-linux-gnu/release/libxrizer.so" \
    "${pkgdir}/opt/xrizer/bin/linux64/vrclient.so"
}

package_lib32-xrizer() {
  pkgdesc+=" (32-bit)"
  depends=(
    "xrizer-common"
    "lib32-glibc"
    "lib32-gcc-libs"
  )
  provides=("lib32-xrizer")
  conflicts=("lib32-xrizer")

  install -Dm755 \
    "${srcdir}/xrizer/target/i686-unknown-linux-gnu/release/libxrizer.so" \
    "${pkgdir}/opt/xrizer/bin/vrclient.so"
}
