# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=ffmpeg-headless
pkgver=6.0
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
    libbs2b.so
    libdav1d.so
    libdrm
    libfreetype.so
    libiec61883
    libjxl.so
    libmodplug
    libopenmpt.so
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
    ocl-icd
    onevpl
    opencore-amr
    openjpeg2
    opus
    speex
    srt
    svt-av1
    v4l-utils
    vmaf
    vulkan-icd-loader
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
    opencl-headers
    vulkan-headers
)
optdepends=(
    'avisynthplus: AviSynthPlus support'
    'intel-media-sdk: Intel QuickSync support (legacy)'
    'onevpl-intel-gpu: Intel QuickSync support'
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
source=(git+https://git.ffmpeg.org/ffmpeg.git?signed#tag=3949db4d261748a9f34358a388ee255ad1a7f0c0)
b2sums=('SKIP')
validpgpkeys=(DD1EC9E8DE085C629B3E1846B18E8928B3948D64) # Michael Niedermayer <michael@niedermayer.cc>

pkgver() {
    git -C "${pkgname%-headless}" describe --tags | sed 's/^n//'
}

prepare() {
    cd "${pkgname%-headless}"
    # FS#79281: fix assembling with binutil as >= 2.41
    git cherry-pick -n effadce6c756247ea8bae32dc13bb3e6f464f0eb
    # FS#77813: fix playing ogg files with mplayer
    git cherry-pick -n cbcc817353a019da4332ad43deb7bbc4e695d02a
    # use non-deprecated nvenc GUID for conftest
    git cherry-pick -n 03823ac0c6a38bd6ba972539e3203a592579792f
    git cherry-pick -n d2b46c1ef768bc31ba9180f6d469d5b8be677500

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
        --enable-libbs2b \
        --enable-libdav1d \
        --enable-libdrm \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libgsm \
        --enable-libiec61883 \
        --disable-libjack \
        --enable-libjxl \
        --enable-libmodplug \
        --enable-libmp3lame \
        --enable-libopencore_amrnb \
        --enable-libopencore_amrwb \
        --enable-libopenjpeg \
        --enable-libopenmpt \
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
        --enable-libvpl \
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
        --enable-opencl \
        --enable-shared \
        --enable-version3 \
        --enable-vulkan \
        --disable-xlib \
        --disable-sdl2 \
        --disable-htmlpages \
        --disable-ffplay
    make
}

package() {
    make DESTDIR="${pkgdir}" -C ${pkgname%-headless} install install-man
}
