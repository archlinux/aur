# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=ffmpeg2.8
pkgver=2.8.21
pkgrel=2
pkgdesc='Complete solution to record, convert and stream audio and video'
arch=('x86_64')
url='https://ffmpeg.org/'
license=('GPL3')
options=('!lto')
depends=('alsa-lib' 'bzip2' 'fontconfig' 'fribidi' 'glibc' 'gmp' 'gnutls' 'gsm'
         'jack' 'lame' 'libmodplug' 'libpulse' 'libsoxr' 'libssh' 'libtheora'
         'libvdpau' 'libwebp' 'libx11' 'libxcb' 'libxext' 'libxv'
         'opencore-amr' 'openjpeg' 'opus' 'schroedinger' 'sdl' 'speex'
         'v4l-utils' 'xz' 'zlib'
         'libass.so' 'libbluray.so' 'dcadec' 'libfreetype.so' 'libva.so'
         'libvidstab.so' 'libvorbisenc.so' 'libvorbis.so' 'libvpx.so'
         'libx264.so' 'libx265.so' 'libxvidcore.so')
makedepends=('ladspa' 'yasm')
optdepends=('ladspa: LADSPA filters')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
          'libswscale.so')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        "mathops_shift.patch"::"https://github.com/FFmpeg/FFmpeg/commit/effadce6c756247ea8bae32dc13bb3e6f464f0eb.patch"
        "${pkgname}.conf")
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8') # ffmpeg-devel
sha256sums=('e5d956c19bff2aa5bdd60744509c9d8eb01330713d52674a7f650d54b570c82d'
            'SKIP'
            '8fad5f253bcda7a17523dbfcbfcfd60b3db23783dcdb65998005cddc7c7776c3'
            'f0d34b08843e3cba6276e234f1fc4e520e3a7c45d2b4450393a1a5dd9da49247')

prepare() {
  cd "ffmpeg-${pkgver}"
  # avcodec/x86/mathops
  # clip constants used with shift instructions with in inline assembly
  patch -Np1 -i "${srcdir}/mathops_shift.patch"
}

build() {
  cd "ffmpeg-${pkgver}"

  ./configure \
    --prefix='/usr' \
    --incdir='/usr/include/ffmpeg2.8' \
    --libdir='/usr/lib/ffmpeg2.8' \
    --shlibdir='/usr/lib/ffmpeg2.8' \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --disable-htmlpages \
    --enable-avisynth \
    --enable-avresample \
    --enable-fontconfig \
    --enable-gnutls \
    --enable-gpl \
    --enable-ladspa \
    --enable-libass \
    --enable-libbluray \
    --enable-libdcadec \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-libschroedinger \
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
    --enable-libxvid \
    --enable-shared \
    --enable-version3 \
    --enable-x11grab
  make
}

package() {
  cd "ffmpeg-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/share

  find "${pkgdir}/usr/bin" -type f -exec mv "{}" "{}2.8" \;

  install -m 755 -d "${pkgdir}/etc/ld.so.conf.d"
  install -m 644 -t "${pkgdir}/etc/ld.so.conf.d" "${srcdir}/${pkgname}.conf"
}

