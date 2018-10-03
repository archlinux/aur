# Maintainer: Bruno Pagani <bruno.n.pagani@gmail.com>

_pkgname=mpv
pkgname=${_pkgname}-light
pkgver=0.29.1
pkgrel=1
_waf_version=2.0.9
pkgdesc="Free, open source, and cross-platform media player – with selection of features."
url="https://mpv.io"
license=('GPL')
arch=('i686' 'x86_64')
depends=('ffmpeg' 'libxkbcommon' 'libxrandr' 'libxss' 'lua52' 'uchardet' 'libxinerama')
makedepends=('mesa' 'python-docutils' 'wayland-protocols' 'wayland')
optdepends=('youtube-dl: for video-sharing websites playback')
options=('!emptydirs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(${_pkgname}-${pkgver}.tar.gz::"https://github.com/mpv-player/${_pkgname}/archive/v${pkgver}.tar.gz"
        "https://waf.io/waf-${_waf_version}")
sha256sums=('f9f9d461d1990f9728660b4ccb0e8cb5dce29ccaa6af567bec481b79291ca623'
            '2a8e0816f023995e557f79ea8940d322bec18f286917c8f9a6fa2dc3875dfa48')

prepare() {
  cd ${_pkgname}-${pkgver}

  install -m755 "${srcdir}"/waf-${_waf_version} waf
}

build() {
  cd ${_pkgname}-${pkgver}

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --lua=52arch \
    --enable-zsh-comp \
    --enable-libmpv-shared \
    --disable-libarchive \
    --disable-libbluray \
    --disable-rubberband \
    --disable-vapoursynth \
    --disable-vapoursynth-lazy \
    --disable-oss-audio \
    --disable-rsound \
    --disable-pulse \
    --disable-jack \
    --disable-opensles \
    --disable-xv \
    --disable-caca \
    --disable-tv-v4l2 \
    --disable-libv4l2 \
    --disable-audio-input

  ./waf build
}

package() {
  cd ${_pkgname}-${pkgver}

  ./waf install --destdir="${pkgdir}"

  install -m644 DOCS/{encoding.rst,tech-overview.txt} "${pkgdir}"/usr/share/doc/mpv
}
