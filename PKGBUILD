# Maintainer: Aditya Hebballe <adityahebballe@proton.me>

pkgname=harbor-stremio-bin
_pkgname=harbor
pkgver=0.9.20
pkgrel=2
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

source=("Harbor_${pkgver}-${pkgrel}_amd64.deb::https://github.com/AdityaHebballe/harbor-linux-builds/releases/download/v${pkgver}/Harbor_0.9.20_amd64.deb")
sha256sums=('ca2c776f2337290aec114e22b43306cbca76eb4337dd633591d3af82e9e95261')

package() {
  rm -rf "$srcdir/deb-extract"
  mkdir -p "$srcdir/deb-extract"
  bsdtar --no-same-owner -xf "$srcdir/Harbor_${pkgver}-${pkgrel}_amd64.deb" -C "$srcdir/deb-extract"

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
