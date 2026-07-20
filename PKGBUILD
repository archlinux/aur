# Maintainer: bunny <bunny@carrotwm.org>
pkgname=carrot
pkgver=0.1.1
pkgrel=1
pkgdesc="A pure Rust tiling Wayland compositor with zero linked C"
arch=('x86_64')
url="https://github.com/carrot-wm/carrot"
license=('GPL-3.0-only')
depends=('xkeyboard-config' 'vulkan-driver')
optdepends=('xorg-xwayland: X11 client support'
            'pipewire: screencasting'
            'xdg-desktop-portal: screenshare portal frontend')
makedepends=('rust')
# the binary is its own libc (exported .dynsym) and self-relocates; the
# staged .so files are that libc for the gpu driver. leave everything
# exactly as the linker made it
options=('!strip' '!debug' '!lto')
_taproot=0.22.7
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "taproot-$_taproot.tar.gz::https://github.com/carrot-wm/taproot/archive/refs/tags/v$_taproot.tar.gz")
sha256sums=('b5c9b4f3bdf6054885021f70849388cf9f492c63f67a0e35eb7a85d4721aaed2'
            '4eb167da029673cd52e00d7cb6fcfd52111302ca461d427d8ee3365cb730fbda')

build() {
  # makepkg's rust.conf may export its own RUSTFLAGS, which replaces the
  # repo config's; pin ours or build.rs refuses the build
  export RUSTFLAGS="-C target-feature=+crt-static"
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked

  # the libc family the gpu driver binds at runtime, built from the
  # taproot workspace.
  cd "$srcdir/taproot-$_taproot"
  # no RUSTFLAGS here: shared libraries cannot take crt-static.
  # RUSTUP_TOOLCHAIN pins the same compiler as the carrot build when
  # rustup provides rust (taproot's rust-toolchain.toml would otherwise
  # switch this half to its nightly pin; the exe and the cdylib must
  # agree on thread layout). plain rust ignores the variable
  env -u RUSTFLAGS RUSTUP_TOOLCHAIN=stable cargo build --release --locked -p taproot -p taproot-stub
  local bin="$srcdir/$pkgname-$pkgver/target/x86_64-unknown-linux-gnu/release"
  cp target/release/libtaproot.so "$bin/libc.so.6"
  cp target/release/libtaproot.so "$bin/libm.so.6"
  local s
  for s in libpthread.so.0 libdl.so.2 librt.so.1 libutil.so.1 libresolv.so.2 ld-linux-x86-64.so.2; do
    cp target/release/libtaproot_stub.so "$bin/$s"
  done
}

package() {
  cd "$pkgname-$pkgver"
  ./target/x86_64-unknown-linux-gnu/release/carrot install --prefix /usr --root "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
