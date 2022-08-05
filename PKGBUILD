# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kevin Majewski < kevin.majewski02 AT gmail.com >

pkgname='video-downloader'
pkgver=0.9.9
pkgrel=1
pkgdesc='GTK application to download videos from websites like YouTube and many others (based on yt-dlp)'
arch=('any')
url="https://github.com/Unrud/${pkgname}"
license=('GPL3')
depends=(
  'dconf'
  'gtk3'
  'hicolor-icon-theme'
  'libhandy'
  'python-gobject'
  'yt-dlp'
)
makedepends=(
  'librsvg'
  'meson'
)
_tarname="${pkgname}-${pkgver}"
source=("${_tarname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('46eadafe73415bdfbff3a590e0fd969f297d83e538e22dd5d195647b7b24216e69c365d6844e16c1a88ed164526e69edb9b0fd691096ac18c9850ba970d69a0e')

prepare() {
  arch-meson "${_tarname}" 'build'
}

build() {
  meson compile -C 'build'
}

check() {
  meson test -C 'build' --print-errorlogs
}

package() {
  # extra depends are needed for yt-dlp - some are mandatory but erroneously set to optional in Arch
  depends+=(
    'ffmpeg'
    'python-brotli'
    'python-mutagen'
    'python-pycryptodomex'
    'python-websockets'
    'python-xattr'
  )

  DESTDIR="${pkgdir}" meson install -C 'build'
}
