# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Jan Koppe <post@jankoppe.de>

pkgname=ffmpeg-decklink
pkgver=8.0.1
pkgrel=2
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video (decklink enabled)'
arch=('x86_64')
url='https://ffmpeg.org/'
license=('LicenseRef-nonfree-and-unredistributable')
depends=(
  alsa-lib
  aom
  bzip2
  cairo
  dav1d
  fontconfig
  freetype2
  fribidi
  gcc-libs
  glib2
  glibc
  glslang
  gmp
  gnutls
  gsm
  harfbuzz
  jack
  lame
  libass
  libavc1394
  libbluray
  libbs2b
  libdrm
  libdvdnav
  libdvdread
  libiec61883
  libjxl
  libmodplug
  libopenmpt
  libplacebo
  libpulse
  libraw1394
  librsvg
  libsoxr
  libssh
  libtheora
  libva
  libvdpau
  libvorbis
  libvpl
  libvpx
  libwebp
  libx11
  libxcb
  libxext
  libxml2
  libxv
  ocl-icd
  opencore-amr
  openjpeg2
  opus
  rav1e
  rubberband
  sdl2
  snappy
  speex
  srt
  svt-av1
  v4l-utils
  vid.stab
  vmaf
  vulkan-icd-loader
  x264
  x265
  xvidcore
  xz
  zeromq
  zimg
  zlib)
makedepends=(
  amf-headers
  avisynthplus
  clang
  decklink-sdk
  ffnvcodec-headers
  frei0r-plugins
  ladspa
  libgl
  nasm
  opencl-headers
  vapoursynth
  vulkan-headers)
optdepends=(
  'avisynthplus: for AviSynthPlus support'
  'frei0r-plugins: for Frei0r video effects support'
  'ladspa: for LADSPA filters'
  'nvidia-utils: for NVIDIA NVDEC/NVENC support'
  'vpl-runtime: for Intel Quick Sync Video')
provides=(
  'ffmpeg'
  'libavcodec.so'
  'libavdevice.so'
  'libavfilter.so'
  'libavformat.so'
  'libavutil.so'
  'libswscale.so'
  'libswresample.so')
conflicts=('ffmpeg')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        '040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch'
        '110-ffmpeg-add-playback-support-to-decklink-sdk14.3-devices.patch'::'https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/0cd75dbfa0fc6c213cf9240b3c03c809070c5209'
        '120-ffmpeg-add-decklink-sdk14.3-build-support.patch'::'https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/27e94281d1c880b4cae28738e35c0d6f9a58f06b'
        'LICENSE')
sha256sums=('05ee0b03119b45c0bdb4df654b96802e909e0a752f72e4fe3794f487229e5a41'
            'SKIP'
            '5cb2475de410f5696072687af88e91461cdacd1bb636ac14a3b348e3383934f1'
            'd1c4bdbcdd5a852f46639e0cb3dbf0b4a71884487c9fbcdb38139a1e5e96ddaf'
            'ee89e0759f5233d390e3a23415e2664aae38bbe89e10d49ecda8a06c26bd21ee'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

prepare() {
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/110-ffmpeg-add-playback-support-to-decklink-sdk14.3-devices.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/120-ffmpeg-add-decklink-sdk14.3-build-support.patch"
}

build() {
    cd "ffmpeg-${pkgver}"
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    # fix build with v4l2-utils 1.30 with gcc 14 and later
    export CFLAGS+=' -Wno-error=incompatible-pointer-types'
    
    ./configure \
        --prefix='/usr' \
        --disable-debug \
        --disable-static \
        --disable-stripping \
        --enable-amf \
        --enable-avisynth \
        --enable-cuda-llvm \
        --enable-lto \
        --enable-fontconfig \
        --enable-frei0r \
        --enable-gmp \
        --enable-gnutls \
        --enable-gpl \
        --enable-ladspa \
        --enable-libaom \
        --enable-libass \
        --enable-libbluray \
        --enable-libbs2b \
        --enable-libdav1d \
        --enable-libdrm \
        --enable-libdvdnav \
        --enable-libdvdread \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libglslang \
        --enable-libgsm \
        --enable-libharfbuzz \
        --enable-libiec61883 \
        --enable-libjack \
        --enable-libjxl \
        --enable-libmodplug \
        --enable-libmp3lame \
        --enable-libopencore_amrnb \
        --enable-libopencore_amrwb \
        --enable-libopenjpeg \
        --enable-libopenmpt \
        --enable-libopus \
        --enable-libplacebo \
        --enable-libpulse \
        --enable-librav1e \
        --enable-librsvg \
        --enable-librubberband \
        --enable-libsnappy \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libsrt \
        --enable-libssh \
        --enable-libsvtav1 \
        --enable-libtheora \
        --enable-libv4l2 \
        --enable-libvidstab \
        --enable-libvmaf \
        --enable-libvorbis \
        --enable-libvpl \
        --enable-libvpx \
        --enable-libwebp \
        --enable-libx264 \
        --enable-libx265 \
        --enable-libxcb \
        --enable-libxml2 \
        --enable-libxvid \
        --enable-libzimg \
        --enable-libzmq \
        --enable-nvdec \
        --enable-nvenc \
        --enable-opencl \
        --enable-opengl \
        --enable-shared \
        --enable-vapoursynth \
        --enable-version3 \
        --enable-vulkan \
        --enable-decklink \
        --enable-nonfree
    make
    make tools/qt-faststart
}

package() {
    make -C "ffmpeg-${pkgver}" DESTDIR="$pkgdir" install
    install -D -m755 "ffmpeg-${pkgver}/tools/qt-faststart" -t "${pkgdir}/usr/bin"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
