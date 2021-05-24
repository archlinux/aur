# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Dmitrij D. Czarkoff <czarkoff at gmail dot com>

pkgname=baresip
pkgver=1.1.0
pkgrel=1
pkgdesc="portable and modular SIP User-Agent with audio and video support"
arch=('i686' 'x86_64' 'armv6h')
url="http://www.creytiv.com/baresip.html"
license=('BSD')
depends=('rem'
         'openssl'
         're')
optdepends=('alsa-lib: (alsa module)'
            'cairo: (cairo, rst modules)'
            'ffmpeg: (avcodec, avformat, h265 modules)'
            'gsm: (gsm module)'
            'gst-plugins-bad: (gst1, gst_video1 modules)'
            'gst-plugins-base: (gst1, gst_video1 modules)'
            'gst-plugins-good: (gst1, gst_video1 modules)'
            'gst-plugins-ugly: (gst1, gst_video1 modules)'
            'gtk2: (gtk module)'
            'libsndfile: (sndfile module)'
            'libvpx: (vpx module)'
            'libx11: (x11, x11grab modules)'
            'mpg123: (rst module)'
            'opus: (opus module)'
            'sdl2: (sdl2 module)'
            'spandsp: (g722, g726,plc modules)'
            'speexdsp: (speex_aec, speex_pp modules)'
            'v4l-utils: (v4l2 module)')
makedepends=(${optdepends[@]/%:*/})
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/baresip/baresip/archive/v${pkgver}.tar.gz"
        "baresip-flags.patch")
sha256sums=('f9230b27c4a62f31223847bc485c51f3d960f8a09f36998dedb73358e1784b4e'
            '43835240d0cffd2754b7dc36f62340b2fccf5966a3e4b81f0a179428f607b914')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ${srcdir}/baresip-flags.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make V=1 USE_GST= USE_GST_VIDEO= PREFIX="/usr"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make USE_GST= USE_GST_VIDEO= PREFIX="/usr" \
    DESTDIR="$pkgdir/" install
  install -Dm644 docs/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
