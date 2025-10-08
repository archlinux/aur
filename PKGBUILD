# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Kamran Mackey <kamranm1200@gmail.com>
# Contributor: richteer <richteer at lastprime.net>
# Contributor: DrZaius <lou at fakeoutdoorsman.com>

pkgname=ffmpeg-git
pkgver=8.1.r121357.g7896cc67c1
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video (git version)'
arch=('x86_64')
url='https://ffmpeg.org/'
license=('GPL-3.0-or-later')
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
  ffnvcodec-headers
  frei0r-plugins
  git
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
  'vapoursynth: for VapourSynth demuxer support'
  'vpl-runtime: for Intel Quick Sync Video')
provides=(
  'ffmpeg'
  'libavcodec.so'
  'libavdevice.so'
  'libavfilter.so'
  'libavformat.so'
  'libavutil.so'
  'libswresample.so'
  'libswscale.so')
conflicts=('ffmpeg')
source=('git+https://git.ffmpeg.org/ffmpeg.git'
        '040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch')
sha256sums=('SKIP'
            '1c4f328bfb0dfedf4478f7b3659bcd08c591823a389b9e9e4eb8c35b0b3e0356')

prepare() {
    patch -d ffmpeg -Np1 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
}

pkgver() {
    printf '%s.r%s.g%s' "$(git -C ffmpeg describe --tags --long | awk -F'-' '{ sub(/^n/, "", $1); print $1 }')" \
                        "$(git -C ffmpeg describe --tags --match 'N' | awk -F'-' '{ print $2 }')" \
                        "$(git -C ffmpeg rev-parse --short HEAD)"
}

build() {
    cd ffmpeg
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
        --enable-vulkan
    make
    make tools/qt-faststart
}

package() {
    make -C ffmpeg DESTDIR="$pkgdir" install
    install -D -m755 ffmpeg/tools/qt-faststart -t "${pkgdir}/usr/bin"
}
