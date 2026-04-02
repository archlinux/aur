# Maintainer: Jay Man <jhollis.ga@gmail.com>

pkgname=ffmpeg-cuda-full
pkgver=8.1
pkgrel=1
epoch=2
pkgdesc='Latest FFmpeg with CUDA/NVENC and all codecs including nonfree (libfdk-aac) - dynamically tracks upstream releases'
arch=('x86_64')
url='https://ffmpeg.org/'
license=('GPL-3.0-only' 'custom:nonfree')
depends=(
    'alsa-lib'
    'aom'
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
    'intel-media-sdk: Intel QuickSync support (legacy)'
    'ladspa: LADSPA filters'
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
options=('!lto')
source=("ffmpeg::git+https://git.ffmpeg.org/ffmpeg.git")
b2sums=('SKIP')

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
}

build() {
    cd ffmpeg

    # Optimize for the build machine's CPU and use -O3 for better performance.
    # Safe for AUR since every user compiles locally with their own -march=native.
    CFLAGS="${CFLAGS/-march=x86-64/-march=native}"
    CFLAGS="${CFLAGS/-mtune=generic/-mtune=native}"
    CFLAGS="${CFLAGS/-O2/-O3}"
    CXXFLAGS="${CXXFLAGS/-march=x86-64/-march=native}"
    CXXFLAGS="${CXXFLAGS/-mtune=generic/-mtune=native}"
    CXXFLAGS="${CXXFLAGS/-O2/-O3}"

    # FFmpeg's configure expects threads="yes"/"no" internally.
    # makepkg can leak threads=<N> from MAKEFLAGS which breaks dependency checks.
    unset threads THREADS

    # Ensure nvcc is on PATH for --enable-cuda-nvcc
    export PATH="/opt/cuda/bin:$PATH"

    ./configure \
        --prefix=/usr \
        --disable-debug \
        --disable-static \
        --disable-stripping \
        --enable-pic \
        --enable-amf \
        --enable-avisynth \
        --enable-cuda-nvcc \
        --enable-cuda-llvm \
        --enable-cuvid \
        --enable-ffnvcodec \
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
        --enable-nonfree \
        --enable-nvdec \
        --enable-nvenc \
        --enable-opencl \
        --enable-opengl \
        --enable-pthreads \
        --enable-shared \
        --enable-vapoursynth \
        --enable-version3 \
        --enable-vulkan \
        --extra-cflags="-I/opt/cuda/include" \
        --extra-ldflags="-L/opt/cuda/lib64"

    make
    make tools/qt-faststart
    make doc/ff{mpeg,play,probe}.1
}

package() {
    cd ffmpeg
    make DESTDIR="${pkgdir}" install
    install -Dm755 tools/qt-faststart "${pkgdir}/usr/bin/qt-faststart"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
