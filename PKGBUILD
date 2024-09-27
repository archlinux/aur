# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

_pkgbasename=ffmpeg
pkgname=("lib32-$_pkgbasename")
pkgver=7.0.2
pkgrel=3
epoch=2
pkgdesc="Complete solution to record, convert and stream audio and video (32 bit)"
arch=('x86_64')
url="http://ffmpeg.org"
license=('GPL-3.0-only')
replaces=("lib32-lib$_pkgbasename")
conflicts=("lib32-lib$_pkgbasename")
depends=(
#  "$_pkgbasename"
  "$_pkgbasename>=${epoch}:${pkgver}"
  'lib32-alsa-lib'
  'lib32-aom'
  'lib32-bzip2'
#  'lib32-cairo'
  'lib32-fontconfig'
  'lib32-fribidi'
#  'lib32-glib2'
  'lib32-glibc'
  'lib32-gmp'
  'lib32-gnutls'
  'lib32-gsm'
  'lib32-jack'
  'lib32-lame'
  'lib32-libass'
  'lib32-libavc1394'
  'lib32-libbluray'
  'lib32-libbs2b'
  'lib32-libdav1d'
  'lib32-libdrm'
  'lib32-libdvdnav'
  'lib32-libdvdread'
  'lib32-freetype2'
  'lib32-libglvnd'
  'lib32-harfbuzz'
  'lib32-libiec61883'
#  'lib32-libjxl'
#  'lib32-onevpl'
  'lib32-libmodplug'
#  'lib32-libopenmpt'
  'lib32-libplacebo'
  'lib32-libpulse'
  'lib32-rav1e'
  'lib32-libraw1394'
  'lib32-librsvg'
#  'lib32-rubberband'
#  'lib32-libsoxr'
#  'lib32-libssh'
  'lib32-libtheora'
  'lib32-libva'
  'lib32-libvdpau'
#  'lib32-vid.stab'
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
  'lib32-zimg'
  'lib32-ocl-icd'
  'lib32-opencore-amr'
  'lib32-openjpeg2'
  'lib32-opus'
  'lib32-sdl2'
#  'lib32-snappy'
  'lib32-speex'
  'lib32-srt'
#  'lib32-svt-av1'
  'lib32-v4l-utils'
#  'lib32-vapoursynth'
  'lib32-vmaf'
  'lib32-vulkan-icd-loader'
  'lib32-xz'
  'lib32-zlib'
)
makedepends=(
#  'avisynthplus'
  'amf-headers'
  'lib32-clang'
  'ffnvcodec-headers'
#  'lib32-frei0r-plugins'
  'git'
  'lib32-ladspa'
  'lib32-mesa'
#  'lib32-zeromq'
  'nasm'
  'opencl-headers'
  'vulkan-headers'
)
optdepends=(
#  'avisynthplus: AviSynthPlus support'
#  'frei0r-plugins: Frei0r video effects support'
#  'intel-media-sdk: Intel QuickSync support (legacy)'
  'lib32-ladspa: LADSPA filters'
  'lib32-nvidia-utils: Nvidia NVDEC/NVENC support'
#  'onevpl-intel-gpu: Intel QuickSync support'
#  'vapoursynth: VapourSynth support'
)
provides=(
  'libavcodec.so'
  'libavdevice.so'
  'libavfilter.so'
  'libavformat.so'
  'libavutil.so'
  'libpostproc.so'
  'libswresample.so'
  'libswscale.so'
)
options=(
#  debug
)
_tag=a18b979d17fa169a6f93c5be8732533c8e06337d
source=(
  "git+https://git.ffmpeg.org/ffmpeg.git?signed#tag=${_tag}"
  "add-av_stream_get_first_dts-for-chromium.patch"
)
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')
b2sums=(
  'bcc0fb367d2822665f0918292a0cf581e0119d6ba6d2e3d0b6e794b6f74d30c118b5c47e26b5687473f01b346f8ec7e885f80729ce6115e18003b2371ff4553f'
  '555274228e09a233d92beb365d413ff5c718a782008075552cafb2130a3783cf976b51dfe4513c15777fb6e8397a34122d475080f2c4483e8feea5c0d878e6de'
)
validpgpkeys=(DD1EC9E8DE085C629B3E1846B18E8928B3948D64) # Michael Niedermayer <michael@niedermayer.cc>

prepare() {
  cd ${_pkgbasename}

  # Patching if needed
  patch -Np1 -i "${srcdir}"/add-av_stream_get_first_dts-for-chromium.patch  # https://crbug.com/1251779

  # Fix VAAPI AV1 performance with Mesa
  git cherry-pick -n fe9d889dcd79ea18d4dfaa39df4ddbd4c8c3b15c
  git cherry-pick -n d2d911eb9a2fc6eb8d86b3ae025a56c1a2692fba

}

pkgver() {
  cd ${_pkgbasename}
  git describe --tags | sed 's/^n//'
}

build() {
#  export PKG_CONFIG_PATH='/usr/lib32/mbedtls2/pkgconfig'
  export CFLAGS="${CFLAGS} -Wno-error=incompatible-pointer-types -Wno-error=int-conversion"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbasename}

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
    --enable-libharfbuzz \
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
    --enable-libiec61883 \
    --enable-libjack \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore-amrnb \
    --enable-libopencore-amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libplacebo \
    --enable-libpulse \
    --enable-librav1e \
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
    --enable-libzimg \
    --enable-nvenc \
    --enable-nvdec \
    --enable-opencl \
    --enable-opengl \
    --enable-shared \
    --enable-version3 \
    --enable-vulkan \
    --disable-doc

## not available under 32 bit
#    --enable-avisynth \
#    --enable-frei0r \
#    --enable-libjxl \
#    --enable-libopenh264
#    --enable-libopenmpt \
#    --enable-librubberband \
#    --enable-libsnappy \
#    --enable-libsoxr \
#    --enable-libssh \
#    --enable-libsvtav1 
#    --enable-libuavs3d
#    --enable-libvidstab \
#    --enable-libvpl \
#    --enable-vapoursynth \
#    --enable-libzmq \

  make
}

package_lib32-ffmpeg() {
  make DESTDIR="${pkgdir}" -C ffmpeg install

  # Keep files in bin since this is not a library only package. 
  # Use the same naming scheme as proposed in Arch's wiki:  https://wiki.archlinux.org/index.php/32-bit_package_guidelines
  # which is "--program-suffix="-32" with Autoconf
  for i in "${pkgdir}/usr/bin/"*; do
    mv "$i" "$i"-32
  done

  rm -r "${pkgdir}"/usr/{include,share}
}