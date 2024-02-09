# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

## About ffmpeg-obs
# OBS Project actually patch FFmpeg to fix some issues and also add RIST support starting from 27.2.
# So I created ffmpeg-obs, a ffmpeg package that ensure that you have those.
# I really wanted to not do this but some fixes are needed, so I did my best to add those "feature-set options".
# They allow you to build ffmpeg with feature-set based on other ffmpeg packages from AUR.

### Feature-set options
### WARNING: There is no arch check so don't enable one without knowing if the feature-set is compatible with your arch.
### The license could change to nonfree for some options.
### NOTE: Some AUR helper may not like to change it just before building, so you can set those variables in your makepkg config.
### Related wiki page: https://wiki.archlinux.org/title/Makepkg#Configuration

## Add changes from ffmpeg-full
## Enable everything except CUDA changes (enable it manually if you want it)
if [[ -z "$FFMPEG_OBS_FULL" ]]; then
  FFMPEG_OBS_FULL=OFF
fi

## Based on changes from ffmpeg-cuda
## If 'ON', CUDA compilation is made with Nvidia CUDA Compiler, this is what ffmpeg-cuda provides. (nonfree option)
## If 'OFF', CUDA compilation is made with clang (without cuda package), this is what upstream package provides.
if [[ -z "$FFMPEG_OBS_CUDA" ]]; then
  FFMPEG_OBS_CUDA=OFF
fi

## Enable debugging symbols
if [[ -z "$FFMPEG_OBS_DEBUG" ]]; then
  FFMPEG_OBS_DEBUG=OFF
fi

## Add changes from ffmpeg-decklink (nonfree option)
if [[ -z "$FFMPEG_OBS_DECKLINK" ]]; then
  FFMPEG_OBS_DECKLINK=OFF
fi

## Add changes from ffmpeg-libfdk_aac (nonfree option)
if [[ -z "$FFMPEG_OBS_LIBFDK_AAC" ]]; then
  FFMPEG_OBS_LIBFDK_AAC=OFF
fi

## Add SVT related changes from ffmpeg-full because ffmpeg-svt is out of date
if [[ -z "$FFMPEG_OBS_SVT" ]]; then
  FFMPEG_OBS_SVT=OFF
fi

## Add changes from ffmpeg-vulkan (now only enables libglslang since vulkan is enabled upstream)
if [[ -z "$FFMPEG_OBS_VULKAN" ]]; then
  FFMPEG_OBS_VULKAN=OFF
fi

pkgname=ffmpeg-obs
pkgver=6.1.1
pkgrel=6
pkgdesc='Complete solution to record, convert and stream audio and video with fixes for OBS Studio. And various options in the PKGBUILD'
arch=('x86_64' 'aarch64')
url=https://ffmpeg.org/
license=(GPL-3.0-only)
# To manage dependency rebuild easily, this will prevent you to rebuild FFmpeg on non-updated system
# Only for default set of features
_aomver=3
_dav1dver=1.3.0
_ffnvcodecver=12.0.16.0
_libjxlver=0.9.0
_libplacebover=6
_libristver=0.2.7
_libvpxver=1.14
_rav1ever=0.7.1
_srtver=1.5
_svtav1ver=1.7
_vidstabver=1.1.1
_vmafver=3
_vulkanver=1.3.240
_x264ver=0.164
_x265ver=3.5
depends=(
  "aom>=$_aomver"
  "srt>=$_srtver"
  alsa-lib
  bzip2
  "dav1d>=$_dav1dver"
  cairo
  fontconfig
  fribidi
  glib2
  glibc
  gmp
  gnutls
  gsm
  jack
  lame
  libass
  libavc1394
  libbluray
  libbs2b
  libdrm
  freetype2
  libgl
  harfbuzz
  libiec61883
  "libjxl>=$_libjxlver"
  libmodplug
  libopenmpt
  "libplacebo>=$_libplacebover"
  libpulse
  libraw1394
  librsvg
  rubberband
  libsoxr
  libssh
  libtheora
  libva
  libvdpau
  "vid.stab>=$_vidstabver"
  libvorbis
  libvpl
  "libvpx>=$_libvpxver"
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
  "rav1e>=$_rav1ever"
  sdl2
  snappy
  speex
  v4l-utils
  vapoursynth
  vulkan-icd-loader
  "x264>=$_x264ver"
  "x265>=$_x265ver"
  xvidcore
  xz
  zimg
  zlib
)
makedepends=(
  git
  perl
  amf-headers
  avisynthplus
  clang
  "ffnvcodec-headers>=$_ffnvcodecver"
  frei0r-plugins
  ladspa
  mesa
  nasm
  opencl-headers
  "vulkan-headers>=$_vulkanver"
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
  "ffmpeg=$pkgver"
  libavcodec.so
  libavdevice.so
  libavfilter.so
  libavformat.so
  libavutil.so
  libpostproc.so
  libswresample.so
  libswscale.so
)
conflicts=(ffmpeg)
_tag=e38092ef9395d7049f871ef4d5411eb410e283e0
_deps_tag=2023-11-03
source=(
  "ffmpeg::git+https://git.ffmpeg.org/ffmpeg.git#tag=${_tag}"
  "obs-deps::git+https://github.com/obsproject/obs-deps.git#tag=${_deps_tag}"
  "add-av_stream_get_first_dts-for-chromium.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  '1027369d704834588f09f1854541584444dda4f8c6407f83fec090d80e6e6ad2'
)

