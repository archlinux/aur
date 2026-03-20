# Maintainer: graysky <graysky AT proton DOT me>
# Contributot: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

# Export the variable matching your GPU, then run makepkg:
#   CUDA_ARCH=sm_120 makepkg -si
#
# Architecture      Compute Cap.  GPUs
# ─────────────────────────────────────────────────────────────────────────────
# sm_121            12.1          GB10 (DGX Spark)
# sm_120            12.0          GeForce RTX 5090/5080/5070/5060/5050,
#                                 RTX PRO 6000/5000/4500/4000/2000 Blackwell
# sm_103            10.3          GB300, B300 (data center)
# sm_100            10.0          GB200, B200 (data center)
# sm_90             9.0           H100, H200, GH200 (data center)
# sm_89             8.9           GeForce RTX 4090/4080/4070/4060/4050,
#                                 RTX 6000/5000/4500/4000 Ada, L4, L40, L40S
# sm_87             8.7           Jetson AGX Orin, Orin NX, Orin Nano
# sm_86             8.6           GeForce RTX 3090/3080/3070/3060/3050,
#                                 RTX A6000/A5000/A4000/A3000/A2000, A40, A10
# sm_80             8.0           A100, A30 (data center)
# sm_75             7.5           GeForce RTX 2080/2070/2060, GTX 1650 Ti, T4
#
# Reference: https://developer.nvidia.com/cuda-gpus
# ==============================================================================
_cuda_arch="${CUDA_ARCH:-}"

pkgname=ffmpeg-whisper
pkgver=8.1
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video, with CUDA whipser'
arch=(x86_64)
url=https://ffmpeg.org
license=(GPL-3.0-only)
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
  glslang
  gmp
  gnutls
  gsm
  harfbuzz
  jack
  lame
  lcms2
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
  libvpx
  libwebp
  libx11
  libxcb
  libxext
  libxml2
  libxv
  ocl-icd
  onevpl
  opencore-amr
  openjpeg2
  opus
  rav1e
  rubberband
  sdl2
  snappy
  sndio
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
  zeromq
  zimg
  zlib
  whisper.cpp-cuda
)
makedepends=(
  amf-headers
  avisynthplus
  clang
  ffnvcodec-headers
  frei0r-plugins
  git
  ladspa
  mesa
  nasm
  opencl-headers
  vulkan-headers
  whisper.cpp-cuda
)
optdepends=(
  'avisynthplus: AviSynthPlus support'
  'frei0r-plugins: Frei0r video effects support'
  'intel-media-sdk: Intel QuickSync support (legacy)'
  'ladspa: LADSPA filters'
  'nvidia-utils: Nvidia NVDEC/NVENC support'
  'onevpl-intel-gpu: Intel QuickSync support'
)
provides=(
  ffmpeg
  libavcodec.so
  libavdevice.so
  libavfilter.so
  libavformat.so
  libavutil.so
  libswresample.so
  libswscale.so
)
conflicts=(ffmpeg)
_tag=a65b3bfe9dacc3b20597ef199d0afdd8bc8128e2
source=(
  git+https://git.ffmpeg.org/ffmpeg.git?signed#tag=${_tag}
  0001-Add-av_stream_get_first_dts-for-Chromium.patch
)
b2sums=('8e5818da4965fdd2dc7de521a2f20013a05bd4e9d6fc3eecb6ed261f91c3e4ed4b64687654bee190b0e3b702dc8184f86bfe1941a58cd0b002843c81f70fa904'
        'e5f7b79f7731be9ee5a7280a9221fb531ac5a2d9820fc5870b68b0eabea667dfbe8f39f41c1e1763a4c84982896afaa54c81ff57847d203b70afafd726689e5d')
validpgpkeys=(DD1EC9E8DE085C629B3E1846B18E8928B3948D64) # Michael Niedermayer <michael@niedermayer.cc>

prepare() {
  cd ffmpeg

  # https://crbug.com/1251779
  git apply -3 ../0001-Add-av_stream_get_first_dts-for-Chromium.patch
}

pkgver() {
  cd ffmpeg
  git describe --tags | sed 's/^n//'
}

build() {
  if [[ -z "$_cuda_arch" ]]; then
    echo ""
    echo "ERROR: CUDA_ARCH is not set. You must specify your GPU architecture."
    echo "       Set it before running makepkg, for example:"
    echo ""
    echo "         CUDA_ARCH=sm_120 makepkg -si"
    echo ""
    echo "  sm_121  → GB10 (DGX Spark)"
    echo "  sm_120  → GeForce RTX 5090/5080/5070/5060/5050, RTX PRO Blackwell"
    echo "  sm_103  → GB300, B300 (data center)"
    echo "  sm_100  → GB200, B200 (data center)"
    echo "  sm_90   → H100, H200, GH200"
    echo "  sm_89   → GeForce RTX 4090/4080/4070/4060/4050, Ada, L4, L40S"
    echo "  sm_87   → Jetson AGX Orin, Orin NX, Orin Nano"
    echo "  sm_86   → GeForce RTX 3090/3080/3070/3060/3050, RTX A-series, A40"
    echo "  sm_80   → A100, A30 (data center)"
    echo "  sm_75   → GeForce RTX 2080/2070/2060, GTX 1650 Ti, T4"
    echo ""
    echo "  See: https://developer.nvidia.com/cuda-gpus"
    echo ""
    return 1
  fi

  export PKG_CONFIG_PATH='/usr/lib/mbedtls2/pkgconfig:/usr/lib/pkgconfig'
  export LIBRARY_PATH="/opt/cuda/lib64${LIBRARY_PATH:+:${LIBRARY_PATH}}"
  cd ffmpeg
  ./configure \
    --prefix=/usr \
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
    --enable-lcms2 \
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
    --enable-cuvid \
    --enable-opencl \
    --enable-opengl \
    --enable-shared \
    --enable-vapoursynth \
    --enable-version3 \
    --enable-vulkan \
    --enable-whisper \
    --nvccflags="--cuda-gpu-arch=${_cuda_arch} -O3"
  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

package() {
  depends+=(
    libass.so
    libbluray.so
    libbs2b.so
    libdav1d.so
    libfreetype.so
    libharfbuzz.so
    libjxl.so
    libopenmpt.so
    libplacebo.so
    librav1e.so
    librsvg-2.so
    librubberband.so
    libva.so
    libva-drm.so
    libva-x11.so
    libvidstab.so
    libvorbisenc.so
    libvorbis.so
    libvpx.so
    libx264.so
    libx265.so
    libxvidcore.so
    libzimg.so
    libzmq.so
  )

  make DESTDIR="${pkgdir}" -C ffmpeg install install-man
  install -Dm 755 ffmpeg/tools/qt-faststart "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
#
