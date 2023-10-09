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
pkgver=6.0
pkgrel=1
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video. Includes cuda support.'
arch=(x86_64)
url=https://ffmpeg.org/
license=('custom')
depends=(
  alsa-lib
  aom
  bzip2
  cuda
  fontconfig
  fribidi
  gmp
  gnutls
  gsm
  jack
  lame
  libass.so
  libavc1394
  libbluray.so
  libbs2b.so
  libdav1d.so
  libdrm
  libfreetype.so
  libgl
  libiec61883
  libmfx
  libmodplug
  libpulse
  librav1e.so
  libraw1394
  librsvg-2.so
  libsoxr
  libssh
  libtheora
  libva.so
  libva-drm.so
  libva-x11.so
  libvdpau
  libvidstab.so
  libvorbisenc.so
  libvorbis.so
  libvpx.so
  libvulkan.so
  libwebp
  libx11
  libx264.so
  libx265.so
  libxcb
  libxext
  libxml2
  libxv
  libxvidcore.so
  libzimg.so
  ocl-icd
  opencore-amr
  openjpeg2
  opus
  sdl2
  speex
  srt
  svt-av1
  v4l-utils
  vmaf
  xz
  zlib
)
makedepends=(
  amf-headers
  avisynthplus
  clang
  ffnvcodec-headers
  git
  ladspa
  mesa
  nasm
  opencl-headers
  vulkan-headers
)
optdepends=(
  'avisynthplus: AviSynthPlus support'
  'intel-media-sdk: Intel QuickSync support'
  'ladspa: LADSPA filters'
  'nvidia-utils: Nvidia NVDEC/NVENC support'
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
  "${pkgname}-${pkgver}.tar.xz::https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"
  'libavcodec.patch'
)
sha256sums=(
    "57be87c22d9b49c112b6d24bc67d42508660e6b718b3db89c44e47e289137082"
    "4a5cda5821a89527f764fe5a0404dada0e4058f4f6b1a7afe28c14229d3aee9f"
)

_dir=ffmpeg-${pkgver}
prepare() {
  cd $_dir
  patch -p1 -i ${srcdir}/libavcodec.patch
}

build() {
  
  local _cflags='-I/opt/cuda/include'
  local _ldflags='-L/opt/cuda/lib64'
  local _nvccflags='-gencode arch=compute_52,code=sm_52 -O2'

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

  ./configure \
    --prefix=/usr \
    --extra-cflags="$_cflags" \
    --extra-ldflags="$_ldflags" \
    --nvccflags="$_nvccflags" \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-amf \
    --enable-avisynth \
    --enable-nonfree \
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
    --enable-librav1e \
    --enable-librsvg \
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
    --enable-version3 \
    --enable-vulkan
  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

package() {
  make DESTDIR="${pkgdir}" -C ${_dir} install install-man
  install -Dm 755 ${_dir}/tools/qt-faststart "${pkgdir}"/usr/bin/

  install -Dm 644 ${_dir}/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
