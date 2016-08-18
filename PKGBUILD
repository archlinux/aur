# Maintainer: Bruno Pagani <bruno.n.pagani@gmail.com>

pkgbase=mpv
pkgname=mpv-light
pkgver=0.19.0
pkgrel=1
pkgdesc='Video player based on MPlayer/mplayer2, with selection of features.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://mpv.io'
depends=('ffmpeg' 'lcms2' 'libxkbcommon' 'libxrandr' 'libxss' 'lua52' 'uchardet' 'hicolor-icon-theme')
makedepends=('mesa' 'python-docutils')
optdepends=('youtube-dl: for video-sharing websites playback')
options=('!emptydirs' '!buildflags')
provides=("${pkgbase}")
conflicts=("${pkgbase}")
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/mpv-player/${pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('3df5811942cd1d71f48eb4720092fdafec11885bf6dd6d1d3e6413f32e5d67e2')

prepare() {
  cd ${pkgbase}-${pkgver}

  ./bootstrap.py
}

build() {
  cd ${pkgbase}-${pkgver}

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --lua=52arch \
    --enable-zsh-comp \
    --enable-libmpv-shared \
    --enable-termios \
    --enable-shm \
    --disable-encoding \
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
    --enable-vdpau \
    --enable-vdpau-gl-x11 \
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
