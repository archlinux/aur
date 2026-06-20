# Maintainer: Aditya Hebballe <adityahebballe@proton.me>

pkgname=harbor-stremio-bin
_pkgname=harbor
pkgver=0.9.13
pkgrel=5
pkgdesc='A Stremio client built for adventure (binary release)'
arch=('x86_64')
url='https://github.com/harborstremio/harbor'
license=('MIT')

depends=(
  'ffmpeg'
  'gst-libav'
  'gst-plugins-bad'
  'gst-plugins-good'
  'gtk3'
  'libayatana-appindicator'
  'mpv'
  'webkit2gtk-4.1'
  'yt-dlp'
)

makedepends=('libarchive')

provides=('harbor-stremio' 'harbor')
conflicts=('harbor-stremio' 'harbor' 'harbor-stremio-git')

source=("https://github.com/AdityaHebballe/harbor-linux-builds/releases/download/v${pkgver}/Harbor_0.9.13_amd64.deb")
sha256sums=('7a2a992e25456494cd06ac77715cd32f0ae74b06d84aecafb619f1a78be7433c')

package() {
  rm -rf "$srcdir/deb-extract"
  mkdir -p "$srcdir/deb-extract"
  bsdtar --no-same-owner -xf "$srcdir/Harbor_0.9.13_amd64.deb" -C "$srcdir/deb-extract"

  local data_archive
  data_archive="$(find "$srcdir/deb-extract" -maxdepth 1 -type f -name 'data.tar.*' | head -n 1)"
  if [[ -z "$data_archive" ]]; then
    echo "Debian data archive not found" >&2
    return 1
  fi

  bsdtar --no-same-owner -xf "$data_archive" -C "$pkgdir"

  rm -f "$pkgdir/usr/bin/ffmpeg" \
        "$pkgdir/usr/bin/ffprobe" \
        "$pkgdir/usr/bin/yt-dlp"

  if [[ -x "$pkgdir/usr/bin/harbor" && ! -e "$pkgdir/usr/bin/harbor-stremio" ]]; then
    ln -s harbor "$pkgdir/usr/bin/harbor-stremio"
  fi
}
