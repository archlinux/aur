# $Id$
# Maintainer: Gerad Munsch <gmunsch@unforgivendevelopment.com>
# Previous maintainer: Rudolf Polzer <divVerent[at]xonotic[dot]org>
# Original maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

# NOTE: This package was derived from 'ffmpeg-full', with some additional codecs
#       enabled, and brought up to date to extra/ffmpeg.

# NOTE before flagging this out of date: this PKGBUILD is supposed to have the
# same ffmpeg version as extra/ffmpeg. Once that one got updated, this one
# needs too.

pkgname=ffmpeg-full-extra
_pkgbasename=ffmpeg
pkgver=2.7.1
pkgrel=1
epoch=1
pkgdesc="Record, convert, and stream audio and video (all codecs; compatible to extra/ffmpeg)"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL' 'custom:UNREDISTRIBUTABLE')
depends=('alsa-lib' 'bzip2' 'celt' 'faac' 'fontconfig' 'fribidi' 'gnutls' 'gsm' 'jack' 'lame'
         'libaacplus' 'libass' 'libavc1394' 'libbluray' 'libcaca' 'libcdio-paranoia' 'libdc1394'
         'libfdk-aac' 'libiec61883' 'libmodplug' 'libpulse' 'libssh' 'libtheora' 'libva'
         'libvdpau' 'openal' 'opencore-amr' 'openjpeg' 'opus' 'schroedinger' 'sdl'
         'speex' 'twolame' 'v4l-utils' 'vo-aacenc' 'vo-amrwbenc' 'xvidcore' 'zlib'
         'libvorbisenc.so' 'libvorbis.so' 'libvpx.so' 'libx264.so' 'libx265.so')
makedepends=('libvdpau' 'yasm' 'pkg-config' 'hardening-wrapper')
conflicts=('ffmpeg' 'ffmpeg-full' 'ffmpeg-git' 'ffmpeg-full-git')
provides=('ffmpeg' 'qt-faststart')
source=(http://ffmpeg.org/releases/$_pkgbasename-$pkgver.tar.bz2{,.asc}
        'UNREDISTRIBUTABLE.txt')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')
sha256sums=('7e07b97d2415feeae9c9b5595e35e7b7aab33207e81bf9f8c0d1eece43f7f720'
            'SKIP'
            'e0c1b126862072a71e18b9580a6b01afc76a54aa6e642d2c413ba0ac9d3010c4')

build() {
  cd $_pkgbasename-$pkgver

  msg "Starting configure..."
  ./configure \
    --enable-shared \
    --disable-debug \
    --disable-static \
    --prefix=/usr \
    --enable-avresample \
    --enable-bzlib \
    --enable-fontconfig \
    --enable-gnutls \
    --enable-gpl \
    --enable-iconv \
    --enable-libass \
    --enable-libbluray \
    --enable-libcaca \
    --enable-libcdio \
    --enable-libcelt \
    --enable-libdc1394 \
    --enable-libfaac \
    --enable-libfdk-aac \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore-amrnb \
    --enable-libopencore-amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-libschroedinger \
    --enable-libspeex \
    --enable-libssh \
    --enable-libtheora \
    --enable-libtwolame \
    --enable-libv4l2 \
    --enable-libvo-aacenc \
    --enable-libvo-amrwbenc \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxvid \
    --enable-nonfree \
    --enable-openal \
    --enable-openssl \
    --enable-postproc\
    --enable-vaapi \
    --enable-vda \
    --enable-version3 \
    --enable-x11grab \
    --enable-zlib \

  msg "Starting make"
  make
  make tools/qt-faststart
  make doc/ff{mpeg,play,server}.1
}

package() {
  cd ffmpeg-$pkgver
  make DESTDIR="$pkgdir" install install-man
  install -Dm755 tools/qt-faststart "$pkgdir/usr/bin/qt-faststart"
  install -Dm644 "$srcdir"/UNREDISTRIBUTABLE.txt "$pkgdir/usr/share/licenses/$pkgname/UNREDISTRIBUTABLE.txt"
}

# How to audit the ./configure flags:
#
# cut -c 3- <<'# EOF' | sh
# cd src/ffmpeg-1.2
# export DISABLED='
# # debugging flags follow:
# --enable-coverage
# --enable-extra-warnings
# --enable-ftrapv
# --enable-memalign-hack
# --enable-memory-poisoning
# --enable-random
# --enable-xmm-clobber-test
# # we do not want this:
# --enable-cross-compile       # not cross building
# --enable-gray                # slow
# --enable-hardcoded-tables    # no advantage
# --enable-lto                 # slow build
# --enable-pic                 # not our job to decide this
# --enable-shared              # handled by options before --prefix
# --enable-small               # we want SPEED instead
# # this stuff does not build:
# --enable-frei0r              # circular dependency
# --enable-libaacplus          # does not build from AUR: configure.ac:8: error: "AM_CONFIG_HEADER": this macro is obsolete.
# --enable-libflite            # configure fail: /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/../../../../lib/libflite.a(au_alsa.o): In function "audio_open_alsa": (.text+0x20): undefined reference to "snd_pcm_hw_params_sizeof"
# --enable-libilbc             # configure fail: /tmp/ffconf.lccg5Ux6.c:1:18: fatal error: ilbc.h: No such file or directory
# --enable-libnut              # link fail: /usr/bin/ld: /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/../../../../lib/libnut.a(muxer.o): relocation R_X86_64_32S against ".rodata" can not be used when making a shared object; recompile with -fPIC
# --enable-libsoxr             # only as -git in AUR
# --enable-libstagefright-h264 # not in AUR
# --enable-libopencv           # circular dependency
# --enable-libutvideo          # compile fail: libavcodec/libutvideodec.cpp:64:18: error: "UTVF_RGB24_WIN" was not declared in this scope
# --enable-libxavs             # does not build from AUR: /usr/bin/ld: common/i386/deblock.o: relocation R_X86_64_32 against ".rodata" can not be used when making a shared object; recompile with -fPIC
# # this stuff is not for linux/x86:
# --enable-avisynth            # windows only
# --enable-sram                # not x86
# --enable-thumb               # not x86
# '
# ./configure --help | perl -ne 'for(/--enable-([0-9a-z-]+)\s/) { if($ENV{DISABLED} !~ /^--enable-$_\b/m) { print "    --enable-$_ \\\n"; } }' | sort -u
# EOF

# vim:set ts=2 sw=2 et:
