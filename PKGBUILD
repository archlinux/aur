# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Jan Koppe <post@jankoppe.de>

pkgname=ffmpeg-decklink
pkgver=4.2.3
pkgrel=1
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video (decklink enabled)'
arch=('x86_64')
url='https://www.ffmpeg.org/'
license=('custom: nonfree and unredistributable')
depends=(
    'alsa-lib'
    'aom'
    'bzip2'
    'fontconfig'
    'fribidi'
    'gmp'
    'gnutls'
    'gsm'
    'jack'
    'lame'
    'libass.so'
    'libavc1394'
    'libbluray.so'
    'libdav1d.so'
    'libdrm'
    'libfreetype.so'
    'libiec61883'
    'libmfx'
    'libmodplug'
    'libomxil-bellagio'
    'libpulse'
    'libraw1394'
    'libsoxr'
    'libssh'
    'libtheora'
    'libva.so'
    'libva-drm.so'
    'libva-x11.so'
    'libvdpau'
    'libvidstab.so'
    'libvorbisenc.so'
    'libvorbis.so'
    'libvpx.so'
    'libwebp'
    'libx11'
    'libx264.so'
    'libx265.so'
    'libxcb'
    'libxext'
    'libxml2'
    'libxv'
    'libxvidcore.so'
    'opencore-amr'
    'openjpeg2'
    'opus'
    'sdl2'
    'speex'
    'srt'
    'v4l-utils'
    'vmaf'
    'xz'
    'zlib'
)
makedepends=(
    # official repositories:
       'nasm' 'ffnvcodec-headers' 'ladspa'
    # AUR:
        'decklink-sdk'
)
optdepends=('avisynthplus: for reading AviSynth scripts as input'
            'intel-media-sdk: for Intel Quick Sync Video'
            'ladspa: for LADSPA filters'
            'nvidia-utils: Nvidia NVDEC/NVENC support')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libswresample.so' 'libswscale.so'
          'ffmpeg')
conflicts=('ffmpeg')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        '010-ffmpeg-fix-vmaf-model-path.patch'
        '011-ffmpeg-add-decklink-11.5-support.patch'::'https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/f32f9231dd4f74d9f95eef575b838bdc3e06a234'
        '012-ffmpeg-dont-adjust-mp3-start-time.patch'::'https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/460132c9980f8a1f501a1f69477bca49e1641233'
        'LICENSE')
sha256sums=('9df6c90aed1337634c1fb026fb01c154c29c82a64ea71291ff2da9aacb9aad31'
            'SKIP'
            'b6fcef2f4cbb1daa47d17245702fbd67ab3289b6b16f090ab99b9c2669453a02'
            'd23dedb5a275d1d753d30fd544a46d5b609868ad5d384b9c8c2ecc1a02281828'
            '269555538ec6d410b42ec43d22edd3eff2006208a1d4cbc8a028d9a432b81577'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

prepare() {
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/010-ffmpeg-fix-vmaf-model-path.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/011-ffmpeg-add-decklink-11.5-support.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/012-ffmpeg-dont-adjust-mp3-start-time.patch"
}

build() {
    cd "ffmpeg-${pkgver}"
    
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    ./configure \
        --prefix='/usr' \
        --disable-debug \
        --disable-static \
        --disable-stripping \
        --enable-avisynth \
        --enable-fontconfig \
        --enable-gmp \
        --enable-gnutls \
        --enable-gpl \
        --enable-ladspa \
        --enable-libaom \
        --enable-libass \
        --enable-libbluray \
        --enable-libdav1d \
        --enable-libdrm \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libgsm \
        --enable-libiec61883 \
        --enable-libjack \
        --enable-libmfx \
        --enable-libmodplug \
        --enable-libmp3lame \
        --enable-libopencore_amrnb \
        --enable-libopencore_amrwb \
        --enable-libopenjpeg \
        --enable-libopus \
        --enable-libpulse \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libsrt \
        --enable-libssh \
        --enable-libtheora \
        --enable-libv4l2 \
        --enable-libvidstab \
        --enable-libvmaf \
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
    make -C "ffmpeg-${pkgver}" DESTDIR="$pkgdir" install
    install -D -m755 "ffmpeg-${pkgver}/tools/qt-faststart" -t "${pkgdir}/usr/bin"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
