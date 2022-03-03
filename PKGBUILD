# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=quickmedia-git
pkgver=r1105.a13c19e
pkgrel=1
pkgdesc='A rofi inspired native client for web services. Supports youtube, peertube, lbry, soundcloud, nyaa.si, 4chan, matrix, saucenao, hotexamples, anilist and several manga sites.'
arch=('x86_64')
url="https://git.dec05eba.com/QuickMedia"
license=('GPL3')
makedepends=('sibs')
depends=('libglvnd' 'libx11' 'curl' 'mpv' 'libxrandr' 'noto-fonts')
optdepends=(
    'libnotify: For showing notifications'
    'automedia: For automatically downloading new chapters of tracked manga'
    'waifu2x-ncnn-vulkan: For upscaling manga pages when using the --upscale-images option'
    'xdg-utils: For downloading torrents when using nyaa.si plugin or opening remote links'
    'ffmpeg: For displaying webp thumbnails, uploading video thumbnails on matrix and merging video and audio when downloading youtube videos'
    'noto-fonts-cjk: To display chinese, japanese and korean characters'
)
provides=('quickmedia' 'qm' 'quickmedia-video-player')
conflicts=('quickmedia' 'qm' 'quickmedia-video-player')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/QuickMedia.git.r1105.a13c19e.tar.gz")
sha512sums=('3451ddba9e0d566999dcb8700c68f491d1f34414e77b4a8d31b872b0f0a26beaba7409535c0bd547064fc69e90ea08a465cc818f2b1bd9e420ae302818a2914a')

build() {
  cd "$srcdir"
  sibs build --release video_player
  sibs build --release
}

package() {
  cd "$srcdir"
  install -Dm755 "video_player/sibs-build/$(sibs platform)/release/quickmedia-video-player" "$pkgdir/usr/bin/quickmedia-video-player"
  install -Dm755 "sibs-build/$(sibs platform)/release/quickmedia" "$pkgdir/usr/bin/quickmedia"
  ln -sf "/usr/bin/quickmedia" "$pkgdir/usr/bin/qm"
  install -Dm644 boards.json "$pkgdir/usr/share/quickmedia/boards.json"

  install -Dm644 mpv/fonts/Material-Design-Iconic-Font.ttf "$pkgdir/usr/share/quickmedia/mpv/fonts/Material-Design-Iconic-Font.ttf"
  install -Dm644 mpv/scripts/mordenx.lua "$pkgdir/usr/share/quickmedia/mpv/scripts/mordenx.lua"
  install -Dm644 mpv/input.conf "$pkgdir/usr/share/quickmedia/mpv/input.conf"
  install -Dm644 mpv/mpv.conf "$pkgdir/usr/share/quickmedia/mpv/mpv.conf"

  for file in images/* icons/* shaders/* themes/*; do
    install -Dm644 "$file" "$pkgdir/usr/share/quickmedia/$file"
  done

  for file in launcher/*; do
    filename=$(basename "$file")
    install -Dm644 "$file" "$pkgdir/usr/share/applications/$filename"
  done
}
