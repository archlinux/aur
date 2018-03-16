# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=ffmpeg-compat-57
pkgver=3.3.4
pkgrel=2
pkgdesc="Compatibility package for ffmpeg to provide versions 57 of libavcodec, libavdevice and libavformat, not anymore provided by the ffmpeg package"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL')
depends=('bzip2' 'fribidi' 'glibc' 'gmp' 'gnutls' 'gsm'
         'lame' 'libmodplug'
         'libtheora' 'libva'
         'libwebp' 'opencore-amr' 'openjpeg2' 'opus'
         'schroedinger' 'speex' 'v4l-utils' 'xz' 'zlib'
         'libbluray.so>=2-64'
         'libvorbisenc.so>=2-64' 'libvorbis.so>=0-64' 'libvpx.so>=5-64'
         'libx264.so>=152-64' 'libx265.so>=146-64' 'libxvidcore.so>=4-64'
         'rtmpdump')
makedepends=('yasm')
provides=('libavcodec.so=57' 'libavdevice.so=57' 'libavformat.so=57' 'libavutils.so=55')
source=("http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        "ffmpeg-openjpeg2.2.patch")
sha256sums=('98b97e1b908dfeb6aeb6d407e5a5eacdfc253a40c2d195f5867ed2d1d46ea957'
            'SKIP'
            '490598f78d7879af8ef5b8d7f92ada83d0ee64f9609f6c7b989eb331c2539f68')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

prepare() {
  cd "ffmpeg-${pkgver}"
  patch -Np1 -i ../ffmpeg-openjpeg2.2.patch
}

build() {
  cd "ffmpeg-${pkgver}"
  ./configure \
    --prefix=/usr \
    --incdir="/usr/include" \
    --shlibdir="/usr/lib" \
    --libdir="/usr/lib" \
    --disable-debug \
    --disable-static \
    --disable-fontconfig \
    --enable-gpl \
    --enable-libass \
    --enable-libbluray \
    --enable-libfreetype \
    --enable-libgsm \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-librtmp \
    --enable-libschroedinger \
    --enable-libspeex \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxvid \
    --enable-runtime-cpudetect \
    --enable-shared \
    --enable-vdpau \
    --enable-version3 \
    --disable-doc \
    --disable-programs \
    --disable-avresample \
    --disable-avfilter \
    --disable-postproc \
    --disable-swresample \
    --disable-swscale
  make
}

package() {
  cd "ffmpeg-${pkgver}"
  make DESTDIR="${pkgdir}" install-libs
  cd "${pkgdir}/usr/lib"
  rm -f *.so
}

