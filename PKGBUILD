# Maintainer: Jay Man <jhollis.ga@gmail.com>

pkgname=ffmpeg-cuda-full
pkgver=8.1.1
pkgrel=3
epoch=2
pkgdesc='Latest FFmpeg with CUDA/NVENC and all codecs including nonfree (libfdk-aac) - dynamically tracks upstream releases'
arch=('x86_64')
url='https://ffmpeg.org/'
license=('GPL-3.0-only' 'custom:nonfree')
depends=(
    'alsa-lib'
    'aom'
    'aribb24'
    'bzip2'
    'cairo'
    'cuda'
    'dav1d'
    'fontconfig'
    'freetype2'
    'fribidi'
    'glib2'
    'glibc'
    'glslang'
    'gmp'
    'gnutls'
    'gsm'
    'harfbuzz'
    'jack'
    'kvazaar'
    'lame'
    'lcms2'
    'libass'
    'libavc1394'
    'libbluray'
    'libbs2b'
    'libcdio'
    'libcdio-paranoia'
    'libdrm'
    'libdvdnav'
    'libdvdread'
    'libfdk-aac'
    'libgl'
    'libiec61883'
    'libjxl'
    'libmodplug'
    'libmysofa'
    'libopenmpt'
    'libplacebo'
    'libpulse'
    'libraw1394'
    'librist'
    'librsvg'
    'libsoxr'
    'libssh'
    'libtheora'
    'libva'
    'libvdpau'
    'libvorbis'
    'libvpx'
    'libwebp'
    'libx11'
    'libxcb'
    'libxext'
    'libxml2'
    'libxv'
    'nvidia-utils'
    'ocl-icd'
    'onevpl'
    'opencore-amr'
    'openjpeg2'
    'opus'
    'rav1e'
    'rubberband'
    'sdl2'
    'smbclient'
    'snappy'
    'sndio'
    'speex'
    'srt'
    'svt-av1'
    'v4l-utils'
    'vapoursynth'
    'vid.stab'
    'vmaf'
    'vulkan-icd-loader'
    'x264'
    'x265'
    'xvidcore'
    'xz'
    'zeromq'
    'zimg'
    'zlib'
)
makedepends=(
    'amf-headers'
    'avisynthplus'
    'clang'
    'ffnvcodec-headers'
    'git'
    'ladspa'
    'mesa'
    'nasm'
    'opencl-headers'
    'perl'
    'python'
    'vulkan-headers'
)
optdepends=(
    'frei0r-plugins: Frei0r video effects support'
    'intel-media-driver: VAAPI driver for Intel Broadwell and newer GPUs'
    'intel-media-sdk: Intel QuickSync support (legacy)'
    'ladspa: LADSPA filters'
    'libva-utils: VAAPI diagnostics including vainfo'
    'mesa: VAAPI driver for AMD/older Intel GPUs'
    'onevpl-intel-gpu: Intel QuickSync support'
)
provides=(
    "ffmpeg=$pkgver"
    'libavcodec.so=62-64'
    'libavdevice.so=62-64'
    'libavfilter.so=11-64'
    'libavformat.so=62-64'
    'libavutil.so=60-64'
    'libswresample.so=6-64'
    'libswscale.so=9-64'
)
conflicts=('ffmpeg')
replaces=('ffmpeg')
install=ffmpeg-cuda-full.install
options=('!lto')
source=(
    "ffmpeg::git+https://git.ffmpeg.org/ffmpeg.git"
    "0001-Add-av_stream_get_first_dts-for-Chromium.patch"
)
b2sums=('SKIP'
        'e5f7b79f7731be9ee5a7280a9221fb531ac5a2d9820fc5870b68b0eabea667dfbe8f39f41c1e1763a4c84982896afaa54c81ff57847d203b70afafd726689e5d')

# Dynamically resolve the latest stable release tag from upstream.
# This runs at build time so the package always tracks the newest FFmpeg.
pkgver() {
    cd ffmpeg
    git fetch --tags --force >/dev/null 2>&1
    # List all release tags (n<major>.<minor>[.<patch>]), exclude RC/dev,
    # sort by version, and pick the highest.
    local _tag
    _tag=$(git tag -l 'n[0-9]*' |
           grep -E '^n[0-9]+\.[0-9]+(\.[0-9]+)*$' |
           sed 's/^n//' |
           sort -rV |
           head -n1)
    if [[ -z "$_tag" ]]; then
        # Fallback: use git describe
        git describe --tags --long 2>/dev/null | sed 's/^n//;s/-/.r/;s/-/./g'
        return
    fi
    printf '%s' "$_tag"
}

prepare() {
    cd ffmpeg
    # Checkout the exact release tag determined by pkgver()
    git checkout "n${pkgver}" 2>/dev/null || true

    # Restore av_stream_get_first_dts for Chromium-derived consumers
    # (qt6-webengine, electron, chromium). https://crbug.com/1251779
    git apply -3 ../0001-Add-av_stream_get_first_dts-for-Chromium.patch
}

