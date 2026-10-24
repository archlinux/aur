# Maintainer: opecko <https://github.com/opecko>
# AUR package: builds Sonolith from the GitHub release tag. Updated by scripts/aur.sh.
pkgname=sonolith
pkgver=2.3.0
pkgrel=1
pkgdesc="YouTube Music desktop client"
url='https://github.com/opecko/sonolith'
arch=('x86_64')
license=('MIT')
# Sonolith was called ytdesk until 2.2.0. The ytdesk packages of the same version are transitional (empty, they
# depend on this one), so only the real old ones conflict.
provides=('ytdesk')
conflicts=('sonolith-bin' "ytdesk<$pkgver" "ytdesk-bin<$pkgver")
replaces=('ytdesk')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'dbus' 'gst-plugins-base' 'gst-plugins-good' 'gst-libav' 'libayatana-appindicator')
makedepends=('cargo' 'nodejs' 'npm')
optdepends=('nodejs: JS runtime for the yt-dlp playback fallback'
            'gnome-keyring: stores the login cookie (Secret Service)')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/opecko/sonolith/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('415e1c315e51c3a8937c972c9d5a39bc04d08caaaa81419133fed088a0b2cf1f')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml --target "$(rustc -vV | sed -n 's/host: //p')"
  npm ci
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  npx tauri build --no-bundle
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 src-tauri/target/release/sonolith "$pkgdir/usr/bin/sonolith"
  # The old command keeps working for one release.
  ln -s sonolith "$pkgdir/usr/bin/ytdesk"
  install -Dm644 packaging/linux/sonolith.desktop "$pkgdir/usr/share/applications/sonolith.desktop"
  install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/sonolith.png"
  install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/sonolith.png"
  install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/sonolith.png"
  install -Dm644 src-tauri/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/sonolith.png"
  install -Dm644 src-tauri/app-icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/sonolith.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
