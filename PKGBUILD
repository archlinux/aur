# Maintainer: giosuel <me@giosuel.ch>
pkgname=somedesk
pkgver=0.1.0
pkgrel=1
pkgdesc='Self-hosted, end-to-end encrypted remote desktop'
arch=('x86_64' 'aarch64')
url='https://github.com/giosuel/somedesk'
license=('AGPL-3.0-or-later')
# The libraries for X11, Wayland and OpenGL are loaded at runtime (winit, glutin).
depends=('fontconfig' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libglvnd' 'libpipewire' 'libstdc++'
         'libx11' 'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'libxrandr' 'wayland')
makedepends=('cargo' 'clang')
optdepends=('xdg-desktop-portal: screen sharing and remote control on Wayland')
# !lto: makepkg builds C code with GCC's LTO, which Rust's linker (lld) can't read, so ring
# and openh264 would fail to link. !debug: the release profile has no debug info.
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9c2704395a8e0168833e34252daee1c12af33aaf69218e14172337f0d3d904b0')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p somedesk-app
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The X11, Wayland and PostgreSQL tests skip themselves without a display or database.
  cargo test --frozen --release --workspace --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/somedesk -t "$pkgdir/usr/bin"
  install -Dm644 packaging/linux/ch.giosuel.SomeDesk.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/linux/ch.giosuel.SomeDesk.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 assets/brand/app-icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/ch.giosuel.SomeDesk.svg"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
