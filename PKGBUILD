# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=quickmedia-git
pkgver=r351.75e0887
pkgrel=1
pkgdesc='A dmenu-inspired native client for web services. Supports youtube, nyaa.si, 4chan, matrix and several manga sites.'
arch=('x86_64')
url="https://git.dec05eba.com/QuickMedia"
license=('GPL3')
makedepends=('sibs')
depends=('sfml' 'libx11' 'jsoncpp' 'cppcodec' 'tidy' 'curl' 'mpv' 'youtube-dl' 'libglvnd' 'libxrandr' 'noto-fonts' 'noto-fonts-cjk')
optdepends=(
    'libnotify: For showing notifications'
    'automedia: For automatically downloading new chapters of tracked manga'
    'waifu2x-ncnn-vulkan: For upscaling manga pages when using the --upscale-images option'
    'xdg-utils: For downloading torrents when using nyaa.si plugin'
    'ffmpeg: For sending video metadata and thumbnail with /upload in matrix'
)
provides=('QuickMedia')
conflicts=('QuickMedia')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/QuickMedia.git.tar.gz")
sha512sums=('083680e58b3aa2da224aa51698f12e7b3e32a5b08fac24e6d889afd60cb6acbb0d3260358db9f85d33d9d7525524c40a5f63b08e5abfd588b50df20ed647d4bf')

build() {
  cd "$srcdir"
  sibs build --release
}

package() {
  cd "$srcdir"
  install -Dm755 "sibs-build/$(sibs platform)/release/QuickMedia" "$pkgdir/usr/bin/QuickMedia"
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