build() {
    cd ffmpeg

    # Optimize for the build machine's CPU and use -O3 for better performance.
    # Replace the *entire* -march=/-mtune= token rather than a substring: a
    # bare "${CFLAGS/-march=x86-64/...}" turns a microarchitecture level such as
    # -march=x86-64-v3 into the invalid -march=native-v3 ("cc1: error: bad value
    # 'native-v3'"). Matching -march=<non-space>+ forces native regardless of the
    # configured arch. -O2 is bumped to -O3, but an explicit lower level
    # (e.g. -O0 for debugging) is deliberately left alone.
    CFLAGS=$(sed -E 's/-march=[^[:space:]]+/-march=native/; s/-mtune=[^[:space:]]+/-mtune=native/' <<<"$CFLAGS")
    CFLAGS="${CFLAGS/-O2/-O3}"
    CXXFLAGS=$(sed -E 's/-march=[^[:space:]]+/-march=native/; s/-mtune=[^[:space:]]+/-mtune=native/' <<<"$CXXFLAGS")
    CXXFLAGS="${CXXFLAGS/-O2/-O3}"

    # FFmpeg's configure expects threads="yes"/"no" internally.
    # makepkg can leak threads=<N> from MAKEFLAGS which breaks dependency checks.
    unset threads THREADS

    # Ensure nvcc is on PATH for --enable-cuda-nvcc
    export PATH="/opt/cuda/bin:$PATH"

    # FFmpeg's configure defaults --nvccflags to "-gencode arch=compute_30,
    # code=sm_30 -O2" and falls back through sm_60/sm_75 only when the
    # toolchain prints the English word "unsupported". That probe is fragile
    # (locale, wrapper scripts, future CUDA wording can all break it) and
    # leaves configure with an unbuildable arch -> "ERROR: failed checking
    # for nvcc". Ask nvcc itself for the lowest arch it supports and pass
    # --nvccflags explicitly so we don't rely on the probe.
    local _nvcc_arch
    _nvcc_arch=$(nvcc --list-gpu-arch 2>/dev/null | head -n1)
    : "${_nvcc_arch:=compute_75}"
    local _nvcc_sm=${_nvcc_arch/compute_/sm_}

    ./configure \
        --prefix=/usr \
        --disable-debug \
        --disable-static \
        --disable-stripping \
        --enable-pic \
        --enable-amf \
        --enable-avisynth \
        --enable-bzlib \
        --enable-cuda-nvcc \
        --enable-cuda-llvm \
        --enable-cuvid \
        --enable-ffnvcodec \
        --enable-gmp \
        --enable-gnutls \
        --enable-gpl \
        --enable-iconv \
        --enable-ladspa \
        --enable-lcms2 \
        --enable-libaom \
        --enable-libaribb24 \
        --enable-libass \
        --enable-libbluray \
        --enable-libbs2b \
        --enable-libcdio \
        --enable-libdav1d \
        --enable-libdrm \
        --enable-libfdk-aac \
        --enable-libfontconfig \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libglslang \
        --enable-libgsm \
        --enable-libharfbuzz \
        --enable-libiec61883 \
        --enable-libjack \
        --enable-libjxl \
        --enable-libkvazaar \
        --enable-libmodplug \
        --enable-libmp3lame \
        --enable-libmysofa \
        --enable-libopencore-amrnb \
        --enable-libopencore-amrwb \
        --enable-libopenmpt \
        --enable-libopenjpeg \
        --enable-libopus \
        --enable-libplacebo \
        --enable-libpulse \
        --enable-librav1e \
        --enable-librist \
        --enable-librsvg \
        --enable-librubberband \
        --enable-libsmbclient \
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
        --enable-libvpx \
        --enable-libwebp \
        --enable-libx264 \
        --enable-libx265 \
        --enable-libxcb \
        --enable-libxml2 \
        --enable-libxvid \
        --enable-libzimg \
        --enable-libzmq \
        --enable-lv2 \
        --enable-lzma \
        --enable-nonfree \
        --enable-nvdec \
        --enable-nvenc \
        --enable-opencl \
        --enable-opengl \
        --enable-pthreads \
        --enable-sdl2 \
        --enable-shared \
        --enable-vaapi \
        --enable-vapoursynth \
        --enable-version3 \
        --enable-vulkan \
        --enable-zlib \
        --nvccflags="-gencode arch=${_nvcc_arch},code=${_nvcc_sm} -O2" \
        --extra-cflags="-I/opt/cuda/include" \
        --extra-ldflags="-L/opt/cuda/lib64"

    make -j"$(nproc)"
    make -j"$(nproc)" tools/qt-faststart

    # pod2man lives in /usr/bin/core_perl which may not be on PATH
    PATH="/usr/bin/core_perl:$PATH" make -j"$(nproc)" doc/ff{mpeg,play,probe}.1
}

package() {
    cd ffmpeg
    make DESTDIR="${pkgdir}" install
    install -Dm755 tools/qt-faststart "${pkgdir}/usr/bin/qt-faststart"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
