# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=quickmedia-git
pkgver=r1288.442fc29
pkgrel=1
pkgdesc='A rofi inspired native client for web services. Supports youtube, peertube, lbry, soundcloud, nyaa.si, 4chan, matrix, saucenao, hotexamples, anilist, dramacool and several manga sites.'
arch=('x86_64')
url="https://git.dec05eba.com/QuickMedia"
license=('GPL3')
makedepends=('sibs-git')
depends=('libglvnd' 'libx11' 'curl' 'mpv' 'libxrandr' 'noto-fonts')
optdepends=(
    'libnotify: For showing notifications'
    'automedia: For automatically downloading new chapters of tracked manga'
    'waifu2x-ncnn-vulkan: For upscaling manga pages when using the --upscale-images option'
    'xdg-utils: For downloading torrents when using nyaa.si plugin or opening remote links'
    'ffmpeg: For displaying webp thumbnails, uploading video thumbnails on matrix and merging video and audio when downloading youtube videos'
    'noto-fonts-cjk: To display chinese, japanese and korean characters'
    'source-highlight: For syntax highlighting in matrix codeblocks'
)
provides=('quickmedia' 'qm' 'quickmedia-video-player')
conflicts=('quickmedia' 'qm' 'quickmedia-video-player')
options=(!strip)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/QuickMedia.git.r1288.442fc29.tar.gz"
    "twemoji-1.tar.gz::https://dec05eba.com/files/twemoji.tar.gz"
)
noextract=("twemoji-1.tar.gz")
sha512sums=(
    '0c332e7e55b246a0b373f88b48c2aa6a9f1f7babe23d2df582b3cc79e93b046768b696e85b3fe3f2b8fab070847a1ea865bda0b1b981be6cf182af00bfba888e'
    'f25bd2ede84dc43278a86b5d234e9c78a102a61dfd796a364e76a135289c29503e97e51dfe49fcd1a72eb714755a45b95c60768811bfb3cdebb23694bc86e7d2'
)

prepare() {
    cd "$srcdir"
    mkdir emoji
    bsdtar -xf twemoji-1.tar.gz -C emoji
}

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

  install -Dm644 example-config.json "$pkgdir/usr/share/quickmedia/example-config.json"
  install -Dm644 README.md "$pkgdir/usr/share/quickmedia/README.md"

  install -Dm644 mpv/fonts/Material-Design-Iconic-Font.ttf "$pkgdir/usr/share/quickmedia/mpv/fonts/Material-Design-Iconic-Font.ttf"
  install -Dm644 mpv/scripts/mordenx.lua "$pkgdir/usr/share/quickmedia/mpv/scripts/mordenx.lua"
  install -Dm644 mpv/input.conf "$pkgdir/usr/share/quickmedia/mpv/input.conf"
  install -Dm644 mpv/mpv.conf "$pkgdir/usr/share/quickmedia/mpv/mpv.conf"

  for file in images/* icons/* shaders/* themes/* emoji/*; do
    install -Dm644 "$file" "$pkgdir/usr/share/quickmedia/$file"
  done

  for file in launcher/*; do
    filename=$(basename "$file")
    install -Dm644 "$file" "$pkgdir/usr/share/applications/$filename"
  done
}
