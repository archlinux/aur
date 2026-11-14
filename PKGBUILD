# Maintainer: RamazanBerk20 <ramazanberksirin@protonmail.com>
pkgname=youtube-video-downloader-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Fast desktop front-end for yt-dlp with a download queue (prebuilt)"
arch=('x86_64')
options=('!strip' '!debug')
url="https://github.com/RamazanBerk20/youtube-video-downloader"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'glib2' 'dbus' 'ffmpeg')
optdepends=(
  'deno: JavaScript runtime for the YouTube challenge solver (nodejs or bun also work)'
  'nodejs: JavaScript runtime for the YouTube challenge solver (alternative to deno)'
  'gnome-keyring: secret service that stores the anyIP proxy password (kwallet also works)'
  'xdg-utils: open the output folder and links in the default handler'
)
provides=("youtube-video-downloader=$pkgver")
conflicts=('youtube-video-downloader')
_deb="YouTube-Downloader_${pkgver}_amd64.deb"
source_x86_64=(
  "$_deb::$url/releases/download/v$pkgver/$_deb"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/RamazanBerk20/youtube-video-downloader/v$pkgver/LICENSE"
)
noextract=("$_deb")
sha256sums_x86_64=('d6b2472d830be8e4bf199677be86c43f0be4e7fc893f0e1e2815d35407ace644'
                   '677d6af767d3fbcb5c70a3ce556021ce00bb6101cc4bf4ea8d54252fbe9b531b')

package() {
  local data_archive
  mkdir -p "$srcdir/deb"
  bsdtar -xf "$srcdir/$_deb" -C "$srcdir/deb"
  data_archive=$(find "$srcdir/deb" -maxdepth 1 -name 'data.tar.*' -print -quit)
  bsdtar -xf "$data_archive" -C "$pkgdir"
  # Tauri names these oddly in the deb; use the standard paths the source packages use.
  mv "$pkgdir/usr/share/applications/YouTube Downloader.desktop" \
    "$pkgdir/usr/share/applications/youtube-downloader.desktop"
  # Releases up to 2.0.2 put the 256 px icon under 256x256@2.
  if [[ -d "$pkgdir/usr/share/icons/hicolor/256x256@2" ]]; then
    mv "$pkgdir/usr/share/icons/hicolor/256x256@2" "$pkgdir/usr/share/icons/hicolor/256x256"
  fi
  install -Dm644 "$srcdir/LICENSE-$pkgver" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
