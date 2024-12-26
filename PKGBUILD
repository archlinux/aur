# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=quickmedia
pkgver=r1439.3003cf0
pkgrel=1
pkgdesc='A rofi inspired native client for web services. Supports youtube, peertube, lbry, soundcloud, nyaa.si, 4chan, matrix, saucenao, hotexamples, anilist, dramacool and several manga sites.'
arch=('x86_64')
url="https://git.dec05eba.com/QuickMedia"
license=('GPL-3.0-only')
makedepends=('sibs')
depends=('libglvnd' 'libx11' 'curl' 'mpv' 'libxrandr' 'libxrender' 'noto-fonts')
optdepends=(
    'libnotify: For showing notifications'
    'automedia: For automatically downloading new chapters of tracked manga'
    'waifu2x-ncnn-vulkan: For upscaling manga pages when using the --upscale-images option'
    'xdg-utils: For downloading torrents when using nyaa.si plugin or opening remote links'
    'ffmpeg: For displaying webp thumbnails, uploading video thumbnails on matrix and merging video and audio when downloading youtube videos'
    'noto-fonts-cjk: To display chinese, japanese and korean characters'
    'source-highlight: For syntax highlighting in matrix codeblocks'
    'yt-dlp: To download soundcloud music'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/QuickMedia.git.${pkgver}.tar.gz"
    "twemoji-2.tar.gz::https://dec05eba.com/files/twemoji.tar.gz"
)
noextract=("twemoji-2.tar.gz")
sha512sums=(
    'f18073ec36ad87a593aa4d1e694364b17e833ee339ed4efd3ae97a25dea3fc573d78873100701a0a58ed58829d06a170ff950185c160a1c70e464e523492151e'
    'a3c7a268bd48bd79b6bfc771affd56d71ffd78ba4df8e2a9e1783162a78c1f053c408e02f4d49ca96eee6a0a19b8cfc85197ad40d497cd89934b8311dcfebe2b'
)

prepare() {
    cd "$srcdir"
    mkdir -p emoji
    bsdtar -xf twemoji-2.tar.gz -C emoji
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
  install -Dm644 mpv/scripts/ytdl_hook.lua "$pkgdir/usr/share/quickmedia/mpv/scripts/ytdl_hook.lua"
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
