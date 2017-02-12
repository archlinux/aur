# Maintainer: Bruno Pagani <bruno.n.pagani@gmail.com>

_pkgname=mpv
pkgname=${_pkgname}-light
pkgver=0.24.0
pkgrel=1
pkgdesc="Video player based on MPlayer/mplayer2, with selection of features."
url="https://mpv.io"
license=('GPL')
arch=('i686' 'x86_64')
depends=('ffmpeg' 'libxkbcommon' 'libxrandr' 'libxss' 'lua52' 'uchardet' 'hicolor-icon-theme')
makedepends=('mesa' 'python-docutils')
optdepends=('youtube-dl: for video-sharing websites playback')
options=('!emptydirs' '!buildflags')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(${_pkgname}-${pkgver}.tar.gz::"https://github.com/mpv-player/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a41854fa0ac35b9c309ad692aaee67c8d4495c3546f11cb4cdd0a124195d3f15')

prepare() {
  cd ${_pkgname}-${pkgver}

  ./bootstrap.py
}

build() {
  cd ${_pkgname}-${pkgver}

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --lua=52arch \
    --enable-zsh-comp \
    --enable-libmpv-shared \
    --enable-termios \
    --enable-shm \
    --disable-libsmbclient \
    --disable-encoding \
    --disable-libbluray \
    --disable-dvdread \
    --disable-dvdnav \
    --disable-cdda \
    --disable-rubberband \
    --disable-vapoursynth \
    --disable-vapoursynth-lazy \
    --disable-libarchive \
    --disable-sdl2 \
    --disable-sdl1 \
    --disable-oss-audio \
    --disable-rsound \
    --disable-sndio \
    --disable-pulse \
    --disable-jack \
    --disable-openal \
    --disable-opensles \
    --disable-xv \
    --disable-xinerama \
    --disable-caca \
    --disable-tv \
    --disable-tv-v4l2 \
    --disable-libv4l2 \
    --disable-audio-input \
    --disable-dvbin

  ./waf build
}

package() {
  cd ${_pkgname}-${pkgver}

  ./waf install --destdir="${pkgdir}"

  install -m644 DOCS/{encoding.rst,tech-overview.txt} "${pkgdir}"/usr/share/doc/mpv
}
