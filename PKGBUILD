# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=ffmpeg-headless
pkgver=5.1
pkgrel=1
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video; optimised for server (headless) systems'
arch=(i686 x86_64 armv7h armv6h aarch64)
url=https://ffmpeg.org/
license=(GPL3)
depends=(
    aom
    bzip2
    fontconfig
    fribidi
    gmp
    gnutls
    gsm
    lame
    libass.so
    libavc1394
    libbluray.so
    libdav1d.so
    libdrm
    libfreetype.so
    libiec61883
    libmfx
    libmodplug
    librav1e.so
    libraw1394
    librsvg-2.so
    libsoxr
    libssh
    libtheora
    libva.so
    libvdpau
    libvidstab.so
    libvorbis.so
    libvorbisenc.so
    libvpx.so
    libwebp
    libx264.so
    libx265.so
    libxml2
    libxvidcore.so
    libzimg.so
    opencore-amr
    openjpeg2
    opus
    speex
    srt
    svt-av1
    v4l-utils
    vmaf
    xz
    zlib
)
makedepends=(
    amf-headers
    avisynthplus
    clang
    ffnvcodec-headers
    git
    ladspa
    nasm
)
optdepends=(
    'avisynthplus: AviSynthPlus support'
    'intel-media-sdk: Intel QuickSync support'
    'ladspa: LADSPA filters'
    'nvidia-utils: Nvidia NVDEC/NVENC support'
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
    "${pkgname%-headless}"
)
conflicts=("${pkgname%-headless}")
source=(git+https://git.ffmpeg.org/ffmpeg.git#tag=e0723b7e4e22492275d476fcd30d759e1198bc5b)
b2sums=('SKIP')

pkgver() {
    git -C "${pkgname%-headless}" describe --tags | sed 's/^n//'
}

prepare() {
    cd ${pkgname%-headless}
    git cherry-pick -n 988f2e9eb063db7c1a678729f58aab6eba59a55b     # fix nvenc on older gpus
}

build() {
    cd ${pkgname%-headless}

    ./configure \
        --prefix=/usr \
        --disable-debug \
        --disable-static \
        --disable-stripping \
        --enable-amf \
        --enable-avisynth \
        --enable-cuda-llvm \
        --enable-lto \
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
        --disable-libjack \
        --enable-libmfx \
        --enable-libmodplug \
        --enable-libmp3lame \
        --enable-libopencore_amrnb \
        --enable-libopencore_amrwb \
        --enable-libopenjpeg \
        --enable-libopus \
        --disable-libpulse \
        --enable-librav1e \
        --enable-librsvg \
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
        --disable-libxcb \
        --enable-libxml2 \
        --enable-libxvid \
        --enable-libzimg \
        --enable-nvdec \
        --enable-nvenc \
        --enable-shared \
        --enable-version3 \
        --disable-xlib \
        --disable-sdl2 \
        --disable-htmlpages \
        --disable-ffplay

    make
}

package() {
    make DESTDIR="${pkgdir}" -C ${pkgname%-headless} install install-man
}
