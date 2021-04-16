# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=quickmedia-git
pkgver=r639.c90af32
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
sha512sums=('c1e1203684228618991a38c1e4d6a64360c6e6bb5c07366e645c5f4e637bf997ae8b78a7b5a4158eec1850bf676aed90628deb51fcdaea814d7b832ebe92c270')

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
