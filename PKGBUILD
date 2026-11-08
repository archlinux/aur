# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=odyssey-ctl
pkgver=0.3.0
pkgrel=1
pkgdesc="Control Samsung Odyssey monitors over DDC/CI: picture, game and lighting settings, presets, CLI and GUI"
arch=('x86_64')
url="https://github.com/deddroid/odyssey-ctl"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libglvnd' 'libxkbcommon')
makedepends=('cargo')
optdepends=('wayland: native Wayland window'
            'libx11: X11 window')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ceae067a6025776e6bdace498ed7fc668511eb98f6220865f894d163413c8b9e')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/build --remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/cargo"
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/build --remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/cargo"
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/odyssey-ctl target/release/odyssey-ctl-gui -t "$pkgdir/usr/bin/"
  install -Dm644 packaging/linux/odyssey-ctl.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 packaging/linux/70-odyssey-ctl.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 packaging/linux/odyssey-ctl.conf -t "$pkgdir/usr/lib/modules-load.d/"
  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/icon-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/odyssey-ctl.png"
  done
  install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/odyssey-ctl.svg"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md README.it.md CHANGELOG.md docs/PROTOCOL.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
