# Maintainer: Andreas Hemmerle <andreas.hemmerle@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=ffmpeg-headless
pkgver=6.1.1
pkgrel=1
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video; optimised for server (headless) systems'
arch=(i686 x86_64 armv7h armv6h aarch64)
url=https://ffmpeg.org
license=(GPL-3.0-only)
depends=(
  aom
  bzip2
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
  lame
  libass
  libavc1394
  libbluray
  libbs2b
  libdrm
  libiec61883
  libjxl
  libmodplug
  libopenmpt
  libplacebo
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
  libxml2
  ocl-icd
  onevpl
  opencore-amr
  openjpeg2
  opus
  rav1e
  rubberband
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
  nasm
  opencl-headers
  vulkan-headers
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
_tag='6f4048827982a8f48f71f551a6e1ed2362816eec'
source=("$pkgname::git+https://git.ffmpeg.org/ffmpeg.git?signed#tag=${_tag}")
b2sums=('SKIP')
validpgpkeys=('DD1EC9E8DE085C629B3E1846B18E8928B3948D64')   # Michael Niedermayer <michael@niedermayer.cc>

prepare() {
  cd "${pkgname}" || exit 1
  # FS#79281: fix assembling with binutil as >= 2.41
  git cherry-pick -n effadce6c756247ea8bae32dc13bb3e6f464f0eb
  # FS#77813: fix playing ogg files with mplayer
  git cherry-pick -n cbcc817353a019da4332ad43deb7bbc4e695d02a
  # use non-deprecated nvenc GUID for conftest
  git cherry-pick -n 03823ac0c6a38bd6ba972539e3203a592579792f
  git cherry-pick -n d2b46c1ef768bc31ba9180f6d469d5b8be677500
  # Fix VDPAU vo
  git cherry-pick -n e9c93009fc34ca9dfcf0c6f2ed90ef1df298abf7
  # Fix bug in av_fft_end
  git cherry-pick -n a562cfee2e214252f8b3f516527272ae32ef9532
  git cherry-pick -n 250471ea1745fc703eb346a2a662304536a311b1
  # Fix build with latest vulkan headers
  git cherry-pick -n fef22c87ada4517441701e6e61e062c9f4399c8e
}

pkgver() {
  cd "${pkgname}" || exit 1
  git describe --tags | sed 's/^n//'
}

build() {
  cd ${pkgname} || exit 1
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
    --disable-libjack \
    --enable-libjxl \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopenmpt \
    --enable-libopus \
    --enable-libplacebo \
    --disable-libpulse \
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
    --disable-libxcb \
    --enable-libxml2 \
    --enable-libxvid \
    --enable-libzimg \
    --enable-nvdec \
    --enable-nvenc \
    --enable-opencl \
    --disable-opengl \
    --enable-shared \
    --enable-vapoursynth \
    --enable-version3 \
    --enable-vulkan \
    --disable-xlib \
    --disable-sdl2 \
    --disable-htmlpages \
    --disable-ffplay
  make
  make tools/qt-faststart
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
    libvidstab.so
    libvorbisenc.so
    libvorbis.so
    libvpx.so
    libx264.so
    libx265.so
    libxvidcore.so
    libzimg.so
  )

  make DESTDIR="${pkgdir}" -C ${pkgname} install install-man
  install -Dm 755 ${pkgname}/tools/qt-faststart "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
