# Maintainer: Bruno Pagani <bruno.n.pagani@gmail.com>

_pkgname=mpv
pkgname=${_pkgname}-light
pkgver=0.27.0
pkgrel=2
_waf_version=1.9.8
pkgdesc="Free, open source, and cross-platform media player – with selection of features."
url="https://mpv.io"
license=('GPL')
arch=('i686' 'x86_64')
depends=('ffmpeg' 'libxkbcommon' 'libxrandr' 'libxss' 'lua52' 'uchardet' 'libxinerama')
makedepends=('mesa' 'python-docutils')
optdepends=('youtube-dl: for video-sharing websites playback')
options=('!emptydirs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(${_pkgname}-${pkgver}.tar.gz::"https://github.com/mpv-player/${_pkgname}/archive/v${pkgver}.tar.gz"
        "https://waf.io/waf-${_waf_version}"
        '0001-opengl-backend-support-multiple-backends.patch'
        '0002-vaapi-Use-libva2-message-callbacks.patch'
        '0003-demux_lavf-return-AVERROR_EOF-on-file-end.patch')
sha256sums=('341d8bf18b75c1f78d5b681480b5b7f5c8b87d97a0d4f53a5648ede9c219a49c'
            '167dc42bab6d5bd823b798af195420319cb5c9b571e00db7d83df2a0fe1f4dbf'
            '609e0530f1b0cdb910dcffb5f62bf55936540e24105ce1b2daf1bd6291a7d58a'
            '3c3517f4f4c71e39e1e04ea440688fc8d7b3dc55e6bc0a9398d11a9b75bde07d'
            '5de6c616428c87cf9b39d8ba24446d65d175050c083e1054194d93cf03d5816a')

prepare() {
  cd ${_pkgname}-${pkgver}
  # --opengl-backend: support multiple backends (#4384) (FS#53962)
  patch -Np1 < "${srcdir}"/0001-opengl-backend-support-multiple-backends.patch

  # vaapi: Use libva2 message callbacks
  patch -Np1 < "${srcdir}"/0002-vaapi-Use-libva2-message-callbacks.patch

  # demux_lavf: return AVERROR_EOF on file end
  patch -Np1 < "${srcdir}"/0003-demux_lavf-return-AVERROR_EOF-on-file-end.patch

  install -m755 "${srcdir}"/waf-${_waf_version} waf
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
    --disable-encoding \
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
