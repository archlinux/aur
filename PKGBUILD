# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kevin Majewski < kevin.majewski02 AT gmail.com >

pkgname='video-downloader'
pkgver=0.9.10
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
b2sums=('0af755b0f340b6027ace6dc9ea8b2094c3dec5a249c6850a8d85b0715040ac37ca3c1d5911bcffcbcd36e9f06ed0e9672031181c17ce966f8d56a692d1f410ac')

prepare() {
  arch-meson "${_tarname}" 'build'
}

build() {
  meson compile -C 'build'
}

check() {
  meson test -C 'build' --print-errorlogs || warning 'There were test failures'
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
