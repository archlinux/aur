# Maintainer Denis Benato <benato dot denis96 [at] gmail dot com>
# Original (ffmpeg-amd-full): Nathaniel Chin <thegamingorangutans+aur at gmail.com>
# Original (ffmpeg-full): Daniel Bermond <dbermond@archlinux.org> > https://aur.archlinux.org/packages/ffmpeg-full
# Contributor: Marko Korhonen <reekymarko at reekynet.com>
# Contributor: Bruno Filipe < gmail-com: bmilreu >

pkgname=ffmpeg-nonvidia
pkgver=6.0
pkgrel=1
epoch=2
pkgdesc='Complete solution to record, convert and stream audio and video. Almost everything non-nVidia related is enabled. Started as a clone of ffmpeg-amd-full.'
arch=(x86_64)
url=https://ffmpeg.org/
license=(GPL3)

# 'pocketsphinx' actually disabled: ffmpeg does not support the new version 5.0.0
depends=(
  alsa-lib
  aom
  bzip2
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
  libopenmpt.so
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
  aribb24
  avisynthplus
  celt
  codec2
  freetype2
  glslang
  frei0r-plugins
  kvazaar
  ladspa
  lcms2
  lensfun-git
  libbluray
  libcaca
  libcdio-paranoia
  libdc1394
  libfdk-aac
  libgme
  libgcrypt
  libilbc
  libjxl
  libmodplug
  libmysofa
  libomxil-bellagio
  libplacebo
  lilv
  lv2
  openal
  openh264
  openjpeg2
  rubberband
  rtmpdump
  sdl2
  smbclient
  snappy
  sndio
  spirv-tools
  srt
  svt-hevc
  svt-vp9
  tesseract
  twolame
  vapoursynth
  vulkan-icd-loader
  zeromq
  zimg
  zvbi
  chromaprint-fftw
  davs2
  flite1
  libklvanc-git
  librist
  shine
  uavs3d-git
  vo-amrwbenc
  xavs
  xavs2
  decklink-sdk
  librabbitmq-c
)
makedepends=(
  amf-headers
  avisynthplus
  clang
  git
  ladspa
  mesa
  nasm
  opencl-headers
  vulkan-headers
)
optdepends=(
  'intel-media-sdk: Intel QuickSync support'
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
  ffmpeg-full
)

#options=(
#  debug
#)
conflicts=('ffmpeg')
_tag=3949db4d261748a9f34358a388ee255ad1a7f0c0
_svt_hevc_ver='eb24a06ba4ee4948f219a3246b88439a8090bd37'
_svt_vp9_ver='aaa8140c8cdf6c073eaa6aaa5d003d1535fd0059'
source=(
    git+https://git.ffmpeg.org/ffmpeg.git?signed#tag=${_tag}
    "010-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/master-0001-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch"
    "030-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-VP9/${_svt_vp9_ver}/ffmpeg_plugin/master-0001-Add-ability-for-ffmpeg-to-run-svt-vp9.patch"
    "040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
    "060-ffmpeg-fix-segfault-with-avisynthplus.patch"
    "LICENSE"
)
sha256sums=(
    'SKIP'
    'e8fdc940474f3819b9a8d30cab8164774584c051322acb6194bcb03d56e8175a'
    'd8b91ea5f07d0208cbe0290567083808708014a1953fda322d13cb619349c9ee'
    '2df82046908015bf26bc1303275cf52ba01fa380029a54ea6415373e389e423c'
    'b1d68f626168f2409a4b0987acf5b208e7ced2ddab49b11990a10f458d377e9a'
    '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36'
)

validpgpkeys=(
    'DD1EC9E8DE085C629B3E1846B18E8928B3948D64' # Michael Niedermayer <michael@niedermayer.cc>
    'FCF986EA15E6E293A5644F10B4322F04D67658D8'
)

prepare() {
    cd ffmpeg
    rm -f "libavcodec/"libsvt_{hevc,vp9}.c
    patch -Np1 -i "${srcdir}/010-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"
    patch -Np1 -i "${srcdir}/030-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"
    patch -Np1 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch" # https://crbug.com/1251779
    patch -Np1 -i "${srcdir}/060-ffmpeg-fix-segfault-with-avisynthplus.patch"
}

