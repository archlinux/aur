# Maintainer: timescam <rex.ky.ng at gmail dot com>
# Contributor: Paul Wilk <paul.wilk@null.net>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>


pkgname=ffmpeg0.10
pkgver=0.10.16
pkgrel=5
pkgdesc='Complete solution to record, convert and stream audio and video'
arch=('i686' 'x86_64')
url='http://ffmpeg.org/'
license=('GPL')
depends=('alsa-lib' 'bzip2' 'gsm' 'lame' 'libass' 'libmodplug' 'libpulse'
         'libtheora' 'libva' 'opencore-amr' 'openjpeg' 'rtmpdump'
         'schroedinger' 'sdl' 'speex' 'v4l-utils' 'xvidcore' 'zlib'
         'libvorbisenc.so' 'libvorbis.so' 'libvpx.so' 'libx264.so')
makedepends=('libvdpau' 'yasm')
provides=('ffmpeg-compat'
          'libavcodec.so' 'libavutil.so' 'libpostproc.so' 'libswscale.so'
          'libswresample.so' 'libavformat.so' 'libavfilter.so'
          'libavdevice.so')
replaces=('ffmpeg-compat')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.bz2"
        'ffmpeg-0.10-libvpx-1.5.patch')
#validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8') # ffmpeg-devel
sha256sums=('e77823cbd58dfdb61f88059476070bc432d80e3821c14abcf804ef709d2f3fd1'
            'd6797973889582b82b7c81b91a39c222e09b5ccf8a7e031c364ae1e9275a497d')

prepare() {
  cd ffmpeg-${pkgver}
  patch -Np1 -i ../ffmpeg-0.10-libvpx-1.5.patch
  sed -i 's/x264_bit_depth/X264_BIT_DEPTH/' libavcodec/libx264.c
}

build() {
  cd ffmpeg-${pkgver}

  export CFLAGS="$CFLAGS -I/usr/include/openjpeg-1.5"

  ./configure \
    --prefix='/usr' \
    --incdir='/usr/include/ffmpeg0.10' \
    --libdir='/usr/lib/ffmpeg0.10' \
    --shlibdir='/usr/lib/ffmpeg0.10' \
    --disable-debug \
    --disable-static \
    --enable-gpl \
    --enable-libass \
    --enable-libfreetype \
    --enable-libgsm \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libpulse \
    --enable-librtmp \
    --enable-libschroedinger \
    --enable-libspeex \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libxvid \
    --enable-postproc \
    --enable-runtime-cpudetect \
    --enable-shared \
    --enable-vdpau \
    --enable-version3 \
    --enable-x11grab \
    --enable-libx264
  make
}

package() {
  cd ffmpeg-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,share}

  install -dm 755 "${pkgdir}"/etc/ld.so.conf.d
  echo -e '/usr/lib/\n/usr/lib/ffmpeg0.10/' > "${pkgdir}"/etc/ld.so.conf.d/ffmpeg0.10.conf
}

# vim: ts=2 sw=2 et:
