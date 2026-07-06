# Maintainer: RamazanBerk20 <ramazanberksirin@protonmail.com>
pkgname=mini-downloader-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="IDM/JDownloader-style download manager (aria2 + yt-dlp, browser capture) — binary release"
arch=('x86_64')
url="https://github.com/RamazanBerk20/mini-downloader"
license=('GPL-3.0-or-later')
depends=('aria2' 'ffmpeg' 'webkit2gtk-4.1' 'libayatana-appindicator')
optdepends=('yt-dlp: video/HLS/DASH grabbing')
provides=('mini-downloader')
conflicts=('mini-downloader')
# NOTE: verify the exact asset filename against the GitHub release before
# bumping pkgver — tauri derives it from the product name.
source=("$url/releases/download/v$pkgver/Mini.Downloader_${pkgver}_amd64.deb")
sha256sums=('bc7fb539f35a219b1fe5eb0e13a0dc30a0152994a032ea1739257146d2039058')

package() {
  # Repackage the Debian payload as-is.
  bsdtar -xf data.tar.gz -C "$pkgdir"
  # The deb postinst registers the Firefox native-messaging host system-wide;
  # replicate it here since pacman does not run deb maintainer scripts.
  install -dm755 "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
  cat > "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.minidownloader.host.json" <<'JSON'
{
  "name": "com.minidownloader.host",
  "description": "Mini Downloader native bridge",
  "path": "/usr/bin/minidl-native-host",
  "type": "stdio",
  "allowed_extensions": ["minidownloader@ramazan.dev"]
}
JSON
}
