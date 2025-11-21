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
pkgver=8.0.1
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video with fixes for OBS Studio. And various options in the PKGBUILD'
arch=('x86_64' 'aarch64')
url=https://ffmpeg.org/
license=(GPL-3.0-only)
# To manage dependency rebuild easily, this will prevent you to rebuild FFmpeg on non-updated system
# Only for default set of features
_aomver=3
_dav1dver=1.3.0
_ffnvcodecver=12.2
_glslangver=1.4.328
_libjxlver=0.11.0
_libplacebover=7.351
_libristver=0.2.7
_libtheoraver=1.2
_libvpxver=1.15.2
_libxml2ver=2.14
_rav1ever=0.8.1
_rubberbandver=4
_srtver=1.5
_svtav1ver=3
_vidstabver=1.1.1
_vmafver=3
_vulkanver=1.3.279
_x264ver=0.164
_x265ver=4.1
depends=(
  "aom>=$_aomver"
  "srt>=$_srtver"
  alsa-lib
  bzip2
  cairo
  "dav1d>=$_dav1dver"
  fontconfig
  freetype2
  fribidi
  glib2
  glibc
  "glslang>=$_glslangver"
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
  "libjxl>=$_libjxlver"
  libmodplug
  libopenmpt
  "libplacebo>=$_libplacebover"
  libpulse
  libraw1394
  librsvg
  libsoxr
  libssh
  "libtheora>=$_libtheoraver"
  libva
  libvdpau
  libvorbis
  libvpl
  "libvpx>=$_libvpxver"
  libwebp
  libx11
  libxcb
  libxext
  "libxml2>=$_libxml2ver"
  libxv
  ocl-icd
  opencore-amr
  openjpeg2
  opus
  "rav1e>=$_rav1ever"
  "rubberband>=$_rubberbandver"
  sdl2
  snappy
  speex
  v4l-utils
  vapoursynth
  "vid.stab>=$_vidstabver"
  vulkan-icd-loader
  "x264>=$_x264ver"
  "x265>=$_x265ver"
  xvidcore
  xz
  zeromq
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
  'ladspa: LADSPA filters'
  'nvidia-utils: Nvidia NVDEC/NVENC support'
  'vpl-runtime: Intel QuickSync support'
)
provides=(
  "ffmpeg=$pkgver"
  libavcodec.so
  libavdevice.so
  libavfilter.so
  libavformat.so
  libavutil.so
  libswresample.so
  libswscale.so
)
conflicts=(ffmpeg)
_tag=894da5ca7d742e4429ffb2af534fcda0103ef593
_deps_tag=2024-09-12
source=(
  "ffmpeg-src::git+https://code.ffmpeg.org/FFmpeg/FFmpeg.git#tag=${_tag}"
  "obs-deps::git+https://github.com/obsproject/obs-deps.git#tag=${_deps_tag}"
  "0001-Add-av_stream_get_first_dts-for-Chromium.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'f865d677f8ad39c79dde69186629cb6468c2b289c4156dbb8dec8e68b0131b40'
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
  --enable-libdvdnav
  --enable-libdvdread
  --enable-libfreetype
  --enable-libfribidi
  --enable-libglslang
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
  --enable-libzmq
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
if [[  ${CARCH/%_v?/} == "x86_64" ]]; then
  _args+=(--enable-lto --enable-libsvtav1)
  depends+=("svt-av1>=$_svtav1ver")
else
  _args+=(--disable-lto)
fi

## Add upstream feature for i686 and x86_64 build
if [[ $CARCH == "i686" ||  ${CARCH/%_v?/} == "x86_64" ]]; then
  _args+=(--enable-libvmaf)
  depends+=("vmaf>=$_vmafver")
fi

## Add args for aarch64 build
if [[ $CARCH == 'aarch64' ]]; then
  _args+=(--host-cflags=-fPIC)
fi

## Check feature-set options
_nonfree_enabled=OFF
_add_gcc_libs_as_deps=OFF

if [[ $FFMPEG_OBS_CUDA == 'ON' ]]; then
  _nonfree_enabled=ON
  makedepends+=(cuda)
  _args+=(--enable-cuda-nvcc --disable-libnpp --enable-cuvid --disable-cuda-llvm)
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
  _add_gcc_libs_as_deps=ON
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
  makedepends+=(patchutils)
  _svt_hevc_ver='ed80959ebb5586aa7763c91a397d44be1798587c'
  source+=(
    "010-ffmpeg-add-svt-hevc.patch"
    "020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
    "030-ffmpeg-add-svt-vp9.patch"
  )
  sha256sums+=(
    '4b1053cc01244c79e3b23dc696eaff1aeb0627a2098e1a720a025d4ad75b5c16'
    'a164ebdc4d281352bf7ad1b179aae4aeb33f1191c444bed96cb8ab333c046f81'
    'da01eb3ca31d35d23257760875e14bed808b3fea02f290028adaed76062125a0'
  )
  _args+=(--enable-libsvthevc --enable-libsvtvp9)
  provides+=(ffmpeg-svt-hevc ffmpeg-svt-vp9)
fi

if [[ $FFMPEG_OBS_VULKAN == 'ON' ]]; then
  depends+=(spirv-tools)
  _args+=(--disable-libshaderc)
  provides+=(ffmpeg-vulkan)
fi

if [[ $FFMPEG_OBS_FULL == 'ON' ]]; then
  _nonfree_enabled=ON
  _add_gcc_libs_as_deps=ON
  depends+=(
    aribb24
    'celt'
    'chromaprint-fftw'
    codec2
    'davs2'
    flite1
    kvazaar
    lcms2
    'lensfun-git' # lensfun >= 0.3.95 seems to needed with ffmpeg so switch to lensfun-git
    'libaribcaption'
    libcaca
    libcdio-paranoia
    'lcevcdec'
    libdc1394
    libgcrypt
    libgme
    libilbc
    'libklvanc'
    liblc3
    libmysofa
    libomxil-bellagio
    librabbitmq-c
    libraw1394
    lilv
    lv2
    openal
    'openapv'
    opencv
    openh264
    'openvino'
    #'pocketsphinx'
    qrencode
    'quirc'
    'rockchip-mpp'
    rtmpdump
    'shine'
    smbclient
    sndio
    tesseract
    twolame
    'uavs3d-git' # uavs3d >= 1.1.41 is required by ffmpeg so switch to uavs3d-git
    'vvenc'
    'vo-amrwbenc'
    'xavs'
    'xavs2'
    'xevd'
    'xeve'
    zvbi
  )
  makedepends+=(patchutils)
  _args+=(
    --disable-rpath
    --enable-sndio 
    --enable-chromaprint
    --enable-gcrypt
    --enable-gray
    --enable-lcms2
    --enable-libaribb24
    --enable-libaribcaption
    --enable-libcaca
    --enable-libcelt
    --enable-libcdio
    --enable-libcodec2
    --enable-libdavs2
    --enable-libdc1394
    --enable-libflite
    --enable-libgme
    --enable-libilbc
    --enable-libklvanc
    --enable-libkvazaar
    --enable-liblc3
    --enable-liblcevc-dec
    --enable-liblensfun
    --enable-libmysofa
    --enable-liboapv
    --enable-libopenh264
    --enable-libopencv
    --enable-libopenvino
    --enable-libqrencode
    --enable-libquirc
    --enable-librabbitmq
    --enable-librtmp
    --enable-libshine
    --enable-libsmbclient
    --enable-libtesseract
    --disable-libtorch
    --enable-libtwolame
    --enable-libuavs3d
    --enable-libvo-amrwbenc
    --enable-libvvenc
    --enable-libxavs
    --enable-libxavs2
    --enable-libxevd
    --enable-libxeve
    --enable-libzmq
    --enable-libzvbi
    --enable-lv2
    --disable-ohcodec
    --enable-openal
    --enable-omx
    --disable-pocketsphinx
    --enable-rkmpp
    --disable-whisper # whisper.cpp conflicts with imagemagick
  )
  provides+=(ffmpeg-full)
else
  _args+=(--disable-sndio) # sndio is not present when upstream package is built
fi

if [[ $_add_gcc_libs_as_deps == 'ON' ]]; then
  depends+=(gcc-libs)
fi

## Check if nonfree licence is enabled
if [[ $_nonfree_enabled == 'ON' ]]; then
  license=('LicenseRef-nonfree-and-unredistributable')
  source+=("license_if_nonfree_enabled.txt")
  sha256sums+=("04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36")
  _args+=(--enable-nonfree)
fi

prepare() {
  cd ffmpeg-src

  if [[ $FFMPEG_OBS_FULL == 'ON' ]]; then
    git cherry-pick -n c4ce51ee62205c74604767f1b7dab6a036edac7f
  fi

  ### ffmpeg-obs changes

  ### Arch Linux changes

  ## https://crbug.com/1251779
  patch -Np1 -i "${srcdir}"/0001-Add-av_stream_get_first_dts-for-Chromium.patch

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
    rm -f libavcodec/libsvt_{hevc,vp9}.c
    patch -Np1 -i "${srcdir}/010-ffmpeg-add-svt-hevc.patch"
    patch -Np1 -i "${srcdir}/020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    patch -Np1 -i "${srcdir}/030-ffmpeg-add-svt-vp9.patch"
  fi

  if [[ $FFMPEG_OBS_CUDA == 'ON' ]]; then
    sed -i 's/nvccflags -std=c++11/nvccflags -std=c++14/g' configure
    sed -i 's/arch=compute_60,code=sm_60/arch=compute_75,code=sm_75/g' configure
  fi

  if [[ $FFMPEG_OBS_DECKLINK == 'ON' ]]; then
    ## Fix HAVE_PTHREAD_SETNAME_NP redefinition with SDL2 and the threads option
    sed -i 's/pthread_set/ffmpeg_pthread_set/g' configure
    sed -i 's/HAVE_PTHREAD_SET/HAVE_FFMPEG_PTHREAD_SET/g' libavutil/thread.h

    sed -i 's|DeckLinkAPI.h|DeckLinkAPI_v14_2_1.h|g' \
      libavdevice/decklink_common_c.h \
      libavdevice/decklink_common.cpp \
      libavdevice/decklink_enc.cpp \
      libavdevice/decklink_dec.cpp
    sed -i 's|DeckLinkAPIDispatch.cpp|DeckLinkAPIDispatch_v14_2_1.cpp|g' libavdevice/decklink_common.cpp

    sed -i 's|CreateDeckLinkIteratorInstance|CreateDeckLinkIteratorInstance_v14_2_1|g' libavdevice/decklink_common.cpp
    sed -i 's|CreateDeckLinkAPIInformationInstance|CreateDeckLinkAPIInformationInstance_v14_2_1|g' libavdevice/decklink_common.cpp

    sed -i 's|IDeckLinkMemoryAllocator|IDeckLinkMemoryAllocator_v14_2_1|g' libavdevice/decklink_dec.cpp
    sed -i 's|IDeckLinkInput \*|IDeckLinkInput_v14_2_1 \*|g' \
      libavdevice/decklink_common.h \
      libavdevice/decklink_common.cpp
    sed -i 's|IDeckLinkInput,|IDeckLinkInput_v14_2_1,|g' libavdevice/decklink_dec.cpp
    sed -i 's|IDeckLinkInputCallback|IDeckLinkInputCallback_v14_2_1|g' libavdevice/decklink_dec.cpp
    sed -i 's|IDeckLinkVideoInputFrame|IDeckLinkVideoInputFrame_v14_2_1|g' libavdevice/decklink_dec.cpp
  fi
}

build() {
  cd ffmpeg-src

  ## Manage extra flags and paths
  if [[ $FFMPEG_OBS_CUDA == 'ON' ]]; then
    export CFLAGS+=' -isystem/opt/cuda/include'
    export LDFLAGS+=' -L/opt/cuda/lib64'
  fi

  if [[ $FFMPEG_OBS_FULL == 'ON' ]]; then
    export PKG_CONFIG_PATH="/usr/lib/lensfun2/pkgconfig${PKG_CONFIG_PATH:+":${PKG_CONFIG_PATH}"}"
    export CFLAGS+=' -Wno-error=incompatible-pointer-types'
  fi

  ./configure "${_args[@]}"

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

package() {
  make DESTDIR="${pkgdir}" -C ffmpeg-src install install-man
  install -Dm 755 ffmpeg-src/tools/qt-faststart "${pkgdir}"/usr/bin/

  if [[ $_nonfree_enabled == 'ON' ]]; then
    install -D -m644 license_if_nonfree_enabled.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
