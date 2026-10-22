# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=padtune
pkgver=0.1.1
pkgrel=1
pkgdesc="Unofficial configurator for BIGBIG WON controllers (Rainbow 2 Pro and family): buttons, sticks, triggers, lights, macros, polling rate"
arch=('x86_64')
url="https://github.com/deddroid/padtune"
license=('MIT')
depends=('gcc-libs' 'glibc' 'systemd-libs' 'libglvnd' 'libxkbcommon')
makedepends=('cargo')
optdepends=('wayland: native Wayland window'
            'libx11: X11 window')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ac20f1dc7c38ae6b414eb519fa40cdcb3579a0b92414fe473398c519cfef902b')

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
  install -Dm755 target/release/padtune target/release/padtune-gui -t "$pkgdir/usr/bin/"
  install -Dm644 packaging/linux/padtune.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 packaging/linux/70-padtune.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/icon-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/padtune.png"
  done
  install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/padtune.svg"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md README.it.md CHANGELOG.md docs/PROTOCOL.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
