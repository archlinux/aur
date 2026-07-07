# Maintainer: RamazanBerk20 <ramazanberksirin@protonmail.com>
pkgname=mini-downloader
pkgver=1.2.1
pkgrel=1
pkgdesc="IDM/JDownloader-style download manager (aria2 + yt-dlp, browser capture)"
arch=('x86_64')
url="https://github.com/RamazanBerk20/mini-downloader"
license=('GPL-3.0-or-later')
depends=('aria2' 'ffmpeg' 'webkit2gtk-4.1' 'libayatana-appindicator')
optdepends=('yt-dlp: video/HLS/DASH grabbing')
makedepends=('rust' 'cargo' 'nodejs' 'pnpm' 'git')
conflicts=('mini-downloader-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2c92afac6c67aee9528298e5c46ce572f087424fcf7d9f9142b28fd388df1cc0')

build() {
  cd "$pkgname-$pkgver"
  (cd apps/desktop && pnpm install --frozen-lockfile)
  cargo build --release -p minidl-native-host
  (cd apps/desktop && pnpm tauri build --no-bundle)
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/minidl-desktop "$pkgdir/usr/bin/minidl-desktop"
  install -Dm755 target/release/minidl-native-host "$pkgdir/usr/bin/minidl-native-host"

  # Desktop entry + icon (tauri generates these into the bundle tree only when
  # bundling, so ship our own).
  install -Dm644 apps/desktop/src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/mini-downloader.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/mini-downloader.desktop" <<'DESKTOP'
[Desktop Entry]
Name=Mini Downloader
Comment=IDM/JDownloader-style download manager
Exec=minidl-desktop %u
Icon=mini-downloader
Terminal=false
Type=Application
Categories=Network;FileTransfer;Utility;
MimeType=x-scheme-handler/magnet;x-scheme-handler/minidownloader;
DESKTOP

  # Firefox native-messaging host (system-wide).
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.minidownloader.host.json" <<'JSON'
{
  "name": "com.minidownloader.host",
  "description": "Mini Downloader native bridge",
  "path": "/usr/bin/minidl-native-host",
  "type": "stdio",
  "allowed_extensions": ["minidownloader@ramazan.dev"]
}
JSON
}
