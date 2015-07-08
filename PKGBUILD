# $Id$
# Maintainer: Iacopo Isimbaldi <isiachi@rhyeworld.it>
# Original maintainer: Rudolf Polzer <divVerent[at]xonotic[dot]org>
# Original maintainer: Ionut Biru <ibiru@archlinux.org>
# Original maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

# NOTE before flagging this out of date: this PKGBUILD is supposed to have the
# same ffmpeg version as extra/ffmpeg. Once that one got updated, this one
# needs too.

pkgname=ffmpeg-full
pkgver=2.7.1
pkgrel=1
epoch=1
pkgdesc='Complete and free Internet live audio and video broadcasting solution (with all options)'
arch=('i686' 'x86_64')
url='http://ffmpeg.org/'
license=('GPL' 'custom:UNREDISTRIBUTABLE')
depends=(
      'alsa-lib' 'bzip2' 'fontconfig' 'gnutls' 'gsm' 'lame' 'libass' 'libvdpau'
      'libbluray' 'libmodplug' 'libpulse' 'libtheora' 'libva' 'opencore-amr'
      'openjpeg' 'opus' 'schroedinger' 'sdl' 'speex' 'v4l-utils' 'xvidcore'
      'zlib' 'fribidi' 'libssh'
      'libvorbisenc.so' 'libvorbis.so' 'libvpx.so' 'libx264.so' 'libx265.so'
      'celt' 'faac' 'frei0r-plugins' 'jack' 'ladspa' 'libaacplus'
      'libavc1394' 'libbs2b' 'libcaca' 'libcdio-paranoia' 'libcl' 'libdc1394'
      'libfdk-aac' 'libgme' 'libiec61883' 'libsoxr' 'libutvideo-git'
      'libwebp' 'libxv' 'mesa' 'openal' 'opencl-headers12' 'rtmpdump' 'shine' 'twolame'
      'vid.stab' 'vo-aacenc' 'vo-amrwbenc' 'wavpack' 'zeromq' 'zvbi' 
      )
makedepends=('libvdpau' 'yasm' 'hardening-wrapper')
conflicts=('ffmpeg' 'ffmpeg-git' 'ffmpeg-full-git')
provides=('ffmpeg')
source=(http://ffmpeg.org/releases/ffmpeg-$pkgver.tar.bz2{,.asc}
        UNREDISTRIBUTABLE.txt)
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8') # ffmpeg-devel
sha256sums=('7e07b97d2415feeae9c9b5595e35e7b7aab33207e81bf9f8c0d1eece43f7f720'
            'SKIP'
            'e0c1b126862072a71e18b9580a6b01afc76a54aa6e642d2c413ba0ac9d3010c4')

build() {
  #source /etc/profile.d/perlbin.sh
  cd ${pkgname%-full}-$pkgver

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-shared \
    --enable-avisynth \
    --enable-avresample \
    --enable-decoder=atrac3 \
    --enable-decoder=atrac3p \
    --enable-dxva2 \
    --enable-fontconfig \
    --enable-frei0r \
    --enable-gnutls \
    --enable-gpl \
    --enable-gray \
    --enable-ladspa \
    --enable-libaacplus \
    --enable-libass \
    --enable-libbluray \
    --enable-libbs2b \
    --enable-libcaca \
    --enable-libcdio \
    --enable-libcelt \
    --enable-libdc1394 \
    --enable-libfaac \
    --enable-libfdk-aac \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgme \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore-amrnb \
    --enable-libopencore-amrwb \
    --enable-libopencv \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-librtmp \
    --enable-libschroedinger \
    --enable-libshine \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libssh \
    --enable-libtheora \
    --enable-libtwolame \
    --enable-libutvideo \
    --enable-libv4l2 \
    --enable-libvidstab \
    --enable-libvo-aacenc \
    --enable-libvo-amrwbenc \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwavpack \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxvid \
    --enable-libzmq \
    --enable-libzvbi \
    --enable-nonfree \
    --enable-openal \
    --enable-opencl \
    --enable-opengl \
    --enable-openssl \
    --enable-runtime-cpudetect \
    --enable-shared \
    --enable-swresample \
    --enable-vdpau \
    --enable-version3 \
    --enable-x11grab

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play,server}.1
}

package() {
  #source /etc/profile.d/perlbin.sh
  cd ${pkgname%-full}-$pkgver
  make DESTDIR="$pkgdir" install install-man
  install -Dm755 tools/qt-faststart "$pkgdir"/usr/bin/qt-faststart
  install -Dm644 "$srcdir"/UNREDISTRIBUTABLE.txt "$pkgdir/usr/share/licenses/$pkgname/UNREDISTRIBUTABLE.txt"
}

# How to audit the ./configure flags:
#
# cut -c 3- <<'# EOF' | sh
# cd src/ffmpeg-2.2.1
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
# --enable-cross-compile          # not cross building
# --enable-gray                   # slow
# --enable-hardcoded-tables       # no advantage
# --enable-lto                    # slow build
# --enable-shared                 # handled by options before --prefix
# --enable-small                  # we want SPEED instead
# --enable-incompatible-fork-abi  # DO NOT WANT
# --enable-incompatible-libav-abi #
# --enable-neon-clobber-test      # debug stuff
# --enable-rpath                  # not needed
# --enable-raise-major            # incompatible
# # this stuff does not build:
# --enable-libflite               # configure fail: /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/../../../../lib/libflite.a(au_alsa.o): In function "audio_open_alsa": (.text+0x20): undefined reference to "snd_pcm_hw_params_sizeof"
# --enable-libilbc                # configure fail: /tmp/ffconf.lccg5Ux6.c:1:18: fatal error: ilbc.h: No such file or directory
# --enable-libnut                 # configure fail: ERROR: libnut not found (libnut-git installs no library)
# --enable-libquvi                # configure fail: ERROR: libquvi not found (wrong version)
# --enable-libshine               # configure fail: ERROR: libshine not found: /tmp/ffconf.K2xc6imx.c:2:53: error: ‘shine_encode_frame‘ undeclared (first use in this function)
# --enable-libstagefright-h264    # not in AUR
# --enable-libxavs                # does not build from AUR: /usr/bin/ld: common/i386/deblock.o: relocation R_X86_64_32 against ".rodata" can not be used when making a shared object; recompile with -fPIC
# --enable-decklink               # do not ask me, will try again later. which AUR package?
# # this stuff is not for linux/x86:
# --enable-sram                   # not x86
# --enable-thumb                  # not x86
# '
# ./configure --help | perl -ne 'for(/--enable-([0-9a-z-]+)\s/) { if($ENV{DISABLED} !~ /^--enable-$_\b/m) { print "    --enable-$_ \\\n"; } }' | sort -u
# EOF

# vim:set ts=2 sw=2 et:
