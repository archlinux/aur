# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=quickmedia
pkgver=r1447.c71a676
pkgrel=1
pkgdesc='A rofi inspired native client for web services. Supports youtube, peertube, lbry, soundcloud, nyaa.si, 4chan, matrix, saucenao, hotexamples, anilist, dramacool and several manga sites.'
arch=('x86_64')
url="https://git.dec05eba.com/QuickMedia"
license=('GPL-3.0-only')
makedepends=('meson')
depends=('libglvnd' 'libx11' 'curl' 'mpv' 'libxrandr' 'libxrender' 'noto-fonts' 'yt-dlp')
optdepends=(
    'libnotify: For showing notifications'
    'automedia: For automatically downloading new chapters of tracked manga'
    'waifu2x-ncnn-vulkan: For upscaling manga pages when using the --upscale-images option'
    'xdg-utils: For downloading torrents when using nyaa.si plugin or opening remote links'
    'ffmpeg: For displaying webp thumbnails, uploading video thumbnails on matrix and merging video and audio when downloading youtube videos'
    'noto-fonts-cjk: To display chinese, japanese and korean characters'
    'source-highlight: For syntax highlighting in matrix codeblocks'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/QuickMedia.git.${pkgver}.tar.gz"
    "twemoji-2.tar.gz::https://dec05eba.com/files/twemoji.tar.gz"
)
noextract=("twemoji-2.tar.gz")
sha512sums=(
    'e1c6c637a7025f1652bfd446b2c1481e684901af61d67436d4338d4b729ad99ecdd72f4095a0aeba091c93fb08ef5357e00fc284126f6891c1f6ee5b140be7ed'
    'a3c7a268bd48bd79b6bfc771affd56d71ffd78ba4df8e2a9e1783162a78c1f053c408e02f4d49ca96eee6a0a19b8cfc85197ad40d497cd89934b8311dcfebe2b'
)

prepare() {
  cd "$srcdir"
  mkdir -p emoji
  bsdtar -xf twemoji-2.tar.gz -C emoji
}

build() {
  cd "$srcdir"
  arch-meson build -Dinstall_symlink=false -Dinstall_emoji=false --buildtype=release -Dstrip=true
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
  ln -sf "/usr/bin/quickmedia" "$pkgdir/usr/bin/qm"
  for file in emoji/*; do
    install -Dm644 "$file" "$pkgdir/usr/share/quickmedia/$file"
  done
}
