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
pkgver=7.1.1
pkgrel=5
pkgdesc='Complete solution to record, convert and stream audio and video with fixes for OBS Studio. And various options in the PKGBUILD'
arch=('x86_64' 'aarch64')
url=https://ffmpeg.org/
license=(GPL-3.0-only)
# To manage dependency rebuild easily, this will prevent you to rebuild FFmpeg on non-updated system
# Only for default set of features
_aomver=3
_dav1dver=1.3.0
_ffnvcodecver=12.2
_glslangver=1.4.313
_libjxlver=0.11.0
_libplacebover=7.351
_libristver=0.2.7
_libtheoraver=1.2
_libvpxver=1.15
_libxml2ver=2.14
_rav1ever=0.7.1
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
  libpostproc.so
  libswresample.so
  libswscale.so
)
conflicts=(ffmpeg)
_tag=db69d06eeeab4f46da15030a80d539efb4503ca8
_deps_tag=2024-09-12
source=(
  "ffmpeg::git+https://git.ffmpeg.org/ffmpeg.git#tag=${_tag}"
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
  makedepends+=(patchutils)
  _svt_hevc_ver='ed80959ebb5586aa7763c91a397d44be1798587c'
  _svt_vp9_ver='3b9a3fa43da4cc5fe60c7d22afe2be15341392ea'
  source+=(
    "020-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/master-0001-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch"
    "030-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
    "031-ffmpeg-add-svt-vp9.patch"
    "040-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-VP9/${_svt_vp9_ver}/ffmpeg_plugin/master-0001-Add-ability-for-ffmpeg-to-run-svt-vp9.patch"
  )
  sha256sums+=(
    '9047e18d34716812d4ea7eafc1d0fd8b376d922a4b6b4dc20237662fcaf0c996'
    'a164ebdc4d281352bf7ad1b179aae4aeb33f1191c444bed96cb8ab333c046f81'
    'aa0daffc4d234b6621b63c298dc165d29522c5087f8905a923d23ee2d164e9ad'
    '59da61f2b2c556fbe0cdbf84bcc00977ee3d2447085decb21f6298226559f2aa'
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
  # uavs3d >= 1.1.41 is required by ffmpeg so switch to uavs3d-git
  # lensfun >= 0.3.95 seems to needed with ffmpeg so switch to lensfun-git
  depends+=(
    sndio 'chromaprint-fftw' libgcrypt
    aribb24 libcaca 'celt' libcdio-paranoia codec2
    'davs2' libdc1394 flite1 libgme libilbc 'libklvanc'
    kvazaar 'lensfun-git' 'openh264' librabbitmq-c
    rtmpdump 'shine' smbclient tesseract
    twolame 'uavs3d-git' 'vo-amrwbenc' 'xavs' 'xavs2'
    zvbi lv2 lilv libmysofa openal
    libomxil-bellagio 'rockchip-mpp' #'pocketsphinx'
    lcms2 libraw1394 openvino libaribcaption opencv2
    qrencode quirc xevd xeve vvenc lcevcdec liblc3
  )
  makedepends+=(patchutils)
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
    --enable-libqrencode --enable-libquirc --disable-libtorch --enable-libxevd --enable-libxeve
    --enable-liblc3 --enable-liblcevc-dec --enable-libvvenc
  )
  provides+=(ffmpeg-full)
else
  _args+=(--disable-sndio) # sndio is not present when upstream package is built
fi

## Check if nonfree licence is enabled
if [[ $_nonfree_enabled == 'ON' ]]; then
  license=('LicenseRef-nonfree-and-unredistributable')
  source+=("license_if_nonfree_enabled.txt")
  sha256sums+=("04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36")
  _args+=(--enable-nonfree)
fi

prepare() {
  cd ffmpeg

  ### ffmpeg-obs changes

  ## Fix building with v4l2 1.30
  sed -i 's/posix_ioctl/ffmpeg_posix_ioctl/g' configure
  sed -i 's/if HAVE_POSIX_IOCTL/if HAVE_FFMPEG_POSIX_IOCTL/g' libavdevice/v4l2.c

  ### ffmpeg-full changes

  ## Fix segfault with avisynthplus
  sed -i 's/RTLD_LOCAL/RTLD_DEEPBIND/g' libavformat/avisynth.c

  ### Arch Linux changes

  ## https://crbug.com/1251779
  patch -Np1 -i "${srcdir}"/0001-Add-av_stream_get_first_dts-for-Chromium.patch

  ## avcodec/libsvtav1: unbreak build with latest svtav1
  git cherry-pick -n 68b5db246407f0b0e398ce3b10ee57f738f0c524

  ## VAAPI HEVC encode alignment fix
  git cherry-pick -n bcfbf2bac8f9eeeedc407b40596f5c7aaa0d5b47
  git cherry-pick -n d0facac679faf45d3356dff2e2cb382580d7a521

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
    patch -Np1 -i "${srcdir}/031-ffmpeg-add-svt-vp9.patch"
    patch -Np1 -i <(filterdiff -i b/libavcodec/libsvt_vp9.c "${srcdir}/040-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch")
  fi

  if [[ $FFMPEG_OBS_CUDA == ON'' ]]; then
    sed -i 's/nvccflags -std=c++11/nvccflags -std=c++14/g' configure
  fi
}

build() {
  cd ffmpeg

  ## Manage extra flags and paths
  if [[ $FFMPEG_OBS_CUDA == 'ON' ]]; then
    export CFLAGS+=' -isystem/opt/cuda/include'
    export LDFLAGS+=' -L/opt/cuda/lib64'
  fi

  if [[ $FFMPEG_OBS_FULL == 'ON' ]]; then
    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+${PKG_CONFIG_PATH}:}/opt/intel/openvino/runtime/lib/intel64/pkgconfig"
    export CFLAGS+=' -Wno-error=incompatible-pointer-types'
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
