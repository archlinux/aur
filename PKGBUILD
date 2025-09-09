# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Gleb Sinyavskiy <zhulik.gleb@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

# Documentation:
# https://docs.nvidia.com/video-technologies/video-codec-sdk/ffmpeg-with-nvidia-gpu/
# https://arnon.dk/matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards/

pkgname=ffmpeg-cuda
pkgver=8.0.0
pkgrel=1
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video. Includes cuda support.'
arch=(x86_64)
url=https://ffmpeg.org/
license=('GPL-3.0-only')
depends=(
  alsa-lib
  aom
  bzip2
  cairo
  dav1d
  cuda
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
  libgl
  libiec61883
  libjxl
  libvpl
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
  git
  ladspa
  mesa
  nasm
  opencl-headers
  vulkan-headers
)
optdepends=(
  'avisynthplus: AviSynthPlus support'
  'frei0r-plugins: Frei0r video effects support'
  'intel-media-sdk: Intel QuickSync support'
  'ladspa: LADSPA filters'
  'nvidia-utils: Nvidia NVDEC/NVENC support'
  'onevpl-intel-gpu: Intel QuickSync support'
)
provides=(
  libavcodec.so
  libavdevice.so
  libavfilter.so
  libavformat.so
  libavutil.so
  libpostproc.so
  libswresample.so
  libswscale.so
  ffmpeg
)
conflicts=('ffmpeg')
source=(
  "git+https://git.ffmpeg.org/ffmpeg.git#tag=n8.0"
  "add-av_stream_get_first_dts-for-chromium.patch"
  "nvcc-stdc++-14.patch"
)
sha256sums=(
  "SKIP"
  "57e26caced5a1382cb639235f9555fc50e45e7bf8333f7c9ae3d49b3241d3f77"
  "b26219c96c8d1539fbb57a241a45894c2c0d50196f34b6af0929505da8584723"
)

_dir=ffmpeg

prepare() {
    cd ${srcdir}
    patch -Np0 -i ${srcdir}/add-av_stream_get_first_dts-for-chromium.patch
    patch -Np0 -i ${srcdir}/nvcc-stdc++-14.patch
}

build() {

  #local _nvccflags='-gencode arch=compute_52,code=sm_52 -O2'

#  local _nvccflags='-arch=sm_52 \
#                    -gencode arch=compute_52,code=sm_52 \
#                    -gencode arch=compute_53,code=sm_53 \
#                    -gencode arch=compute_60,code=sm_60 \
#                    -gencode arch=compute_61,code=sm_61 \
#                    -gencode arch=compute_62,code=sm_62 \
#                    -gencode arch=compute_70,code=sm_70 \
#                    -gencode arch=compute_72,code=sm_72 \
#                    -gencode arch=compute_75,code=sm_75 \
#                    -gencode arch=compute_80,code=sm_80 \
#                    -gencode arch=compute_86,code=sm_86 \
#                    -gencode arch=compute_87,code=sm_87 \
#                    -gencode arch=compute_89,code=sm_89 \
#                    -gencode arch=compute_89,code=compute_89 \
#                    -O2'

  cd ${_dir}
  export PATH="/opt/cuda/bin:$PATH"
    #--nvccflags="$_nvccflags" \
  ./configure \
    --prefix=/usr \
    --cc="/usr/bin/gcc-14" \
    --cxx="/usr/bin/g++-14" \
    --stdcxx="c++14" \
    --nvccflags="-ccbin /usr/bin/g++-14 -O2 -std=c++14" \
    --extra-cflags="-I/opt/cuda/include" \
    --extra-ldflags="-L/opt/cuda/lib64" \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-amf \
    --enable-avisynth \
    --enable-nonfree \
    --enable-cuda-llvm \
    --enable-cuda-nvcc \
    --enable-libnpp \
    --enable-lto \
    --enable-fontconfig \
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
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libharfbuzz \
    --enable-libiec61883 \
    --enable-libjack \
    --enable-libjxl \
    --enable-libvpl \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
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
    --enable-vulkan
  make -j`nproc`
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

package() {
  make DESTDIR="${pkgdir}" -C ${_dir} install install-man
  install -Dm 755 ${_dir}/tools/qt-faststart "${pkgdir}"/usr/bin/

  install -Dm 644 ${_dir}/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
