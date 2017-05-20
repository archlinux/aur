# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Jan Koppe <post@jankoppe.de>
#
# This package is a modified version of extra/ffmpeg with --enable-decklink

pkgname=ffmpeg-decklink
pkgver=3.3.1
pkgrel=1
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video (decklink enabled)'
arch=('i686' 'x86_64')
url='http://ffmpeg.org/'
license=('custom:UNREDISTRIBUTABLE')
depends=('alsa-lib' 'bzip2' 'fontconfig' 'fribidi' 'glibc' 'gmp' 'gnutls' 'gsm'
         'jack' 'lame' 'libavc1394' 'libiec61883' 'libmodplug' 'libpulse'
         'libraw1394' 'libsoxr' 'libssh' 'libtheora' 'libva' 'libvdpau'
         'libwebp' 'libx11' 'libxcb' 'opencore-amr' 'openjpeg2' 'opus'
         'schroedinger' 'sdl2' 'speex' 'v4l-utils' 'xz' 'zlib'
         'libass.so' 'libbluray.so' 'libfreetype.so' 'libnetcdf.so'
         'libvidstab.so' 'libvorbisenc.so' 'libvorbis.so' 'libvpx.so'
         'libx264.so' 'libx265.so' 'libxvidcore.so')
makedepends=(
    # binary repositories:
        'hardening-wrapper' 'ladspa' 'libvdpau' 'yasm'
    # AUR:
        'blackmagic-decklink-sdk'
)
optdepends=('ladspa: LADSPA filters')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
          'libswscale.so' 'ffmpeg')
conflicts=('ffmpeg' 'ffmpeg-git')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"
        'UNREDISTRIBUTABLE.txt')
sha256sums=('b702a7fc656ac23e276b8c823a2f646e4e6f6309bb2788435a708e69bea98f2f'
            'bc2b76d4f5be42c5b0a6a07f1b754d29392c84f8234f3b6ab9e7858fdc4043ff')

build() {
  cd "ffmpeg-${pkgver}"

  msg2 "Running ffmpeg configure script. Please wait..."
  
  ./configure \
    --prefix='/usr' \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-avisynth \
    --enable-avresample \
    --enable-fontconfig \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --enable-ladspa \
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
    --enable-libschroedinger \
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
    --enable-libxvid \
    --enable-netcdf \
    --enable-shared \
    --enable-version3 \
    --enable-nonfree \
    --enable-decklink

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play,server}.1
}

package() {
  cd "ffmpeg-${pkgver}"

  make DESTDIR="$pkgdir" install install-man
  install -Dm 755 tools/qt-faststart "${pkgdir}/usr/bin/"
  install -D -m644 "${srcdir}/UNREDISTRIBUTABLE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/UNREDISTRIBUTABLE.txt"
}
