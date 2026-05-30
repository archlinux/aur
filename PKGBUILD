# Maintainer: beac0n <gh@schempp.dev>

pkgname=ruroco-client-ui
pkgver=0.14.1
pkgrel=1
pkgdesc='ruroco client GUI (egui) — graphical front-end for the ruroco client'
arch=('x86_64')
url='https://github.com/beac0n/ruroco'
license=('MIT')
# The X11/Wayland/GL libs are loaded by eframe via dlopen at runtime (x11-dl /
# wayland-sys / glow), so they do NOT appear in the ELF NEEDED table. namcap
# reports them as "may not be needed" — that is a false positive; removing them
# breaks the GUI at runtime. They are also needed at build time to link eframe.
depends=('openssl' 'gcc-libs' 'glibc' 'fontconfig' 'libglvnd'
         'libxkbcommon' 'wayland' 'libx11' 'libxi' 'libxcursor' 'libxrandr')
makedepends=('cargo')
options=('!lto')
source=("ruroco-$pkgver.tar.gz::https://github.com/beac0n/ruroco/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3236dc6ccb73af6fc58b8f43f01a32594550a82dddf896554a0be41ce88acfa3')

prepare() {
  cd "$srcdir/ruroco-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/ruroco-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # GUI binary only. This is the heavy build (eframe + OpenGL). The
  # release-build feature is omitted so OpenSSL links dynamically against the
  # system package instead of being vendored.
  cargo build --release --frozen --no-default-features --features with-gui --bin client_ui
}

package() {
  cd "$srcdir/ruroco-$pkgver"
  install -Dm755 target/release/client_ui "$pkgdir/usr/bin/ruroco-client-ui"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
