# Maintainer: couldLover <https://github.com/numb747>

pkgname=jm-boom
pkgver=0.4.6
pkgrel=6
pkgdesc="Cross-platform third-party JM comic client (Tauri)"
arch=('x86_64' 'aarch64')
url="https://github.com/ppxb/jm-boom"
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
        'disable-in-app-updater.patch'
        'fix-empty-state-pointer-events.patch'
        'fix-response-bom.patch'
        'fix-webkit-backdrop-blur.patch'
        'feat-reader-zoom.patch'
        'feat-reader-double-page-zoom.patch'
        'jm-boom.desktop')
sha256sums=('ffc0d0d7ac7061530b5630e8ba2161438f9cfd038521f37b86383757f896689b'
            'e8f923d660f48e277b4708820ccfdf929b926c80bc3bc84e38a729f95e448064'
            '2fb438e395d87e1916b06215883acf5d87f1e3bbf2fe3da175f6d7e9333a1259'
            '240094f2ae4d45d1b5b6dfb543c0111d552c6ca442219b9128ada75c50e72818'
            'b630a8bc1a8bb46af563092280b965c3416ec921d4840114831cb0fb3e61b83a'
            'd028338dbacbfd30fe46c5a12b4324395173620cc8d0ed344da69d90d6220ff8'
            '22579f9355032a37dc9591fb0f8836dcd60ee9527e422be7c31ad8f7dc4adf32'
            '60fa5fb473a42cf9b0e428c56bf568d06d9a65012210aca3cd8a2173867671f3')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i ../disable-in-app-updater.patch
  patch -Np1 -i ../fix-empty-state-pointer-events.patch
  patch -Np1 -i ../fix-response-bom.patch
  patch -Np1 -i ../fix-webkit-backdrop-blur.patch
  patch -Np1 -i ../feat-reader-zoom.patch
  patch -Np1 -i ../feat-reader-double-page-zoom.patch

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
