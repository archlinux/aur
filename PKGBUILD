# Maintainer: Aditya Hebballe <adityahebballe@proton.me>

pkgname=harbor-stremio-beta-bin
_pkgname=harbor
pkgver=0.9.112
pkgrel=1
pkgdesc='A Stremio client built for adventure (beta binary release)'
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

provides=('harbor-stremio-beta' 'harbor')
conflicts=('harbor-stremio-bin' 'harbor-stremio' 'harbor' 'harbor-stremio-git')

source=("Harbor_${pkgver}-${pkgrel}_amd64.deb::https://github.com/AdityaHebballe/harbor-linux-builds/releases/download/beta-v0.9.112-72044f42b939/Harbor_0.9.112_amd64.deb")
sha256sums=('2298c227b9b6f5ff91f73a0d15a8bb5e0287df726593514c9d25b60f74eab371')

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
