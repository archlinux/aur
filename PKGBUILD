# Maintainer: Laura Hausmann <aur@zotan.email>
# Contributor: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Rob McCathie <korrode at gmail>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=ffmpeg-libfdk_aac
pkgver=6.1.1
pkgrel=7
epoch=2
pkgdesc='Complete solution to record, convert and stream audio and video (Same as official package except with libfdk-aac support)'
arch=(x86_64)
url=https://ffmpeg.org
license=(GPL-3.0-only custom:libfdk-aac)
conflicts=("ffmpeg")
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
  libfdk-aac
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
  libpostproc.so
  libswresample.so
  libswscale.so
)
options=(
  debug
)
_tag=6f4048827982a8f48f71f551a6e1ed2362816eec
source=(
  git+https://git.ffmpeg.org/ffmpeg.git?signed#tag=${_tag}
  add-av_stream_get_first_dts-for-chromium.patch
)
b2sums=('9c19bd6b68d4224af2a93fdce199fd0ce9b00432c8818801d124ca993ac45a01d3a7618b66804c02c1f26787a5ca88d2d9f682f3e819cee8c2b6b3dc77e64052'
        '555274228e09a233d92beb365d413ff5c718a782008075552cafb2130a3783cf976b51dfe4513c15777fb6e8397a34122d475080f2c4483e8feea5c0d878e6de')
validpgpkeys=(DD1EC9E8DE085C629B3E1846B18E8928B3948D64) # Michael Niedermayer <michael@niedermayer.cc>

prepare() {
  cd ffmpeg
  # FS#79281: fix assembling with binutil as >= 2.41
  git cherry-pick -n effadce6c756247ea8bae32dc13bb3e6f464f0eb
  # FS#77813: fix playing ogg files with mplayer
  git cherry-pick -n cbcc817353a019da4332ad43deb7bbc4e695d02a
  patch -Np1 -i ../add-av_stream_get_first_dts-for-chromium.patch # https://crbug.com/1251779
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
  cd ffmpeg
  git describe --tags | sed 's/^n//'
}

build() {
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
    --enable-libfdk-aac \
    --enable-nonfree
  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1

  cp /usr/share/licenses/libfdk-aac/NOTICE .
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
  )

  make DESTDIR="${pkgdir}" -C ffmpeg install install-man
  install -Dm 755 ffmpeg/tools/qt-faststart "${pkgdir}"/usr/bin/

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 0644 ffmpeg/NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}

# vim: ts=2 sw=2 et:
