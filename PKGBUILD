# Maintainer: bunny <bunny@carrotwm.org>
pkgname=carrot
pkgver=0.1.0
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
_taproot=0.22.5
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "taproot-$_taproot.tar.gz::https://github.com/carrot-wm/taproot/archive/refs/tags/v$_taproot.tar.gz")
sha256sums=('69370320c73e8366e31da4ebd5439ae287374e3c1d4d0324037851a4d138914f'
            '0b74ceedeb3f1ec5f8993f67e8008f2473025424b58541fd049e3fa21fcaec6f')

build() {
  # stable rust; crt-static rides the repo's cargo config
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked

  # the libc family the gpu driver binds at runtime, built from the
  # taproot workspace. 
  cd "$srcdir/taproot-$_taproot"
  cargo build --release --locked -p taproot -p taproot-stub
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
