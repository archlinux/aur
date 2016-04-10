#
# Maintainer: Iacopo Isimbaldi <isiachi@rhye.it>
#

pkgname=ffmpeg-full
pkgver=3.0.1
pkgrel=1
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video (with all options)'
arch=('i686' 'x86_64')
url='http://ffmpeg.org/'
license=('GPL3' 'custom:UNREDISTRIBUTABLE')
depends=('alsa-lib' 'bzip2' 'fontconfig' 'fribidi' 'gnutls' 'gsm' 'lame'
         'libass' 'libavc1394' 'libbluray' 'libiec61883' 'libmodplug'
         'libpulse' 'libsoxr' 'libssh' 'libtheora' 'libva' 'libvdpau' 'libwebp'
         'opencore-amr' 'openjpeg' 'opus' 'schroedinger' 'sdl' 'speex'
         'v4l-utils' 'xvidcore' 'zlib'
         'libdcadec.so' 'libvidstab.so' 'libvorbis.so' 'libvorbisenc.so'
         'libvpx.so' 'libx264.so' 'libx265.so'
         'celt' 'chromaprint' 'faac' 'frei0r-plugins' 'jack' 'kvazaar' 'ladspa'
         'libbs2b' 'libcaca' 'libcdio-paranoia' 'libcl' 'libdc1394'
         'libfdk-aac' 'libgme'  'libmfx-git' 'libutvideo-git'
         'libxv' 'mesa' 'openal' 'opencl-headers' 'openh264' 'rubberband'
         'rtmpdump' 'shine' 'smbclient' 'snappy' 'tesseract' 'twolame' 'vid.stab'
         'vo-aacenc' 'vo-amrwbenc' 'wavpack' 'xavs' 'zeromq' 'zimg' 'zvbi')
makedepends=('hardening-wrapper' 'libvdpau' 'nvidia-sdk' 'yasm')
optdepends=('intel-media-sdk: for Intel QSV encoding/decoding')
conflicts=('ffmpeg' 'ffmpeg-git' 'ffmpeg-full-git')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
          'libswscale.so'
          'ffmpeg')
source=(http://ffmpeg.org/releases/ffmpeg-$pkgver.tar.bz2{,.asc}
        UNREDISTRIBUTABLE.txt)
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8') # ffmpeg-devel
sha256sums=('f7f7052c120f494dd501f96becff9b5a4ae10cfbde97bc2f1e9f0fd6613a4984'
            'SKIP'
            'e0c1b126862072a71e18b9580a6b01afc76a54aa6e642d2c413ba0ac9d3010c4')

build() {
  cd ${pkgname%-full}-$pkgver

  ./configure \
    --prefix=/usr \
    --extra-cflags="-I/usr/include/nvidia-sdk" \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-dxva2 \
    --enable-vaapi \
    --enable-vdpau \
    --enable-shared \
    --enable-avisynth \
    --enable-avresample \
    --enable-chromaprint \
    --enable-decoder=atrac3 \
    --enable-decoder=atrac3p \
    --enable-fontconfig \
    --enable-frei0r \
    --enable-gcrypt \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --enable-gray \
    --enable-ladspa \
    --enable-libass \
    --enable-libbluray \
    --enable-libbs2b \
    --enable-libcaca \
    --enable-libcdio \
    --enable-libcelt \
    --enable-libdc1394 \
    --enable-libdcadec \
    --enable-libfaac \
    --enable-libfdk-aac \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgme \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libkvazaar \
    --enable-libmfx \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore-amrnb \
    --enable-libopencore-amrwb \
    --enable-libopencv \
    --enable-libopenh264 \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-librtmp \
    --enable-librubberband \
    --enable-libschroedinger \
    --enable-libshine \
    --enable-libsmbclient \
    --enable-libsnappy \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libssh \
    --enable-libtesseract \
    --enable-libtheora \
    --enable-libtwolame \
    --enable-libutvideo \
    --enable-libv4l2 \
    --enable-libvidstab \
    --enable-libvo-amrwbenc \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwavpack \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxavs \
    --enable-libxcb \
    --enable-libxcb-shape \
    --enable-libxcb-shm \
    --enable-libxcb-xfixes \
    --enable-libxvid \
    --enable-libzimg \
    --enable-libzmq \
    --enable-libzvbi \
    --enable-nonfree \
    --enable-nvenc \
    --enable-openal \
    --enable-opencl \
    --enable-opengl \
    --enable-openssl \
    --enable-runtime-cpudetect \
    --enable-swresample \
    --enable-version3

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play,server}.1
}

package() {
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
