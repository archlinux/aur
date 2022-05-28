# Maintainer:  Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: gbr <gbr@protonmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>
#
# This package is a slightly modified version of:
# AUR/ffmpeg2.8

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=ffmpeg3.4
pkgver=3.4.11
pkgrel=2
pkgdesc='Complete solution to record, convert and stream audio and video'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://ffmpeg.org'
license=('GPL3')
depends=('alsa-lib' 'bzip2' 'fontconfig' 'fribidi' 'glibc' 'gmp' 'gnutls' 'gsm'
         'jack' 'lame' 'libass' 'libavc1394' 'libbluray' 'libiec61883'
         'libmodplug' 'libpulse' 'libraw1394' 'libsoxr' 'libssh' 'libtheora'
         'libva' 'libvdpau' 'libvorbis' 'libvpx' 'libwebp' 'libx11' 'libxcb'
         'libxext' 'libxml2' 'libxv' 'opencore-amr' 'openjpeg' 'opus' 'sdl2'
         'speex' 'v4l-utils' 'vid.stab' 'x264' 'x265' 'xvidcore' 'xz' 'zlib'
         'libomxil-bellagio')
makedepends=('ladspa' 'libvdpau' 'yasm')
optdepends=('ladspa: LADSPA filters')
provides=('ffmpeg-compat-57'
          'libavcodec.so=57' 'libavdevice.so=57' 'libavfilter.so=6' 'libavformat.so=57'
          'libavresample.so=3' 'libavutil.so=55' 'libpostproc.so=54' 'libswresample.so=2'
          'libswscale.so=4')
conflicts=('ffmpeg-full3.4' 'ffmpeg-compat-57')
options=('!lto')
source=("${url}/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        'fs56089.patch')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')
sha256sums=('9c310072bcdcc78a1ee82a36b2b6e648b21dd2e790618200e45876d4d96e32e6'
            'SKIP'
            '0bfcd12d1992903f21c146ae56d9ad89b52818cfb2303197ee905347c25a5427')

prepare() {
    cd ${srcdir}/ffmpeg-${pkgver}

    # https://bugs.archlinux.org/task/56089
    # Backport of http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=a606f27f4c610708fa96e35eed7b7537d3d8f712
    patch -Np1 -i ${srcdir}/fs56089.patch
}

build() {
    cd ${srcdir}/ffmpeg-${pkgver}

    [[ $CARCH == "armv7h" || $CARCH == "aarch64" ]] && CONFIG='--host-cflags="-fPIC"'

    ./configure \
        --prefix='/usr' \
        --disable-debug \
        --incdir='/usr/include/ffmpeg3.4' \
        --libdir='/usr/lib/ffmpeg3.4' \
        --shlibdir='/usr/lib/ffmpeg3.4' \
        --disable-doc \
        --disable-sndio \
        --disable-static \
        --enable-stripping \
        --enable-avisynth \
        --enable-avresample \
        --enable-fontconfig \
        --enable-gmp \
        --enable-gnutls \
        --enable-gpl \
        --enable-ladspa \
        --enable-libass \
        --enable-libbluray \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libgsm \
        --enable-libiec61883 \
        --enable-libmodplug \
        --enable-libmp3lame \
        --enable-libopencore_amrnb \
        --enable-libopencore_amrwb \
        --enable-libopenjpeg \
        --enable-libopus \
        --enable-libpulse \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libssh \
        --enable-libtheora \
        --enable-libv4l2 \
        --enable-libvidstab \
        --enable-libvorbis \
        --enable-libvpx \
        --enable-libwebp \
        --enable-libx264 \
        --enable-libx265 \
        --enable-libxcb \
        --enable-libxml2 \
        --enable-libxvid \
        --enable-shared \
        --enable-version3 \
        --enable-omx

    make
}

package() {
    cd ${srcdir}/ffmpeg-${pkgver}

    make DESTDIR="${pkgdir}" install
    rm -rf ${pkgdir}/usr/share

    find ${pkgdir}/usr/bin -type f -exec mv {} {}3.4 \;

    install -dm 755 ${pkgdir}/etc/ld.so.conf.d
    echo -e '/usr/lib/\n/usr/lib/ffmpeg3.4/' > ${pkgdir}/etc/ld.so.conf.d/50-ffmpeg3.4.conf
}
