# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# Contributor: gbr <gbr@protonmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>
#
# This package was based on a slightly modified version of:
# AUR/ffmpeg2.8

pkgname='ffmpeg3.4'
pkgver=3.4.13
pkgrel=3
pkgdesc='Library to record, convert and stream audio and video (legacy v3.4 branch, with libavcodec v57)'
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url='https://ffmpeg.org'
license=('GPL-3.0-only')
depends=(
  'alsa-lib'
  'bzip2'
  'fontconfig'
  'freetype2'
  'fribidi'
  'glibc'
  'gmp'
  'gnutls'
  'jack'
  'lame'
  'libass'
  'libbluray'
  'libpulse'
  'libsoxr'
  'libtheora'
  'libva'
  'libvdpau'
  'libvorbis'
  'libvpx'
  'libwebp'
  'libx11'
  'libxcb'
  'libxext'
  'libxv'
  'opus'
  'speex'
  'v4l-utils'
  'vid.stab'
  'x264'
  'x265' 
  'xvidcore'
  'zlib'
)
depends_x86_64=('libmfx')
makedepends=(
  'ladspa' 
  'nasm'
)
optdepends=('ladspa: LADSPA filters')
optdepends_x86_64=('intel-media-sdk: for Intel QuickSync HW acceleration support (experimental)')
provides=(
  "ffmpeg-compat-57=${pkgver}"
  'libavcodec.so'
  'libavdevice.so'
  'libavfilter.so'
  'libavformat.so'
  'libavresample.so'
  'libavutil.so'
  'libpostproc.so'
  'libswresample.so'
  'libswscale.so'
)
conflicts=(
  'ffmpeg-compat-57'
  'ffmpeg-full3.4'
)
options=('!lto')
source=(
  "${url}/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
  'fs56089.patch'
  'debian-ffmpeg-remove-x86-optimization.patch'
)
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')
b2sums=('55f76ec2acd53594d02908a8dc67adcc1fcb684206d412b7fb67b5fd7b120d833d85b7f7fed22c922250e337f9960ee0eda65f958f338f9ecd1ee7e9d153635f'
        'SKIP'
        '42141778d3c18939b4f3c59a8163cecff3cedc02010f00a064948183b5aba4e51c9576ec2f559581a590360645a104c9a4abc272e120dbdf2891745d358bc009'
        'f90e0cd826c5a8c6221466dd12162a9936494883ea9e565af3f56c0f85ecbc2ba37595bb3f00749425da0866d291fbd954ac60aef04229472f461583de6ef628')

prepare() {
    cd "${srcdir}/ffmpeg-${pkgver}"

    # https://bugs.archlinux.org/task/56089
    # Backport of http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=a606f27f4c610708fa96e35eed7b7537d3d8f712
    patch --forward --strip=1 -i "${srcdir}/fs56089.patch"

    # Remove code for shift optimization on x86
    # It does not compile with gas from binutils 2.40.50.20230611
    # Bug: https://bugs.debian.org/1038132
    patch --forward --strip=1 -i "${srcdir}/debian-ffmpeg-remove-x86-optimization.patch"
}

build() {
    cd "${srcdir}/ffmpeg-${pkgver}"

    export CFLAGS+=" -Wno-incompatible-pointer-types"
    export CXXFLAGS+=" -Wno-incompatible-pointer-types"

    [[ $CARCH == "armv7h" || $CARCH == "aarch64" ]] && local arch_specific_config='--host-cflags="-fPIC"'
    [[ $CARCH == "x86_64" ]] && local arch_specific_config='--enable-libmfx'

    ./configure \
        --prefix='/usr' \
        --incdir='/usr/include/ffmpeg3.4' \
        --libdir='/usr/lib/ffmpeg3.4' \
        --shlibdir='/usr/lib/ffmpeg3.4' \
        --disable-autodetect \
        --disable-debug \
        --disable-doc \
        --disable-static \
        --disable-sndio \
        --disable-libdc1394 \
        --disable-libgsm \
        --disable-libiec61883 \
        --disable-libmodplug \
        --disable-libopenjpeg \
        --disable-libssh \
        --disable-libopencore_amrnb \
        --disable-libopencore_amrwb \
        --disable-libxml2 \
        --disable-omx \
        --disable-sdl2 \
        --enable-stripping \
        --enable-alsa \
        --enable-avisynth \
        --enable-avresample \
        --enable-bzlib \
        --enable-fontconfig \
        --enable-gmp \
        --enable-gnutls \
        --enable-gpl \
        --enable-jack \
        --enable-ladspa \
        --enable-libass \
        --enable-libbluray \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libmp3lame \
        --enable-libopus \
        --enable-libpulse \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libtheora \
        --enable-libv4l2 \
        --enable-libvidstab \
        --enable-libvorbis \
        --enable-libvpx \
        --enable-libwebp \
        --enable-libx264 \
        --enable-libx265 \
        --enable-libxcb \
        --enable-libxcb-shm \
        --enable-libxcb-xfixes \
        --enable-libxcb-shape \
        --enable-libxvid \
        --enable-pthreads \
        --enable-shared \
        --enable-vaapi \
        --enable-vdpau \
        --enable-version3 \
        --enable-xlib \
        --enable-zlib \
        "${arch_specific_config}"

    make
}

package() {
    cd "${srcdir}/ffmpeg-${pkgver}"

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/usr/share"

    find "${pkgdir}/usr/bin" -type f -exec mv {} {}3.4 \;

    install -dm 755 "${pkgdir}/etc/ld.so.conf.d"
    echo -e '/usr/lib/\n/usr/lib/ffmpeg3.4/' > "${pkgdir}/etc/ld.so.conf.d/50-ffmpeg3.4.conf"
}
