# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=quickmedia-git
pkgver=r644.5465c09
pkgrel=1
pkgdesc='A dmenu-inspired native client for web services. Supports youtube, spotify (podcasts), soundcloud, nyaa.si, 4chan, matrix and several manga sites.'
arch=('x86_64')
url="https://git.dec05eba.com/QuickMedia"
license=('GPL3')
makedepends=('sibs')
depends=('sfml' 'libx11' 'jsoncpp' 'tidy' 'curl' 'mpv' 'imagemagick' 'libglvnd' 'libxrandr' 'noto-fonts' 'noto-fonts-cjk')
optdepends=(
    'libnotify: For showing notifications'
    'automedia: For automatically downloading new chapters of tracked manga'
    'waifu2x-ncnn-vulkan: For upscaling manga pages when using the --upscale-images option'
    'xdg-utils: For downloading torrents when using nyaa.si plugin or opening remote links'
    'ffmpeg: For sending video metadata and thumbnail with /upload in matrix'
    'youtube-dl: To play youtube videos'
)
provides=('QuickMedia')
conflicts=('QuickMedia')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/QuickMedia.git.tar.gz")
sha512sums=('4d55821814b09480b24ffe511a7aa63cd7d1e50a9374258f3b4c2119a97ee0e4a8c01130a22caf3990876f19d66e5a069e57286b9d4349b281d8c3602f12c755')

build() {
  cd "$srcdir"
  sibs build --release
}

package() {
  cd "$srcdir"
  install -Dm755 "sibs-build/$(sibs platform)/release/quickmedia" "$pkgdir/usr/bin/quickmedia"
  install -Dm644 boards.json "$pkgdir/usr/share/quickmedia/boards.json"
  install -Dm644 input.conf "$pkgdir/usr/share/quickmedia/input.conf"
  for file in images/* icons/* shaders/*; do
    install -Dm644 "$file" "$pkgdir/usr/share/quickmedia/$file"
  done
  for file in launcher/*; do
    filename=$(basename "$file")
    install -Dm644 "$file" "$pkgdir/usr/share/applications/$filename"
  done
}
