# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=neje
pkgver=0.1.0
pkgrel=1
pkgdesc="Free software for the NEJE DK-8-KZ laser engraver: pictures, text and G-code, print modes, CLI and GUI"
arch=('x86_64')
url="https://github.com/deddroid/neje-rs"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libglvnd' 'libxkbcommon' 'hicolor-icon-theme')
makedepends=('cargo')
optdepends=('wayland: native Wayland window'
            'libx11: X11 window'
            'xdg-desktop-portal: file dialogs of the window')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8299521bbb128ccba60f32aba4c6ad6aea8a40f3a3d0bfe40f36cc19738e7eb0')

prepare() {
  cd "neje-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "neje-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/build --remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/cargo"
  cargo build --frozen --release
}

check() {
  cd "neje-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/build --remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/cargo"
  cargo test --frozen --release
}

package() {
  cd "neje-rs-$pkgver"
  install -Dm755 target/release/neje target/release/neje-gui -t "$pkgdir/usr/bin/"
  install -Dm644 packaging/linux/neje.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 packaging/linux/70-neje.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/icon-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/neje.png"
  done
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md README.it.md CHANGELOG.md docs/PROTOCOL.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