if [[ $FFMPEG_OBS_FULL == 'ON' ]]; then
  FFMPEG_OBS_DECKLINK=ON
  FFMPEG_OBS_LIBFDK_AAC=ON
  FFMPEG_OBS_SVT=ON
  FFMPEG_OBS_VULKAN=ON
fi

### Prepare configure and dependencies
## Add upstream common args and feature
_args=(
  --prefix=/usr
  --disable-static
  --disable-stripping
  --enable-amf
  --enable-avisynth
  --enable-libfontconfig
  --enable-fontconfig
  --enable-gmp
  --enable-gnutls
  --enable-gpl
  --enable-ladspa
  --enable-libaom
  --enable-libass
  --enable-libbluray
  --enable-libbs2b
  --enable-libdav1d
  --enable-libdrm
  --enable-libfreetype
  --enable-libfribidi
  --enable-libgsm
  --enable-libharfbuzz
  --enable-libiec61883
  --enable-libjack
  --enable-libjxl
  --enable-libmodplug
  --enable-libmp3lame
  --enable-libopencore_amrnb
  --enable-libopencore_amrwb
  --enable-libopenjpeg
  --enable-libopenmpt
  --enable-libopus
  --enable-libplacebo
  --enable-libpulse
  --enable-librav1e
  --enable-librsvg
  --enable-librubberband
  --enable-libsnappy
  --enable-libsoxr
  --enable-libspeex
  --enable-libsrt
  --enable-libssh
  --enable-libtheora
  --enable-libv4l2
  --enable-libvidstab
  --enable-libvorbis
  --enable-libvpl
  --enable-libvpx
  --enable-libwebp
  --enable-libx264
  --enable-libx265
  --enable-libxcb
  --enable-libxml2
  --enable-libxvid
  --enable-libzimg
  --enable-nvdec
  --enable-nvenc
  --enable-opencl
  --enable-opengl
  --enable-shared
  --enable-vapoursynth
  --enable-version3
  --enable-vulkan
)

## Force enable autodetect feature built with upstream
_args+=(
  --enable-alsa
  --enable-bzlib
  --enable-iconv
  --enable-libxcb-shm
  --enable-libxcb-xfixes
  --enable-libxcb-shape
  --enable-lzma
  --enable-sdl2
  --enable-xlib
  --enable-zlib
  --enable-ffnvcodec
  --enable-nvdec
  --enable-nvenc
  --enable-v4l2-m2m
  --enable-vaapi
  --enable-vdpau
)

