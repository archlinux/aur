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
## Enable everything except NDI and CUDA changes (enable them manually if you want them)
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

## Add changes from ffmpeg-ndi (nonfree option)
if [[ -z "$FFMPEG_OBS_NDI" ]]; then
  FFMPEG_OBS_NDI=OFF
fi

## Add SVT related changes from ffmpeg-full because ffmpeg-svt is out of date
if [[ -z "$FFMPEG_OBS_SVT" ]]; then
  FFMPEG_OBS_SVT=OFF
fi

## Add changes from ffmpeg-vulkan
if [[ -z "$FFMPEG_OBS_VULKAN" ]]; then
  FFMPEG_OBS_VULKAN=OFF
fi

# Version checks will only be added for the default package deps
DISTRIB_ID=`lsb_release --id | cut -f2 -d$'\t'`

pkgname=ffmpeg-obs
pkgver=4.4.1
pkgrel=5
pkgdesc='Complete solution to record, convert and stream audio and video with fixes for OBS Studio. And various options in the PKGBUILD'
arch=('i686' 'x86_64' 'aarch64')
url=https://ffmpeg.org/
license=(GPL3)
_aomver=3
_libristver=0.2.6
_libvpxsover=7
_libx264ver=163
_libx265ver=199
_srtver=1.4.3
depends=(
  alsa-lib
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
  libdav1d.so
  libdrm
  libfreetype.so
  libiec61883
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
  libwebp
  libx11
  libxcb
  libxext
  libxml2
  libxv
  libxvidcore.so
  libzimg.so
  opencore-amr
  openjpeg2
  opus
  sdl2
  speex
  v4l-utils
  xz
  zlib
)
# To manage dependency rebuild easily, this will prevent you to rebuild FFmpeg on non-updated system
# For Manjaro user this feature is disabled
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  depends+=(
    'aom'
    'libvpx.so'
    'libx264.so'
    'libx265.so'
    'srt'
  )
else
  depends+=(
    "aom>=$_aomver"
    "libvpx.so>=$_libvpxsover"
    "libx264.so>=$_libx264ver"
    "libx265.so>=$_libx265ver"
    "srt>=$_srtver"
  )
