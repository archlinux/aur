# Maintainer: opecko <https://github.com/opecko>
# AUR package: builds ytdesk from the GitHub release tag. Updated by scripts/aur.sh.
pkgname=ytdesk
pkgver=1.3.0
pkgrel=1
pkgdesc="YouTube Music desktop client"
url='https://github.com/opecko/ytdesk'
arch=('x86_64')
license=('MIT')
provides=('ytdesk')
conflicts=('ytdesk-bin')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'dbus' 'gst-plugins-base' 'gst-plugins-good' 'gst-libav' 'libayatana-appindicator')
makedepends=('cargo' 'nodejs' 'npm')
optdepends=('nodejs: JS runtime for the yt-dlp playback fallback'
            'gnome-keyring: stores the login cookie (Secret Service)')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/opecko/ytdesk/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1ce603d9885a36aea67f73e79f2077736aa53cb8f25481494e7105edfb6bc8a6')

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
  install -Dm755 src-tauri/target/release/ytdesk "$pkgdir/usr/bin/ytdesk"
  install -Dm644 packaging/linux/ytdesk.desktop "$pkgdir/usr/share/applications/ytdesk.desktop"
  install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/ytdesk.png"
  install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/ytdesk.png"
  install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/ytdesk.png"
  install -Dm644 src-tauri/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/ytdesk.png"
  install -Dm644 src-tauri/app-icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/ytdesk.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
