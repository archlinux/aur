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

pkgname=ffmpeg3.4
pkgver=3.4.11
pkgrel=4
pkgdesc='Complete solution to record, convert and stream audio and video'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://ffmpeg.org'
license=('GPL3')
depends=('alsa-lib' 'bzip2' 'fontconfig' 'freetype2' 'fribidi' 'glibc' 'gmp' 'gnutls' 'gsm'
         'jack' 'lame' 'libass' 'libavc1394' 'libbluray' 'libiec61883'
         'libmodplug' 'libpulse' 'libraw1394' 'libsoxr' 'libssh' 'libtheora'
         'libva' 'libvdpau' 'libvorbis' 'libvpx' 'libwebp' 'libx11' 'libxcb'
         'libxext' 'libxml2' 'libxv' 'opencore-amr' 'openjpeg' 'opus' 'sdl2'
         'speex' 'v4l-utils' 'vid.stab' 'x264' 'x265' 'xvidcore' 'xz' 'zlib')
depends_x86_64=('libmfx')
makedepends=('ladspa' 'libomxil-bellagio' 'nasm')
optdepends=('ladspa: LADSPA filters'
            'libomxil-bellagio: HW acceleration on mobile platforms')
optdepends_x86_64=('intel-media-sdk: for Intel QuickSync HW acceleration support (experimental)')
provides=("ffmpeg-compat-57=${pkgver}"
          'libavcodec.so=57' 'libavdevice.so=57' 'libavfilter.so=6' 'libavformat.so=57'
          'libavresample.so=3' 'libavutil.so=55' 'libpostproc.so=54' 'libswresample.so=2'
          'libswscale.so=4')
conflicts=('ffmpeg-full3.4' 'ffmpeg-compat-57')
options=('!lto')
source=("${url}/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        'fs56089.patch')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')
b2sums=('4602b3ea2cfad937219c1d69ebb5a2214a796ad41cb4b07ac07bdc5ee8d723bff2c3282eb466d8dfaf0a811bcc02276bfda3af9459dfc132010fafeb8e0be011'
        'SKIP'
        '42141778d3c18939b4f3c59a8163cecff3cedc02010f00a064948183b5aba4e51c9576ec2f559581a590360645a104c9a4abc272e120dbdf2891745d358bc009')

prepare() {
    cd ${srcdir}/ffmpeg-${pkgver}

    # https://bugs.archlinux.org/task/56089
    # Backport of http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=a606f27f4c610708fa96e35eed7b7537d3d8f712
    patch -Np1 -i ${srcdir}/fs56089.patch
}

build() {
    cd ${srcdir}/ffmpeg-${pkgver}

    [[ $CARCH == "armv7h" || $CARCH == "aarch64" ]] && local arch_specific_config='--host-cflags="-fPIC"'
    [[ $CARCH == "x86_64" ]] && local arch_specific_config='--enable-libmfx'

    ./configure \
        --prefix='/usr' \
        --incdir='/usr/include/ffmpeg3.4' \
        --libdir='/usr/lib/ffmpeg3.4' \
        --shlibdir='/usr/lib/ffmpeg3.4' \
        --disable-debug \
        --disable-doc \
        --disable-static \
        --disable-sndio \
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
        --enable-omx \
        "${arch_specific_config}"

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