fi
makedepends=(
  git
  amf-headers
  avisynthplus
  clang
  ffnvcodec-headers
  ladspa
  nasm
)
optdepends=(
  'avisynthplus: AviSynthPlus support'
  'ladspa: LADSPA filters'
  'nvidia-utils: Nvidia NVDEC/NVENC support'
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
conflicts=(ffmpeg)
_tag=7e0d640edf6c3eee1816b105c2f7498c4f948e74
_deps_tag=15072cd42722d87c6b3ed1636b22e98c08575f20
source=(
  "ffmpeg::git+https://git.ffmpeg.org/ffmpeg.git#tag=${_tag}"
  "obs-deps::git+https://github.com/obsproject/obs-deps.git#tag=${_deps_tag}"
  "vmaf-model-path.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  '8dff51f84a5f7460f8893f0514812f5d2bd668c3276ef7ab7713c99b71d7bd8d'
)

if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
source+=(
  "$pkgname.hook"
  "$pkgname.sh"
)
sha256sums+=(
  "39820f085e4366cfa24b7bf632d331d3bfa6e9f62f47df55892901218636a2fc"
  "195ad5f134f02666d330342d04561c12a10e0522b3ace80cd36531d4092e1e4d"
)
fi

if [[ $FFMPEG_OBS_FULL == 'ON' ]]; then
  FFMPEG_OBS_DEBUG=ON
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
  --enable-fontconfig
  --enable-gmp
  --enable-gnutls
  --enable-gpl
  --enable-ladspa
  --enable-libaom
  --enable-libass
  --enable-libbluray
  --enable-libdav1d
  --enable-libdrm
  --enable-libfreetype
  --enable-libfribidi
  --enable-libgsm
  --enable-libiec61883
  --enable-libjack
  --enable-libmodplug
  --enable-libmp3lame
  --enable-libopencore_amrnb
  --enable-libopencore_amrwb
  --enable-libopenjpeg
  --enable-libopus
  --enable-libpulse
  --enable-librav1e
  --enable-librsvg
  --enable-libsoxr
  --enable-libspeex
  --enable-libsrt
  --enable-libssh
  --enable-libtheora
  --enable-libv4l2
  --enable-libvidstab
  --enable-libvorbis
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
  --enable-shared
  --enable-version3
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
_args+=(--enable-librist)
# To manage dependency rebuild easily, this will prevent you to rebuild FFmpeg on non-updated system
# For Manjaro user this feature is disabled
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  depends+=('librist')
else
  depends+=("librist>=$_libristver")
fi

## Add upstream feature for x86_64 build
if [[ $CARCH == 'x86_64' ]]; then
  _args+=(--enable-lto --enable-libmfx --enable-libsvtav1)
  depends+=('libmfx' 'svt-av1')
  optdepends+=('intel-media-sdk: Intel QuickSync support')
else
  _args+=(--disable-lto)
fi

## Add upstream feature for i686 and x86_64 build
if [[ $CARCH == "i686" || $CARCH == "x86_64" ]]; then
  _args+=(--enable-libvmaf)
  depends+=(vmaf)
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
  _args+=(
    --enable-cuda-nvcc --enable-libnpp --enable-cuvid --disable-cuda-llvm
    --nvccflags='-gencode arch=compute_52,code=sm_52 -O2'
  )
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
fi

if [[ $FFMPEG_OBS_LIBFDK_AAC == 'ON' ]]; then
  _nonfree_enabled=ON
  depends+=(libfdk-aac)
  _args+=(--enable-libfdk-aac)
fi

if [[ $FFMPEG_OBS_NDI == 'ON' ]]; then
  _nonfree_enabled=ON
  depends+=('ndi-sdk')
  source+=(
    "Revert-lavd-Remove-libndi_newtek.patch::https://framagit.org/tytan652/ffmpeg-ndi-patch/-/raw/master/Revert-lavd-Remove-libndi_newtek.patch?inline=false"
    "libndi_newtek_common.h::https://framagit.org/tytan652/ffmpeg-ndi-patch/-/raw/master/libavdevice/libndi_newtek_common.h?inline=false"
    "libndi_newtek_dec.c::https://framagit.org/tytan652/ffmpeg-ndi-patch/-/raw/master/libavdevice/libndi_newtek_dec.c?inline=false"
    "libndi_newtek_enc.c::https://framagit.org/tytan652/ffmpeg-ndi-patch/-/raw/master/libavdevice/libndi_newtek_enc.c?inline=false"
  )
  sha256sums+=(
    '5a37c295d01ae02f02b366c3ba4867d27bc3ac29c1420472fbe8e4d7bca3bd4c'
    '462e984a7cb3d0af17b0ea0eb2a010aee2f79a3e77c2055fdfd760163dd75fa4'
    '3c6dea7583d79911e9ea198c35b1b56830b85eea84e49d63c2d5c03af5210eca'
    '83cc714edc8d1c37ffabd2ee17960d6ed91a1d019bd43d01383f84eea28e4fbb'
  )
  _args+=(--enable-libndi_newtek)
fi

if [[ $FFMPEG_OBS_SVT == 'ON' ]]; then
  depends+=(svt-vp9 svt-hevc)
  _svt_hevc_ver='33ca9aa8a2a2d28022d3fc03704e99ce01828376'
  _svt_vp9_ver='abd5c59c06d686eae57ef4e6f899c601f791d055'
  source+=(
    "020-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0001-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch"
    "030-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
    "040-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-VP9/${_svt_vp9_ver}/ffmpeg_plugin/master-0001-Add-ability-for-ffmpeg-to-run-svt-vp9.patch"
  )
  sha256sums+=(
    '740dc9838aa47daa9f9b107178e53e384344f4c6f90865bd7e3af189257da544'
    '1499e419dda72b1604dc5e3959668f3843292ff56bfba78734e31510ba576de0'
    'b7d722dfce20b73e9d5c73d55ffe041bbdc92a3c4a5c5d766b6b3040671b4052'
  )
  _args+=(--enable-libsvtvp9 --enable-libsvthevc)
fi

if [[ $FFMPEG_OBS_VULKAN == 'ON' ]]; then
  depends+=(vulkan-icd-loader glslang spirv-tools)
  makedepends+=(vulkan-headers)
  _args+=(--enable-vulkan --enable-libglslang)
fi

if [[ $FFMPEG_OBS_FULL == 'ON' ]]; then
  _nonfree_enabled=ON
  # uavs3d >= 1.1.41 is required by ffmpeg so switch to uavs3d-git
  # lensfun >= 0.3.95 seems to needed with ffmpeg so switch to lensfun-git
  depends+=(
    sndio 'chromaprint-fftw' frei0r-plugins libgcrypt
    aribb24 libbs2b libcaca celt libcdio-paranoia codec2
    'davs2' libdc1394 'flite1-patched' libgme libilbc 'libklvanc-git'
    kvazaar 'lensfun-git' 'openh264' libopenmpt librabbitmq-c rubberband
    rtmpdump 'shine' smbclient snappy tensorflow tesseract
    twolame 'uavs3d-git' 'vo-amrwbenc' 'xavs' 'xavs2' zeromq
    zvbi lv2 lilv libmysofa openal ocl-icd libgl
    'pocketsphinx' vapoursynth libomxil-bellagio 'rockchip-mpp'
  )
  makedepends+=(opencl-headers)
  _args+=(
    --enable-sndio --disable-rpath --enable-gray --enable-chromaprint --enable-frei0r --enable-gcrypt
    --enable-libaribb24 --enable-libbs2b --enable-libcaca --enable-libcelt --enable-libcdio --enable-libcodec2
    --enable-libdavs2 --enable-libdc1394 --enable-libflite --enable-libgme --enable-libilbc --enable-libklvanc
    --enable-libkvazaar --enable-liblensfun --enable-libopenh264 --enable-libopenmpt --enable-librabbitmq --enable-librubberband
    --enable-librtmp --enable-libshine --enable-libsmbclient --enable-libsnappy --enable-libtensorflow --enable-libtesseract
    --enable-libtwolame --enable-libuavs3d --enable-libvo-amrwbenc --enable-libxavs --enable-libxavs2 --enable-libzmq
    --enable-libzvbi --enable-lv2 --enable-libmysofa --enable-openal --enable-opencl --enable-opengl
    --enable-pocketsphinx --enable-vapoursynth --enable-omx --enable-rkmpp
  )
  _args+=(--enable-avresample)
else
  _args+=(--disable-sndio) # sndio is not present when upstream package is built
fi

## Manage extra flags
if [[ $FFMPEG_OBS_FULL == 'ON' ]] && [[ $FFMPEG_OBS_CUDA == 'ON' ]]; then
  _args+=(--extra-cflags='-I/opt/cuda/include -I/usr/include/tensorflow')
  _args+=(--extra-ldflags='-L/opt/cuda/lib64')
elif [[ $FFMPEG_OBS_FULL == 'ON' ]]; then
  _args+=(--extra-cflags='-I/usr/include/tensorflow')
elif [[ $FFMPEG_OBS_CUDA == 'ON' ]]; then
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

  ### Arch Linux changes

  ## Change default vmaf model path to Arch defaults
  patch -Np1 -i "${srcdir}"/vmaf-model-path.patch

  ### OBS changes

  ## To fix crashes when VAAPI settings are wrong
  # avcodec/vaapi_encode: Fix segfault upon closing uninitialized encoder
  # https://github.com/FFmpeg/FFmpeg/commit/d1b47f3bfcc625ca1cae210fc198dcbd54381a88
  git cherry-pick -n d1b47f3bfcc625ca1cae210fc198dcbd54381a88

  ## Patch for FFmpeg from obs-deps repository

  # This patch applies:
  #  - Fix decoding of certain malformed FLV files
  #  - Add additional CPU levels for libaom
  patch -Np1 -i "${srcdir}"/obs-deps/CI/patches/FFmpeg-4.4.1-OBS.patch

  # avformat/hlsenc: remove unnecessary http/https shutdown status operate
  # https://patchwork.ffmpeg.org/project/ffmpeg/patch/20210913021204.22138-1-lq@chinaffmpeg.org/
  patch -Np1 -i "${srcdir}"/obs-deps/CI/patches/FFmpeg-9010.patch

  ## This patch applies:
  #   - avformat/librist: replace deprecated functions
  #     https://github.com/FFmpeg/FFmpeg/commit/5274f2f7f8c5e40d18b84055fbb232752bd24f2f
  #   - avformat/librist: correctly initialize logging_settings
  #     https://github.com/FFmpeg/FFmpeg/commit/9b15f43cf8c7976fba115da686a990377f7b5ab9
  #   - libRIST: allow setting fifo size and fail on overflow
  #     https://patchwork.ffmpeg.org/project/ffmpeg/patch/20211117141929.1164334-2-gijs@peskens.net/
  patch -Np1 -i "${srcdir}"/obs-deps/CI/patches/FFmpeg-4.4.1-librist.patch

  ## This patch applies a fix on AOM encoder
  patch -Np1 -i "${srcdir}"/obs-deps/CI/patches/FFmpeg-4.4.1-libaomenc.patch

  # Fix "error: unknown type name ‘bool’" made by the patch because stdbool.h is only added through librist from version 0.2.7
  sed -i '49 a #if FF_LIBRIST_VERSION < FF_LIBRIST_VERSION_42\n#include <stdbool.h>\n#endif' libavformat/librist.c

  # Fix some typo made in the patch if built against librist 0.2.6
  sed -i 's/FF_LIBRIST_FIFO_DEFAULT)/FF_LIBRIST_FIFO_DEFAULT_SHIFT)/g' libavformat/librist.c
  sed -i 's/fifo_buffer_size/fifo_shift/g' libavformat/librist.c

  ## NDI changes if enabled
  if [[ $FFMPEG_OBS_NDI == 'ON' ]]; then
    patch -Np1 -i "${srcdir}"/Revert-lavd-Remove-libndi_newtek.patch
    printf 'Copying libndi missing file\n'
    cp "${srcdir}"/libndi_newtek_* libavdevice/
  fi

  ## SVT changes if enabled
  if [[ $FFMPEG_OBS_SVT == 'ON' ]]; then
    rm -f "libavcodec/"libsvt_{hevc,vp9}.c
    sed -E -n 's/general.texi/general_contents.texi/g' "${srcdir}/030-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch" > "030-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    patch -Np1 -i "${srcdir}/020-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"
    patch -Np1 -i "030-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    patch -Np1 -i "${srcdir}/040-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"
  fi
}

build() {
  cd ffmpeg

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

  if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
    install -D -m644 "$srcdir/$pkgname.hook" -t "${pkgdir}"/usr/share/libalpm/hooks/
    install -D -m755 "$srcdir/$pkgname.sh" -t "${pkgdir}"/usr/share/libalpm/scripts/
  fi
}
