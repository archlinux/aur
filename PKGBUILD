# Maintainer: vantroy <vantroy@gmail.com>

# pkgver and sha256sums are rewritten by the aur job in release.yml at tag time.
# The values committed here are a working recipe for the last release, so that
# `makepkg` in this directory builds, not a record of what is on the AUR.

pkgname=sabigoku
pkgver=0.1.1
pkgrel=1
pkgdesc="Terminal anime browser and player"
# The official Arch container image is x86_64 only, so CI never runs makepkg on
# aarch64. The release matrix does build this target on real aarch64 hardware
# every tag, so what is unexercised is the makepkg wrapper, not the compile.
arch=('x86_64' 'aarch64')
url="https://github.com/vantroy/sabigoku"
license=('GPL-3.0-or-later')
# ldd on a release build resolves libgcc_s, libm and libc, and nothing else:
# sqlite is compiled in (rusqlite bundled) and TLS is rustls, so neither is a
# system dependency. mpv is shelled out to at runtime, which namcap cannot see,
# so it is declared by hand.
depends=('gcc-libs' 'glibc' 'mpv')
makedepends=('cargo')
# Keep !lto. makepkg enables LTO by default, which puts -flto in CFLAGS and
# emits ring's C and assembly objects as bitcode the Rust link step cannot
# resolve: the build dies on undefined ring_core_* symbols. The release profile
# does its own Rust-level LTO regardless, so nothing is given up here.
# !debug because the release profile emits no debug info, so splitting one out
# yields an empty /usr/src/debug and a dangling build-id symlink.
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('480a4d98f8d7d7fbe1354171749c665b62df9b52a056dca61dfed0654d8e5438')

prepare() {
  cd "$pkgname-$pkgver"
  # A clean chroot has no network in build(), so every crate is fetched here.
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  # Never pass --ignored here: the _live tests reach the network, which a clean
  # chroot does not have and a package build has no business needing.
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
