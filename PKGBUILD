# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Jan Koppe <post@jankoppe.de>
#
# This package is a modified version of extra/ffmpeg with --enable-decklink

pkgname=ffmpeg-decklink
_srcname=ffmpeg
pkgver=4.1.3
pkgrel=1
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video (decklink enabled)'
arch=('i686' 'x86_64')
url='https://ffmpeg.org/'
license=('custom: nonfree and unredistributable')
depends=('alsa-lib' 'aom' 'bzip2' 'fontconfig' 'fribidi' 'glibc' 'gmp' 'gnutls' 'gsm'
         'jack' 'lame' 'libavc1394' 'libdrm' 'libiec61883' 'libmodplug'
         'libomxil-bellagio' 'libpulse' 'libraw1394' 'libsoxr' 'libssh' 'libtheora'
         'libvdpau' 'libwebp' 'libx11' 'libxcb' 'libxext' 'libxml2' 'libxv'
         'opencore-amr' 'openjpeg2' 'opus' 'sdl2' 'speex' 'v4l-utils' 'xz' 'zlib'
         'libass.so' 'libbluray.so' 'libfreetype.so' 'libva-drm.so' 'libva.so'
         'libva-x11.so' 'libvidstab.so' 'libvorbisenc.so' 'libvorbis.so' 'libvpx.so'
         'libx264.so' 'libx265.so' 'libxvidcore.so')
makedepends=(
    # official repositories:
       'nasm' 'ffnvcodec-headers' 'ladspa'
    # AUR:
        'blackmagic-decklink-sdk'
)
optdepends=('ladspa: LADSPA filters')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libswresample.so' 'libswscale.so'
          'ffmpeg')
conflicts=('ffmpeg')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        'LICENSE')
sha256sums=('0c3020452880581a8face91595b239198078645e7d7184273b8bcc7758beb63d'
            'SKIP'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

build() {
    cd "${_srcname}-${pkgver}"
    
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    ./configure \
        --prefix='/usr' \
        --disable-debug \
        --disable-static \
        --disable-stripping \
        --enable-fontconfig \
        --enable-gmp \
        --enable-gnutls \
        --enable-gpl \
        --enable-ladspa \
        --enable-libaom \
        --enable-libass \
        --enable-libbluray \
        --enable-libdrm \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libgsm \
        --enable-libiec61883 \
        --enable-libjack \
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
        --enable-nvdec \
        --enable-nvenc \
        --enable-omx \
        --enable-shared \
        --enable-version3 \
        --enable-nonfree \
        --enable-decklink
        
    make
    make tools/qt-faststart
}

package() {
    cd "${_srcname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m755 tools/qt-faststart  -t "${pkgdir}/usr/bin"
    install -D -m644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
