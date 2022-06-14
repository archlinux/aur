# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

_pkgbasename=ffmpeg
pkgname=("lib32-$_pkgbasename" "lib32-lib$_pkgbasename")
pkgver=5.0.1
pkgrel=2
epoch=2
pkgdesc="Complete solution to record, convert and stream audio and video (32 bit)"
arch=('x86_64')
url="http://ffmpeg.org/"
license=('GPL3')
depends=(
#      "$_pkgbasename"
  "$_pkgbasename>=${epoch}:${pkgver}"
  'lib32-alsa-lib'
  'lib32-aom'
  'lib32-bzip2'
  'lib32-fontconfig'
  'lib32-fribidi'
  'lib32-glibc'
  'lib32-gmp'
  'lib32-gnutls'
  'lib32-gsm'
  'lib32-jack'
  'lib32-lame'
  'lib32-libass'
  'lib32-libavc1394'
  'lib32-libbluray'
  'lib32-libdav1d'
  'lib32-libdrm' 
  'lib32-freetype2'
  'lib32-libiec61883'
#      'lib32-libmfx'
  'lib32-libmodplug'
  'lib32-libpulse'
#      'lib32-rav1e'
  'lib32-libraw1394'
  'lib32-librsvg'
#      'lib32-libsoxr'
#      'lib32-libssh'
  'lib32-libtheora'
  'lib32-libva'
  'lib32-libvdpau'
#      'lib32-vid.stab'
  'lib32-libvorbis'
  'lib32-libvpx'
  'lib32-libwebp'
  'lib32-libx11'
  'lib32-x264>=3:0.161'
  'lib32-x265>=3.5'
  'lib32-libxcb'
  'lib32-libxext'
  'lib32-libxml2'
  'lib32-libxv'
  'lib32-xvidcore'
#      'lib32-libzimg'
  'lib32-opencore-amr'
  'lib32-openjpeg2'
  'lib32-opus'
  'lib32-sdl2'
  'lib32-speex'
  'lib32-srt'
#      'lib32-svt-av1'
  'lib32-v4l-utils'
  'lib32-vmaf'
  'lib32-xz'
  'lib32-zlib'
)
makedepends=(
#      'avisynthplus'
  'amf-headers'
  'lib32-clang'
  'ffnvcodec-headers'
  'git'
  'lib32-ladspa'
  'nasm'
)
optdepends=(
#      'avisynthplus: AviSynthPlus support'
#      'intel-media-sdk: Intel QuickSync support'
  'lib32-ladspa: LADSPA filters'
  'lib32-nvidia-utils: Nvidia NVDEC/NVENC support'
)
_tag=9687cae2b468e09e35df4cea92cc2e6a0e6c93b3
options=(
  debug
)
source=(
  "git+https://git.ffmpeg.org/ffmpeg.git#tag=${_tag}"
  "ffmpeg-vmaf2.x.patch"
  "add-av_stream_get_first_dts-for-chromium.patch"
)
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')
b2sums=('SKIP'
  '65039aac811bfd143359e32720cd6ca64124f1789c1b624bd28a5bd75b37362b2a3b6b402203c4e9d137fb1d00895114f3789df40f8381091d38c98e7876cc8a'
  '3f2ee7606500fa9444380d138959cd2bccfbba7d34629a17f4f6288c6bde29e931bbe922a7c25d861f057ddd4ba0b095bbd675c1930754746d5dd476b3ccbc13'
)

prepare() {
  cd ${_pkgbasename}

  # Patching if needed
  git cherry-pick -n 988f2e9eb063db7c1a678729f58aab6eba59a55b # fix nvenc on older gpus
  patch -Np1 -i "${srcdir}"/ffmpeg-vmaf2.x.patch # vmaf 2.x support
  patch -Np1 -i "${srcdir}"/add-av_stream_get_first_dts-for-chromium.patch  # https://crbug.com/1251779
}

pkgver() {
  cd ${_pkgbasename}
  git describe --tags | sed 's/^n//'
}

build() {
  cd ${_pkgbasename}

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure \
    --prefix='/usr' \
    --libdir=/usr/lib32 \
    --shlibdir=/usr/lib32 \
    --cc="gcc -m32" \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-amf \
    --enable-cuda-llvm \
    --enable-lto \
    --disable-inline-asm \
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
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore-amrnb \
    --enable-libopencore-amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-librsvg \
    --enable-libspeex \
    --enable-libsrt \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvmaf \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxcb \
    --enable-libxvid \
    --enable-libxml2 \
    --enable-nvenc \
    --enable-nvdec \
    --enable-shared \
    --enable-version3 \
    --disable-doc

#    --enable-avisynth \ ## not available under 32 bit
#    --enable-libopenh264
#    --enable-librav1e \ ## not available under 32 bit
#    --enable-libsoxr \ ## not available under 32 bit
#    --enable-libssh \ ## not available under 32 bit
#    --enable-libsvtav1 
#    --enable-libuavs3d
#    --enable-libvidstab \ ## not available under 32 bit
#    --enable-libmfx \ ## not available under 32 bit
#    --enable-libzimg \ ## not available under 32 bit

  make
}

package_lib32-libffmpeg() {
  pkgdesc="Complete solution to record, convert and stream audio and video - library (32 bit)"
  provides=(
    'libavcodec.so'
    'libavdevice.so'
    'libavfilter.so'
    'libavformat.so'
    'libavutil.so'
    'libpostproc.so'
    'libswresample.so'
    'libswscale.so'
    'lib32-ffmpeg'
  )

  cd ${_pkgbasename}

  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}"/usr/{include,bin,share}
}

package_lib32-ffmpeg() {
  pkgdesc="Complete solution to record, convert and stream audio and video (32 bit)"
  depends=(
    'lib32-libffmpeg' 
  )

  cd ${_pkgbasename}

  make DESTDIR="${pkgdir}" install

  # Keep files in bin since this is not a library only package. 
  # Use the same naming scheme as proposed in Arch's wiki:  https://wiki.archlinux.org/index.php/32-bit_package_guidelines
  # which is "--program-suffix="-32" with Autoconf
  for i in "${pkgdir}/usr/bin/"*; do
    mv "$i" "$i"-32
  done

  rm -r "${pkgdir}"/usr/{include,lib32,share}
}
