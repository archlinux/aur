# Maintainer: bunny <bunny@carrotwm.org>
pkgname=carrot-git
pkgver=r296.01a528e
pkgrel=1
pkgdesc="A pure Rust tiling Wayland compositor with zero linked C (latest commit)"
arch=('x86_64')
url="https://github.com/carrot-wm/carrot"
license=('GPL-3.0-only')
depends=('xkeyboard-config' 'vulkan-driver')
optdepends=('xorg-xwayland: X11 client support'
            'pipewire: screencasting'
            'xdg-desktop-portal: screenshare portal frontend')
makedepends=('rust' 'git')
provides=('carrot')
conflicts=('carrot')
# the binary is its own libc (exported .dynsym) and self-relocates; the
# staged .so files are that libc for the gpu driver. leave everything
# exactly as the linker made it
options=('!strip' '!debug' '!lto')
source=('carrot::git+https://github.com/carrot-wm/carrot.git'
        'taproot::git+https://github.com/carrot-wm/taproot.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd carrot
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # makepkg's rust.conf may export its own RUSTFLAGS, which replaces the
  # repo config's; pin ours or build.rs refuses the build
  export RUSTFLAGS="-C target-feature=+crt-static"
  cd "$srcdir/carrot"
  cargo build --release --locked

  # the libc family the gpu driver binds at runtime, built from the
  # taproot workspace. no RUSTFLAGS: shared libraries cannot take
  # crt-static
  cd "$srcdir/taproot"
  env -u RUSTFLAGS cargo build --release --locked -p taproot -p taproot-stub
  local bin="$srcdir/carrot/target/x86_64-unknown-linux-gnu/release"
  cp target/release/libtaproot.so "$bin/libc.so.6"
  cp target/release/libtaproot.so "$bin/libm.so.6"
  local s
  for s in libpthread.so.0 libdl.so.2 librt.so.1 libutil.so.1 libresolv.so.2 ld-linux-x86-64.so.2; do
    cp target/release/libtaproot_stub.so "$bin/$s"
  done
}

package() {
  cd carrot
  ./target/x86_64-unknown-linux-gnu/release/carrot install --prefix /usr --root "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
