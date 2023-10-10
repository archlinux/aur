# Contributor: Muflone http://www.muflone.com/contacts/english/
# Maintainer: Matthew Sexton <wsdmatty@gmail.com>
# Maintainer: sgtxd <mark@sgtxd.de>
# Latest Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=ffmpeg-compat-57
pkgver=3.4.13
pkgrel=1
options=('!lto')
pkgdesc="Compatibility package for ffmpeg to provide versions 57 of libavcodec, libavdevice and libavformat, not anymore provided by the ffmpeg package"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL')
depends=('alsa-lib' 'bzip2' 'fontconfig' 'fribidi' 'glibc' 'gmp' 'gnutls' 'gsm'
         'jack' 'lame' 'libavc1394' 'libiec61883' 'libmodplug' 'libpulse'
         'libraw1394' 'libsoxr' 'libssh' 'libtheora' 'libvdpau' 'libwebp'
         'libx11' 'libxcb' 'libxml2' 'opencore-amr' 'openjpeg' 'opus' 'sdl2'
         'speex' 'v4l-utils' 'xz' 'zlib' 'libxv'
         'libomxil-bellagio'
         'libass.so' 'libbluray.so' 'libfreetype.so' 'libva-drm.so' 'libva.so'
         'libva-x11.so' 'libvidstab.so' 'libvorbisenc.so' 'libvorbis.so'
         'libvpx.so' 'libx264' 'libx265.so' 'libxvidcore.so')
makedepends=('yasm' 'libvdpau')
provides=('libavcodec.so=57' 'libavdevice.so=57' 'libavfilter.so=6'
          'libavformat.so=57' 'libavresample.so=3' 'libavutil.so=55'
          'libpostproc.so=54' 'libswresample.so=2' 'libswscale.so=4')
source=("http://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        "fs56089.patch"
        "binutils.patch::https://git.videolan.org/?p=ffmpeg.git;a=patch;h=effadce6c756247ea8bae32dc13bb3e6f464f0eb")
sha256sums=('fb6bb7f1cff858430343e449955f7c6b134fc7ffee4d1f8fcda7e686a9f2e05a'
            'SKIP'
            '0bfcd12d1992903f21c146ae56d9ad89b52818cfb2303197ee905347c25a5427'
            'a50d7da9870a3fd801ad3a4d13d5c9b260acb094cf8bfa4afd95a54741173a7f')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

prepare() {
  cd "ffmpeg-${pkgver}"

  # https://bugs.archlinux.org/task/56089
  # Backport of http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=a606f27f4c610708fa96e35eed7b7537d3d8f712
  patch -Np1 -i ../fs56089.patch
  
  # https://fftrac-bg.ffmpeg.org/ticket/10405
  patch -Np1 -i ../binutils.patch


}

build() {
  cd ffmpeg-${pkgver}

  ./configure \
    --prefix='/usr' \
    --incdir='/usr/include' \
    --shlibdir='/usr/lib' \
    --libdir='/usr/lib' \
    --disable-debug \
    --disable-doc \
    --disable-programs \
    --disable-static \
    --disable-stripping \
    --enable-avisynth \
    --enable-avresample \
    --enable-fontconfig \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --enable-libass \
    --enable-libbluray \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libssh \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvidstab \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxcb \
    --enable-libxml2 \
    --enable-libxvid \
    --enable-shared \
    --enable-version3

  make
}

package() {
  cd ffmpeg-${pkgver}

  make DESTDIR="${pkgdir}" install-libs
  cd "${pkgdir}/usr/lib"
  rm -f *.so
}