## Add OBS Studio needed feature
depends+=("librist>=$_libristver")
_args+=(--enable-librist)

## Add upstream feature for x86_64 build
if [[ $CARCH == 'x86_64' ]]; then
  _args+=(--enable-lto --enable-libsvtav1)
  depends+=("svt-av1>=$_svtav1ver")
else
  _args+=(--disable-lto)
fi

## Add upstream feature for i686 and x86_64 build
if [[ $CARCH == "i686" || $CARCH == "x86_64" ]]; then
  _args+=(--enable-libvmaf)
  depends+=("vmaf>=$_vmafver")
fi

## Add args for aarch64 build
if [[ $CARCH == 'aarch64' ]]; then
  _args+=(--host-cflags=-fPIC)
fi

## Check feature-set options
_nonfree_enabled=OFF

if [[ $FFMPEG_OBS_CUDA == 'ON' ]]; then
  _nonfree_enabled=ON
  depends+=(cuda)
  _args+=(--enable-cuda-nvcc --enable-libnpp --enable-cuvid --disable-cuda-llvm)
  provides+=(ffmpeg-cuda)
else
  _args+=(--enable-cuda-llvm --disable-cuvid)
fi

if [[ $FFMPEG_OBS_DEBUG == 'ON' ]]; then
  _args+=(--enable-debug)
else
  _args+=(--disable-debug)
fi

if [[ $FFMPEG_OBS_DECKLINK == 'ON' ]]; then
  _nonfree_enabled=ON
  makedepends+=('decklink-sdk')
  _args+=(--enable-decklink)
  provides+=(ffmpeg-decklink)
fi

if [[ $FFMPEG_OBS_LIBFDK_AAC == 'ON' ]]; then
  _nonfree_enabled=ON
  depends+=(libfdk-aac)
  _args+=(--enable-libfdk-aac)
  provides+=(ffmpeg-libfdk_aac)
fi

if [[ $FFMPEG_OBS_SVT == 'ON' ]]; then
  depends+=(svt-hevc svt-vp9)
  _svt_hevc_ver='6cca5b932623d3a1953b165ae6b093ca1325ac44'
  _svt_vp9_ver='43ef8e5e96932421858762392adbbab57c84aebf'
  source+=(
    "020-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/master-0001-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch"
    "030-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
    "040-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-VP9/${_svt_vp9_ver}/ffmpeg_plugin/master-0001-Add-ability-for-ffmpeg-to-run-svt-vp9.patch"
  )
  sha256sums+=(
    'e8fdc940474f3819b9a8d30cab8164774584c051322acb6194bcb03d56e8175a'
    'a164ebdc4d281352bf7ad1b179aae4aeb33f1191c444bed96cb8ab333c046f81'
    '0433016c8523c7ce159523946a76c8fa06a926f33f94b70e8de7c2082d14178c'
  )
  _args+=(--enable-libsvthevc --enable-libsvtvp9)
  provides+=(ffmpeg-svt-hevc ffmpeg-svt-vp9)
fi

if [[ $FFMPEG_OBS_VULKAN == 'ON' ]]; then
  depends+=(glslang spirv-tools)
  _args+=(--enable-libglslang)
  provides+=(ffmpeg-vulkan)
fi

