# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=ffmpeg-compat-54
pkgver=1.2.12
pkgrel=2
pkgdesc="Compatibility package for ffmpeg to provide versions 54 of libavcodec, libavdevice and libavformat, not anymore provided by the ffmpeg package"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL')
depends=('gsm' 'lame' 'opencore-amr' 'openjpeg' 'opus' 'rtmpdump' 'libvpx'
         'schroedinger' 'speex' 'v4l-utils' 'xvidcore' 'libpulse'  'libx264'
         'libtheora' 'libbluray' 'libmodplug' 'sdl' 'jack' 'libavutil-52')
makedepends=('yasm' 'libass')
provides=('libavcodec.so' 'libavdevice.so' 'libavformat.so')
source=("http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.bz2"
        "http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.bz2.asc"
        "libvpx_VP8E_UPD_ENTROPY.patch"::"https://git.videolan.org/?p=ffmpeg.git;a=commitdiff_plain;h=6540fe04a3f9a11ba7084a49b3ee5fa2fc5b32ab")
sha256sums=('913ac95c7fad92c2a4ebcfd11850904f531845c75d45c3e4e4a693990fe2497d'
            'SKIP'
            '1e4a01ed62db525607f9d0c708ef7889474222f9ae31aac057c5bb67edf7e38f')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

prepare() {
  cd "ffmpeg-${pkgver}"
  patch -p1 -i "../libvpx_VP8E_UPD_ENTROPY.patch"
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
    --enable-dxva2 \
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
    --enable-libxvid \
    --enable-runtime-cpudetect \
    --enable-shared \
    --enable-vdpau \
    --enable-version3 \
    --enable-x11grab \
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
  rm -f *.so libavutil.*
}

