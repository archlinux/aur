# Maintainer: Bruno Pagani <bruno.n.pagani at gmail dot com>

pkgbase=mpv
pkgname=mpv-light
pkgver=0.17.0
pkgrel=1
pkgdesc='Video player based on MPlayer/mplayer2, with selection of features.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://mpv.io'
depends=('ffmpeg' 'lcms2' 'libxkbcommon' 'libxrandr' 'libxss' 'lua52' 'uchardet' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('mesa' 'python-docutils')
optdepends=('youtube-dl: for video-sharing websites playback')
options=('!emptydirs' '!buildflags')
provides=("${pkgbase}")
conflicts=("${pkgbase}")
install=mpv.install
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/mpv-player/${pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('602cd2b0f5fc7e43473234fbb96e3f7bbb6418f15eb8fa720d9433cce31eba6e')

prepare() {
  cd ${pkgbase}-${pkgver}

  ./bootstrap.py
}

build() {
  cd ${pkgbase}-${pkgver}

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --lua=52arch \
    --enable-gpl3 \
    --enable-zsh-comp \
    --enable-libmpv-shared \
    --enable-termios \
    --enable-shm \
    --disable-libsmbclient \
    --disable-libbluray \
    --disable-dvdread \
    --disable-dvdnav \
    --disable-cdda \
    --disable-enca \
    --disable-libguess \
    --enable-uchardet \
    --disable-rubberband \
    --disable-vapoursynth \
    --disable-vapoursynth-lazy \
    --enable-libswresample \
    --disable-libavresample \
    --enable-libavdevice \
    --disable-oss-audio \
    --disable-rsound \
    --disable-jack \
    --disable-pulse \
    --disable-xv \
    --disable-xinerama \
    --disable-vdpau \
    --disable-vdpau-gl-x11 \
    --disable-caca \
    --disable-vdpau-hwaccel \
    --disable-tv \
    --disable-tv-v4l2 \
    --disable-libv4l2 \
    --disable-dvbin

  ./waf build
}

package_mpv-light() {
  cd ${pkgbase}-${pkgver}
  ./waf install --destdir="${pkgdir}"

  install -m644 DOCS/{encoding.rst,tech-overview.txt} \
    "${pkgdir}"/usr/share/doc/mpv
}
