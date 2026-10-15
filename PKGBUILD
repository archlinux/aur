# Maintainer: couldLover <https://github.com/numb747>

pkgname=jm-boom
pkgver=0.4.7
pkgrel=1
pkgdesc="Cross-platform third-party JM comic client (Tauri desktop app, continued from ppxb/jm-boom)"
arch=('x86_64' 'aarch64')
url="https://github.com/numb747/jm-boom"
license=('MIT')
depends=(
  'cairo'
  'dbus'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=('bun' 'cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'jm-boom.desktop')
sha256sums=('27817c71d63ae18d2672d60649faee37e2387ac3a9cdf0851ecd46c5709e440e'
            '60fa5fb473a42cf9b0e428c56bf568d06d9a65012210aca3cd8a2173867671f3')

prepare() {
  cd "$pkgname-$pkgver"

  export BUN_INSTALL_CACHE_DIR="$srcdir/bun-cache"
  bun install --frozen-lockfile

  cd src-tauri
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  # --no-bundle: only the release binary is needed; packaging is done here.
  bun run tauri build --no-bundle -- --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 src-tauri/target/release/jm-boom "$pkgdir/usr/bin/jm-boom"
  install -Dm644 ../jm-boom.desktop "$pkgdir/usr/share/applications/jm-boom.desktop"

  local icons=src-tauri/icons
  install -Dm644 $icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/jm-boom.png"
  install -Dm644 $icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/jm-boom.png"
  install -Dm644 $icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/jm-boom.png"
  install -Dm644 $icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/jm-boom.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
