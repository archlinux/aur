# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=ffmpeg-compat-55
pkgver=2.3.4
pkgrel=4
pkgdesc="Compatibility package for ffmpeg to provide versions 55 of libavcodec, libavdevice and libavformat, not anymore provided by the ffmpeg package"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL')
depends=('gsm' 'lame' 'opencore-amr' 'openjpeg' 'opus' 'rtmpdump' 'libvpx'
         'schroedinger' 'speex' 'v4l-utils' 'xvidcore' 'libpulse'  'libx264'
         'libtheora' 'libbluray' 'libmodplug' 'libva' 'libxv' 'sdl' 'jack'
         'libavutil-52')
makedepends=('yasm' 'libass')
source=("http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.bz2"
        "libvpx_VP8E_UPD_ENTROPY.patch"::"https://git.videolan.org/?p=ffmpeg.git;a=commitdiff_plain;h=6540fe04a3f9a11ba7084a49b3ee5fa2fc5b32ab")
sha256sums=('2f7dece56ea72a22c7cf49e50b58eaadef340457404395cc0479c843b42344f8'
            '2da38f8d3fb671b2e40fd3a3999486086ed0bb98cbaf194d54d6fdc19c76a54d')

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

