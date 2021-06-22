# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=quickmedia-git
pkgver=r856.e4792f4
pkgrel=1
pkgdesc='A dmenu-inspired native client for web services. Supports youtube, soundcloud, nyaa.si, 4chan, matrix, saucenao and several manga sites.'
arch=('x86_64')
url="https://git.dec05eba.com/QuickMedia"
license=('GPL3')
makedepends=('sibs')
depends=('sfml' 'libx11' 'jsoncpp' 'tidy' 'curl' 'mpv' 'imagemagick' 'libglvnd' 'libxrandr' 'noto-fonts')
optdepends=(
    'libnotify: For showing notifications'
    'automedia: For automatically downloading new chapters of tracked manga'
    'waifu2x-ncnn-vulkan: For upscaling manga pages when using the --upscale-images option'
    'xdg-utils: For downloading torrents when using nyaa.si plugin or opening remote links'
    'ffmpeg: For sending video metadata and thumbnail with /upload in matrix'
    'youtube-dl: To download youtube music/videos. Not required when streaming music/videos'
    'noto-fonts-cjk: To display chinese, japanese and korean characters'
)
provides=('quickmedia')
conflicts=('quickmedia')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/QuickMedia.git.r856.e4792f4.tar.gz")
sha512sums=('9165e2739bf373c7b535f295b54092f09ff443385847c0b3972a434b688c2fccb5dcc2d81f5a900424ecbd2c2a16fcdc1445ad71bb67d3350581fd4c564f8f02')

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
