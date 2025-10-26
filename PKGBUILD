# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Sylvain "Magicking" Laurent <s@6120.eu>

pkgname=ffmpeg-ndi
pkgver=7.1.1
pkgrel=4
epoch=2
pkgdesc='Complete solution to record, convert and stream audio and video with NDI support'
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
  libvpx
  libwebp
  libx11
  libxcb
  libxext
  libxml2
  libxv
  ndi-sdk
  ocl-icd
  onevpl
  opencore-amr
  openjpeg2
  opus
  rav1e
  rubberband
  sdl2
  shaderc
  snappy
  speex
  srt
  svt-av1
  v4l-utils
  vapoursynth
  vmaf
  vulkan-icd-loader
  xz
  zeromq
  zimg
  zlib
)
makedepends=(
  amf-headers
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
  'intel-media-sdk: Intel QuickSync support (legacy)'
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
)
_tag=a1328e68877e12ab5a6e5d92a84aefa566783ea5
source=(
  git+https://git.ffmpeg.org/ffmpeg.git?signed#tag=${_tag}
  0001-Add-av_stream_get_first_dts-for-Chromium.patch
  0002-avcodec-libsvtav1-unbreak-build-with-latest-svtav1.patch
  fix_build_with_v4l2_1.30.patch
  chore-Add-nonfree-libndi_newtek-device.patch
)
b2sums=('c7b1a56593f123de8e18b3b93c81dca4aff439f5701935cc1fe6316543e8c3256acd7f95b4a533eb7ba30e346fa13bf0ad5bff54b7822c088ef3939882416a7c'
        'e5f7b79f7731be9ee5a7280a9221fb531ac5a2d9820fc5870b68b0eabea667dfbe8f39f41c1e1763a4c84982896afaa54c81ff57847d203b70afafd726689e5d'
        'a32aeff68032a78d661011654bbdba138002833f7d17d23bba6f95479ca22bef5697eb9e7e4cb9e0b5140fc23eab3aab16fc60962d62809c3c02f890599a8332'
        'a713b3a4243cc5de3867f7c210172c094f50bd614c0c8be2c99d6161b06d43d9183ae9c442ac3056bfe06c28419e276d129b1235471466eedd340bf0c4780acb'
        'deb68ec424eecee1726014f76823486c053f4fa53585bf90192ec935d5e01148577b1abfe3723bcc6d48dc32aeb43872ab3c1ae95ecd1d69c411d2176a3eae85')
validpgpkeys=(DD1EC9E8DE085C629B3E1846B18E8928B3948D64) # Michael Niedermayer <michael@niedermayer.cc>

prepare() {
  cd ffmpeg

  # Fix build with v4l2 >= 1.30
  # https://trac.ffmpeg.org/ticket/11570
  patch -Np1 -i "${srcdir}/fix_build_with_v4l2_1.30.patch"
  patch -Np1 -i ../chore-Add-nonfree-libndi_newtek-device.patch

  # https://crbug.com/1251779
  git apply -3 ../0001-Add-av_stream_get_first_dts-for-Chromium.patch

  # Fix for svt-av1
  # Taken from https://github.com/FFmpeg/FFmpeg/commit/d1ed5c06e3edc5f2b5f3664c80121fa55b0baa95.patch
  git apply -3 ../0002-avcodec-libsvtav1-unbreak-build-with-latest-svtav1.patch


  # VAAPI HEVC encode alignment fix
  git cherry-pick -n bcfbf2bac8f9eeeedc407b40596f5c7aaa0d5b47
  git cherry-pick -n d0facac679faf45d3356dff2e2cb382580d7a521

}

pkgver() {
  cd ffmpeg
  git describe --tags | sed 's/^n//'
}

build() {
  export PKG_CONFIG_PATH='/usr/lib/mbedtls2/pkgconfig'
  cd ffmpeg
  ./configure \
    --prefix=/usr \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-amf \
    --enable-cuda-llvm \
    --enable-lto \
    --enable-fontconfig \
    --enable-gmp \
    --enable-gnutls \
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
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libndi_newtek \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopenmpt \
    --enable-libopus \
    --enable-libplacebo \
    --enable-libpulse \
    --enable-librav1e \
    --enable-librsvg \
    --enable-libsnappy \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libsrt \
    --enable-libssh \
    --enable-libsvtav1 \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvmaf \
    --enable-libvorbis \
    --enable-libvpl \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libxcb \
    --enable-libxml2 \
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
    --enable-libshaderc
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
    libva.so
    libva-drm.so
    libva-x11.so
    libvorbisenc.so
    libvorbis.so
    libvpx.so
    libzimg.so
    libzmq.so
  )

  make DESTDIR="${pkgdir}" -C ffmpeg install install-man
  install -Dm 755 ffmpeg/tools/qt-faststart "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
