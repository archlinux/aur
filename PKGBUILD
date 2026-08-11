# Maintainer: Edwar Diaz <edwardiaz.dev@gmail.com>

pkgname=cliprithm
pkgver=1.6.1
pkgrel=1
pkgdesc="Smart desktop video silence remover and clip editor built with Tauri and FFmpeg"
arch=('x86_64')
url="https://github.com/BOTOOM/Cliprithm"
license=('MIT')
depends=('ffmpeg' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'webkit2gtk-4.1')
makedepends=('cargo' 'nodejs' 'patchelf' 'pnpm' 'rust')
optdepends=('xdg-desktop-portal: improved desktop integration for file dialogs and portals')
provides=('cliprithm')
conflicts=('cliprithm-bin')
source=("cliprithm-1.6.1.tar.gz::https://github.com/BOTOOM/Cliprithm/archive/refs/tags/cliprithm-v1.6.1.tar.gz"
        "cliprithm"
        "cliprithm.desktop")
sha256sums=('5a18e61b75bc096738cc30f11e9ba2ab117f7691a3892200c2add8d25093de6a'
            'fb39cdb168e8c849348069eaf812712f206694268da8228b7d03972b77fadbd5'
            'fc1f073620a6ea5283c288a5870941eea57dc2369b691c0788ec8fb16260045f')
options=('!lto')

_setup_rust_toolchain() {
  export CARGO_HOME="$srcdir/cargo-home"

  if command -v rustup >/dev/null 2>&1; then
    export RUSTUP_HOME="$srcdir/rustup-home"
    export RUSTUP_TOOLCHAIN=stable
    rustup toolchain install stable --profile minimal --no-self-update
  fi
}

prepare() {
  cd "Cliprithm-cliprithm-v1.6.1"
  _setup_rust_toolchain
  export PNPM_HOME="$srcdir/pnpm-home"
  export XDG_CACHE_HOME="$srcdir/pnpm-cache"
  pnpm install --frozen-lockfile
}

build() {
  cd "Cliprithm-cliprithm-v1.6.1"
  _setup_rust_toolchain
  export CARGO_TARGET_DIR="$srcdir/target"
  pnpm run tauri build -- --no-bundle --ci --no-sign
}

package() {
  cd "Cliprithm-cliprithm-v1.6.1"

  install -Dm755 "$srcdir/target/release/cliprithm" "$pkgdir/usr/lib/cliprithm/cliprithm"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/cliprithm.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 "$srcdir/cliprithm" "$pkgdir/usr/bin/cliprithm"
  install -Dm644 "$srcdir/cliprithm.desktop" "$pkgdir/usr/share/applications/cliprithm.desktop"
}
