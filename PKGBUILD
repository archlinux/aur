# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Jan Koppe <post@jankoppe.de>

pkgname=ffmpeg-decklink
pkgver=7.0.2
pkgrel=1
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video (decklink enabled)'
arch=('x86_64')
url='https://www.ffmpeg.org/'
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
  glib2
  glibc
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
  libgl
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
  vapoursynth
  vid.stab
  vmaf
  vulkan-icd-loader
  x264
  x265
  xvidcore
  xz
  zimg
  zlib
)
makedepends=(
  amf-headers
  avisynthplus
  clang
  ffnvcodec-headers
  frei0r-plugins
  ladspa
  mesa
  nasm
  opencl-headers
  vulkan-headers
  decklink-sdk
)
optdepends=('avisynthplus: for AviSynthPlus support'
            'frei0r-plugins: for Frei0r video effects support'
            'ladspa: for LADSPA filters'
            'nvidia-utils: for NVIDIA NVDEC/NVENC support'
            'vpl-runtime: for Intel Quick Sync Video'
)
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libswresample.so' 'libswscale.so'
          'ffmpeg')
conflicts=('ffmpeg')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        '040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch'
        '050-ffmpeg-fix-segfault-with-avisynthplus.patch'
        '060-ffmpeg-fix-nvidia-vulkan-decoding-segfault.patch'
        'LICENSE')
sha256sums=('8646515b638a3ad303e23af6a3587734447cb8fc0a0c064ecdb8e95c4fd8b389'
            'SKIP'
            '62509a98460d3d48afcb0ce26250def7dfed124b82acc95a3b84a2802910c1fa'
            'b0ce071f0d9c7c5eff8e7e654e30c6f4377aa137797aeb54338c2c3a93d5472c'
            '4a8972bc6eae02ed9f473938b6e4d9dfa544274143dd735903073ca89633b721'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

prepare() {
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/050-ffmpeg-fix-segfault-with-avisynthplus.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/060-ffmpeg-fix-nvidia-vulkan-decoding-segfault.patch"
}

build() {
    cd "ffmpeg-${pkgver}"
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
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
