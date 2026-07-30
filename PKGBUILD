# Maintainer: Aslan Devecioglu <modevecioglu@gmail.com>
pkgname=yakc
pkgver=2.8.0
pkgrel=1
pkgdesc="Yet Another Key Caster — cross-platform key & mouse click visualizer"
arch=('x86_64' 'aarch64')
url="https://github.com/iammodev/YAKC"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libxkbcommon' 'libappindicator-gtk3' 'systemd-libs')
optdepends=('speech-dispatcher: text-to-speech for keystrokes')
makedepends=('rust' 'cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/iammodev/YAKC/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cbbed73f51ab53aa168fb8e23538162bc8aff271ae0bce1aa96266766e830e5d')

prepare() {
  cd "YAKC-$pkgver/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "YAKC-$pkgver/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The static frontend is embedded into the binary at build time by
  # tauri-build, so a plain cargo release build is fully self-contained.
  cargo build --release --frozen
}

package() {
  cd "YAKC-$pkgver"

  install -Dm755 "src-tauri/target/release/yakc" "$pkgdir/usr/bin/yakc"
  install -Dm644 "assets/icons/linux/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/yakc.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/yakc.desktop" <<'EOF'
[Desktop Entry]
Name=YAKC
Comment=Key & mouse click visualizer
Exec=yakc
Icon=yakc
Terminal=false
Type=Application
Categories=Utility;
EOF
}