pkgver() {
  cd ffmpeg
  git describe --tags | sed 's/^n//'
}

build() {
  cd ffmpeg
  
  export CC="gcc" # not compiling with clang...
  export CXX="g++" # same as above
  export CFLAGS="-march=native -O2 -pipe -fno-plt -fexceptions \
        -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security \
        -fstack-clash-protection -fcf-protection -Wno-error=restrict"
  export CXXFLAGS="$CFLAGS -Wp,-D_GLIBCXX_ASSERTIONS"
  export LDFLAGS="-Wl,-O2,--sort-common,--as-needed,-z,relro,-z,now"

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-nonfree \
    --enable-amf \
    --enable-avisynth \
    --enable-lto \
    --enable-fontconfig \
    --enable-gmp \
    --enable-gcrypt \
    --enable-gnutls \
    --enable-gpl \
    --enable-ladspa \
    --enable-lcms2 \
    --enable-libaom \
    --enable-libaribb24 \
    --enable-libass \
    --enable-libbluray \
    --enable-libbs2b \
    --enable-libcaca \
    --enable-libcelt \
    --enable-libcdio \
    --enable-libcodec2 \
    --enable-libdav1d \
    --enable-libdavs2 \
    --enable-libdc1394 \
    --enable-libfdk-aac \
    --enable-libglslang \
    --enable-libilbc \
    --enable-libgme \
    --enable-libflite \
    --enable-libdrm \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libjack \
    --enable-libmfx \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --disable-libopencv \
    --enable-libopenh264 \
    --enable-libopenjpeg \
    --enable-libopenmpt \
    --enable-libopus \
    --enable-libpulse \
    --enable-librav1e \
    --enable-librist \
    --enable-librsvg \
    --enable-librubberband \
    --enable-librtmp  \
    --enable-libshine \
    --enable-libsmbclient \
    --enable-libsnappy \
    --enable-libmysofa \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-librabbitmq \
    --enable-libsrt \
    --enable-libssh \
    --enable-libsvtav1 \
    --enable-libsvthevc \
    --enable-libsvtvp9 \
    --disable-libtensorflow \
    --enable-libtesseract \
    --enable-libtheora \
    --disable-libtls \
    --enable-libtwolame \
    --enable-libuavs3d \
    --enable-iconv \
    --enable-libv4l2 \
    --enable-v4l2-m2m \
    --enable-libvidstab \
    --enable-libvmaf \
    --enable-libvo-amrwbenc \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxavs \
    --enable-libxavs2 \
    --enable-libxcb \
    --enable-libxml2 \
    --enable-libxcb-shm \
    --enable-libxcb-xfixes \
    --enable-libxcb-shape \
    --enable-libxvid \
    --enable-libzimg \
    --enable-libzmq \
    --enable-libzvbi \
    --enable-openal \
    --enable-opencl \
    --enable-opengl \
    --enable-shared \
    --enable-version3 \
    --enable-vulkan \
    --enable-libjxl \
    --enable-libklvanc \
    --enable-libkvazaar \
    --enable-liblensfun \
    --enable-libmodplug \
    --enable-sdl2 \
    --enable-vapoursynth \
    --enable-libplacebo \
    --enable-lv2 \
    --enable-lzma \
    --disable-decklink \
    --enable-sndio \
    --enable-xlib \
    --enable-libpulse \
    --enable-omx \
    --enable-vdpau \
    --enable-vaapi \
    --disable-cuda-nvcc \
    --disable-cuda-llvm \
    --disable-cuvid \
    --disable-ffnvcodec \
    --disable-libmfx \
    --disable-libnpp \
    --disable-nvdec \
    --disable-nvenc \
    --disable-rkmpp \
    --disable-libopenvino
  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

package() {
  make DESTDIR="${pkgdir}" -C ffmpeg install install-man
  install -Dm 755 ffmpeg/tools/qt-faststart "${pkgdir}"/usr/bin/
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et: