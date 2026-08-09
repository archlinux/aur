# Maintainer: Jay Man <jhollis.ga@gmail.com>

pkgname=ffmpeg-cuda-full
pkgver=9.0
pkgrel=1
epoch=2
pkgdesc='FFmpeg with CUDA/NVENC and all codecs including nonfree libfdk-aac'
arch=('x86_64')
url='https://ffmpeg.org/'
license=('GPL-3.0-only' 'LicenseRef-FFmpeg-nonfree')
depends=(
    'alsa-lib'
    'aom'
    'aribb24'
    'bzip2'
    'cairo'
    'dav1d'
    'fontconfig'
    'freetype2'
    'fribidi'
    'glib2'
    'glibc'
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
    'libcdio-paranoia'
    'libdrm'
    'libfdk-aac'
    'libgcc'
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
    'lilv'
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
    'cuda'
    'ffnvcodec-headers'
    'git'
    'ladspa'
    'mesa'
    'nasm'
    'opencl-headers'
    'perl'
    'python'
    'spirv-headers'
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
    "ffmpeg=${epoch}:${pkgver}"
    'libavcodec.so'
    'libavdevice.so'
    'libavfilter.so'
    'libavformat.so'
    'libavutil.so'
    'libswresample.so'
    'libswscale.so'
)
conflicts=('ffmpeg')
install=ffmpeg-cuda-full.install
options=('!lto')
source=(
    "git+https://git.ffmpeg.org/ffmpeg.git?signed#tag=n${pkgver}"
    "0001-Add-av_stream_get_first_dts-for-Chromium.patch"
)
b2sums=('c15bec5d82a33d58d96bca03374b56bc1ffcfb9e9c705106eb05cba0dfd2d6003d3eb05bfc5b325ce1458fcff6bef93db75168da5640ea4dc5bd8b31294cfdd8'
        'e5f7b79f7731be9ee5a7280a9221fb531ac5a2d9820fc5870b68b0eabea667dfbe8f39f41c1e1763a4c84982896afaa54c81ff57847d203b70afafd726689e5d')
validpgpkeys=('DD1EC9E8DE085C629B3E1846B18E8928B3948D64') # Michael Niedermayer <michael@niedermayer.cc>

prepare() {
    cd ffmpeg

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
        --enable-libvpl \
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

    make
    make tools/qt-faststart

    # pod2man lives in /usr/bin/core_perl which may not be on PATH
    PATH="/usr/bin/core_perl:$PATH" make doc/ff{mpeg,play,probe}.1
}

check() {
    cd ffmpeg

    local _component
    for _component in avcodec avdevice avfilter avformat avutil swresample swscale; do
        readelf -d "lib${_component}/lib${_component}.so" | grep -q '(SONAME)'
    done

    local _library_path
    _library_path=$(printf '%s:' "$PWD"/lib{avcodec,avdevice,avfilter,avformat,avutil,swresample,swscale})

    nm -D libavformat/libavformat.so | grep -Eq '[[:space:]]av_stream_get_first_dts(@@[^[:space:]]+)?$'
    LD_LIBRARY_PATH="${_library_path%:}" ./ffmpeg -hide_banner -hwaccels | grep -Fxq cuda
    LD_LIBRARY_PATH="${_library_path%:}" ./ffmpeg -hide_banner -encoders | grep -Eq '^[[:space:]]*V[^[:space:]]*[[:space:]]+av1_nvenc[[:space:]]'
    LD_LIBRARY_PATH="${_library_path%:}" ./ffmpeg -hide_banner -encoders | grep -Eq '^[[:space:]]*V[^[:space:]]*[[:space:]]+h264_nvenc[[:space:]]'
    LD_LIBRARY_PATH="${_library_path%:}" ./ffmpeg -hide_banner -encoders | grep -Eq '^[[:space:]]*V[^[:space:]]*[[:space:]]+hevc_nvenc[[:space:]]'
    LD_LIBRARY_PATH="${_library_path%:}" ./ffmpeg -hide_banner -filters | grep -Eq '^[[:space:]]+[.A-Z|]+[[:space:]]+lv2[[:space:]]'
    LD_LIBRARY_PATH="${_library_path%:}" ./ffmpeg -hide_banner -buildconf | grep -Fq -- '--enable-libfdk-aac'
}

package() {
    cd ffmpeg
    make DESTDIR="${pkgdir}" install
    install -Dm755 tools/qt-faststart "${pkgdir}/usr/bin/qt-faststart"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