if [[ $FFMPEG_OBS_FULL == 'ON' ]]; then
  _nonfree_enabled=ON
  # uavs3d >= 1.1.41 is required by ffmpeg so switch to uavs3d-git
  # lensfun >= 0.3.95 seems to needed with ffmpeg so switch to lensfun-git
  depends+=(
    sndio 'chromaprint-fftw' libgcrypt
    aribb24 libcaca 'celt' libcdio-paranoia codec2
    'davs2' libdc1394 flite1 libgme libilbc 'libklvanc'
    kvazaar 'lensfun-git' 'openh264' librabbitmq-c
    rtmpdump 'shine' smbclient tesseract
    twolame 'uavs3d-git' 'vo-amrwbenc' 'xavs' 'xavs2' zeromq
    zvbi lv2 lilv libmysofa openal
    libomxil-bellagio 'rockchip-mpp' #'pocketsphinx'
    lcms2 libraw1394 openvino libaribcaption opencv2
  )
  _args+=(
    --enable-sndio --disable-rpath --enable-gray --enable-chromaprint --enable-gcrypt
    --enable-libaribb24 --enable-libcaca --enable-libcelt --enable-libcdio --enable-libcodec2
    --enable-libdavs2 --enable-libdc1394 --enable-libflite --enable-libgme --enable-libilbc --enable-libklvanc
    --enable-libkvazaar --enable-liblensfun --enable-libopenh264 --enable-librabbitmq
    --enable-librtmp --enable-libshine --enable-libsmbclient --enable-libtesseract
    --enable-libtwolame --enable-libuavs3d --enable-libvo-amrwbenc --enable-libxavs --enable-libxavs2 --enable-libzmq
    --enable-libzvbi --enable-lv2 --enable-libmysofa --enable-openal
    --enable-omx --enable-rkmpp #--enable-pocketsphinx
    --enable-lcms2 --enable-libopenvino --enable-libaribcaption --enable-libopencv
  )
  provides+=(ffmpeg-full)
else
  _args+=(--disable-sndio) # sndio is not present when upstream package is built
fi

## Manage extra flags
if [[ $FFMPEG_OBS_CUDA == 'ON' ]]; then
  _args+=(--extra-cflags='-I/opt/cuda/include')
  _args+=(--extra-ldflags='-L/opt/cuda/lib64')
fi

## Check if nonfree licence is enabled
if [[ $_nonfree_enabled == 'ON' ]]; then
  license=('custom: nonfree and unredistributable')
  source+=("license_if_nonfree_enabled.txt")
  sha256sums+=("04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36")
  _args+=(--enable-nonfree)
fi

prepare() {
  cd ffmpeg

  ### ffmpeg-full changes

  ## Fix segfault with avisynthplus
  sed -i 's/RTLD_LOCAL/RTLD_DEEPBIND/g' libavformat/avisynth.c

  if [[ $FFMPEG_OBS_FULL == 'ON' ]]; then
    # Fix lensfun detection
    git cherry-pick -n e1c1dc8347f13104bc21e4100fcf4d4dddf5e5d8
  fi

  ### Arch Linux changes

  ## https://crbug.com/1251779
  patch -Np1 -i "${srcdir}"/add-av_stream_get_first_dts-for-chromium.patch

  ### OBS changes

  ## Patch for FFmpeg from obs-deps repository

  # This patch applies:
  #  - Fix decoding of certain malformed FLV files
  #  - Add additional CPU levels for libaom
  patch -Np1 -i "${srcdir}"/obs-deps/deps.ffmpeg/patches/FFmpeg/0001-flvdec-handle-unknown.patch
  patch -Np1 -i "${srcdir}"/obs-deps/deps.ffmpeg/patches/FFmpeg/0002-libaomenc-presets.patch

  ### Package features changes

  ## SVT changes if enabled
  if [[ $FFMPEG_OBS_SVT == 'ON' ]]; then
    rm -f "libavcodec/"libsvt_{hevc,vp9}.c
    patch -Np1 -i "${srcdir}/020-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"
    patch -Np1 -i "${srcdir}/030-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    patch -Np1 -i "${srcdir}/040-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"
  fi
}

build() {
  cd ffmpeg

  if [[ $FFMPEG_OBS_FULL == 'ON' ]]; then
    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+${PKG_CONFIG_PATH}:}/opt/intel/openvino/runtime/lib/intel64/pkgconfig"
  fi

  ./configure "${_args[@]}"

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

package() {
  make DESTDIR="${pkgdir}" -C ffmpeg install install-man
  install -Dm 755 ffmpeg/tools/qt-faststart "${pkgdir}"/usr/bin/

  if [[ $_nonfree_enabled == 'ON' ]]; then
    install -D -m644 license_if_nonfree_enabled.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
