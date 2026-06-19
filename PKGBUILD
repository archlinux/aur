# Maintainer: Aditya Hebballe <adityahebballe@proton.me>

pkgname=harbor-stremio-bin
_pkgname=harbor
pkgver=0.9.12
pkgrel=1
pkgdesc='A Stremio client built for adventure (unofficial binary release)'
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

source=("https://github.com/AdityaHebballe/harbor-linux-builds/releases/download/v${pkgver}/Harbor_${pkgver}_amd64.deb")
sha256sums=('3638ba06609335db2e0d5c0ac69a66b9f9ad714abeb9ee7c50ec734ab834f80e')

package() {
  rm -rf "$srcdir/deb-extract"
  mkdir -p "$srcdir/deb-extract"
  bsdtar -xf "$srcdir/Harbor_${pkgver}_amd64.deb" -C "$srcdir/deb-extract"

  local data_archive
  data_archive="$(find "$srcdir/deb-extract" -maxdepth 1 -type f -name 'data.tar.*' | head -n 1)"
  if [[ -z "$data_archive" ]]; then
    echo "Debian data archive not found" >&2
    return 1
  fi

  bsdtar -xf "$data_archive" -C "$pkgdir"

  rm -f "$pkgdir/usr/bin/ffmpeg" \
        "$pkgdir/usr/bin/ffprobe" \
        "$pkgdir/usr/bin/yt-dlp"

  if [[ -x "$pkgdir/usr/bin/harbor" && ! -e "$pkgdir/usr/bin/harbor-stremio" ]]; then
    ln -s harbor "$pkgdir/usr/bin/harbor-stremio"
  fi
}
