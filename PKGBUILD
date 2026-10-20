# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=ak820
pkgver=0.1.1
pkgrel=1
pkgdesc="Configurator for the AJAZZ AK820 Pro keyboard: lighting, per-key RGB, key remapping, macros, TFT screen (GUI + CLI)"
arch=('x86_64' 'aarch64')
url="https://github.com/deddroid/ak820-rs"
license=('MIT')
depends=('gcc-libs' 'glibc' 'systemd-libs' 'hicolor-icon-theme'
         'libglvnd' 'libxkbcommon' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr')
makedepends=('cargo')
optdepends=('xdg-desktop-portal: file picker in the GUI'
            'gnome-shell-extension-appindicator: tray icon on GNOME')
conflicts=('ak820-bin')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2bba4a629306911c96950dbdcc840a00fb95529993410e534ebeda709df147c6')

prepare() {
  cd "ak820-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "ak820-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Keep build paths out of the binaries.
  export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=/build"
  cargo build --frozen --release
}

check() {
  cd "ak820-rs-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --lib
}

package() {
  cd "ak820-rs-$pkgver"
  install -Dm755 target/release/ak820 "$pkgdir/usr/bin/ak820"
  install -Dm755 target/release/ak820-gui "$pkgdir/usr/bin/ak820-gui"
  install -Dm644 packaging/linux/ak820.desktop "$pkgdir/usr/share/applications/ak820.desktop"
  for s in 32 48 64 128 256; do
    install -Dm644 "assets/icon-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/ak820.png"
  done
  # Lets the logged-in user open the keyboard without root.
  install -Dm644 udev/70-ajazz-ak820.rules "$pkgdir/usr/lib/udev/rules.d/70-ajazz-ak820.rules"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md docs/PROTOCOL.md examples/profile.toml -t "$pkgdir/usr/share/doc/$pkgname/"
}
