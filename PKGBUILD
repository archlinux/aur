# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Jan Koppe <post@jankoppe.de>
#
# This package is a modified version of extra/ffmpeg with --enable-decklink

pkgname=ffmpeg-decklink
_srcname=ffmpeg
pkgver=4.0.1
pkgrel=2
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video (decklink enabled)'
arch=('i686' 'x86_64')
url='http://ffmpeg.org/'
license=('custom: nonfree and unredistributable')
depends=('alsa-lib' 'aom' 'bzip2' 'fontconfig' 'fribidi' 'glibc' 'gmp' 'gnutls' 'gsm'
         'lame' 'libavc1394' 'libdrm' 'libiec61883' 'libmodplug' 'libomxil-bellagio'
         'libpulse' 'libraw1394' 'libsoxr' 'libssh' 'libtheora' 'libvdpau' 'libwebp'
         'libx11' 'libxcb' 'libxext' 'libxml2' 'libxv' 'opencore-amr' 'openjpeg2'
         'opus' 'sdl2' 'speex' 'v4l-utils' 'xz' 'zlib'
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
          'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
          'libswscale.so' 'ffmpeg' 'qt-faststart')
conflicts=('ffmpeg' 'ffmpeg-git')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"
        'LICENSE')
sha256sums=('605f5c01c60db35d3b617a79cabb2c7032412be243554602eeed1b628125c0ee'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')

build() {
    cd "${_srcname}-${pkgver}"
    
    msg2 'Running ffmpeg configure script. Please wait...'
    
    ./configure \
        --prefix='/usr' \
        --disable-debug \
        --disable-static \
        --disable-stripping \
        --enable-avresample \
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
    
    install -D -m755 tools/qt-faststart  "${pkgdir}/usr/bin/qt-faststart"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
