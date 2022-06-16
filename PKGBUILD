# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=ffmpeg-headless
pkgver=5.0.1
pkgrel=3
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
source=(git+https://git.ffmpeg.org/ffmpeg.git#tag=9687cae2b468e09e35df4cea92cc2e6a0e6c93b3
        ffmpeg-vmaf2.x.patch)
b2sums=('SKIP'
        '65039aac811bfd143359e32720cd6ca64124f1789c1b624bd28a5bd75b37362b2a3b6b402203c4e9d137fb1d00895114f3789df40f8381091d38c98e7876cc8a')

pkgver() {
    git -C "${pkgname%-headless}" describe --tags | sed 's/^n//'
}

prepare() {
    cd ${pkgname%-headless}
    git cherry-pick -n 988f2e9eb063db7c1a678729f58aab6eba59a55b     # fix nvenc on older gpus
    patch -Np1 -i ../ffmpeg-vmaf2.x.patch                           # vmaf 2.x support
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
