# Maintainer: agzes <agzes0@proton.me>
pkgname=fluautoclicker
pkgver=0.1.0.beta.9
pkgrel=1
_upstream=0.1.0-beta.9
pkgdesc="Cross-platform automation tool for mouse clicks, keyboard input and macros"
arch=('x86_64')
url="https://github.com/Agzes/FluAutoClicker"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg' 'gdk-pixbuf2' 'hicolor-icon-theme' 'xdg-utils' 'xdotool')
makedepends=('cargo' 'nodejs' 'pnpm' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v.$_upstream.tar.gz"
        'fluautoclicker.desktop'
        'fluautoclicker.sh')
sha256sums=('3b68d0285d5bff96b09cbb4e902931e759720313df8fd5223d675b06453103d7'
            '9060aebc80c5ff5c27a55a67a5ff5c848257861f0c9b0c2c466aeef355c83c91'
            'fdfce925cfb6f90a647a5b87c6bea572f7ca85de6a0516ea2c40ddd3a339e8ef')

prepare() {
  cd "FluAutoClicker-v.$_upstream"
  export RUSTUP_TOOLCHAIN=stable
  printf 'allowBuilds:\n  esbuild: true\n' > pnpm-workspace.yaml
  pnpm install --frozen-lockfile
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml
}

build() {
  cd "FluAutoClicker-v.$_upstream"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  pnpm tauri build --no-bundle --features beta-devtools
}

package() {
  cd "FluAutoClicker-v.$_upstream"
  install -Dm755 src-tauri/target/release/fluautoclicker "$pkgdir/usr/lib/fluautoclicker/fluautoclicker"
  install -Dm755 "$srcdir/fluautoclicker.sh" "$pkgdir/usr/bin/fluautoclicker"
  install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/fluautoclicker.png"
  install -Dm644 src-tauri/icons/64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/fluautoclicker.png"
  install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/fluautoclicker.png"
  install -Dm644 "$srcdir/fluautoclicker.desktop" "$pkgdir/usr/share/applications/fluautoclicker.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
