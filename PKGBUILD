# $Id$
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

_pkgname=ffmpeg
pkgname=ffmpeg-headless2.8
pkgver=2.8.8
pkgrel=2
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video; optimised for server (headless) systems'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url='http://ffmpeg.org/'
license=('GPL3') #enabling libfdk_aac makes ffmpeg incompatible with the GPL!
depends=('bzip2' 'fontconfig' 'fribidi' 'gnutls' 'gsm' 'lame' 'libass'
         'libbluray' 'libmodplug' 'libtheora' 'libwebp' 'opencore-amr'
         'openjpeg' 'opus' 'schroedinger' 'speex' 'v4l-utils' 'xvidcore' 'zlib'
         'libvorbis.so' 'libvorbisenc.so' 'libvpx.so' 'libx264.so' 'libx265.so'
         'rtmpdump')
optdepends=('dcadec: DTS Coherent Acoustics support'
            'vid.stab: Video stabilization library'
            'libfdk-aac: AAC-HE support'
            'libiec61883: FireWire DV/HDV support'
            'libavc1394: FireWire DV/HDV support'
            'netcdf: Binaural listening support'
            'libsoxr: SoX resampler library')
makedepends=('hardening-wrapper' 'yasm')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
          'libswscale.so' "ffmpeg2.8")
conflicts=('ffmpeg2.8')
replaces=('ffmpeg2.8')
source=(https://ffmpeg.org/releases/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('f94e2f71aacd1fdb1e28aac8cf36aa457c13b0fc9bf704b467d91489705d2199')

build() {
  cd ${_pkgname}-${pkgver}

  ./configure \
    --prefix='/usr' \
    --incdir='/usr/include/ffmpeg2.8' \
    --libdir='/usr/lib/ffmpeg2.8' \
    --shlibdir='/usr/lib/ffmpeg2.8' \
    --docdir='/usr/share/doc/ffmpeg2.8' \
    --datadir='/usr/share/ffmpeg2.8' \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-avisynth \
    --enable-avresample \
    --enable-fontconfig \
    --enable-gnutls \
    --enable-gpl \
    --enable-libass \
    --enable-libbluray \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libschroedinger \
    --enable-libspeex \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxvid \
    --enable-shared \
    --enable-version3 \
    --enable-librtmp \
    --disable-ffplay \
    --enable-runtime-cpudetect #\
    #--enable-libdcadec \
    #--enable-libiec61883
    #--enable-libsoxr \
    #--enable-libvidstab \
    #--enable-netcdf \
    #--enable-libfdk_aac \
    #--enable-nonfree

  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # add version suffix to binaries so we dont conflict
  mv -v "${pkgdir}"/usr/bin/ffmpeg "${pkgdir}"/usr/bin/ffmpeg-2.8
  mv -v "${pkgdir}"/usr/bin/ffprobe "${pkgdir}"/usr/bin/ffprobe-2.8
  mv -v "${pkgdir}"/usr/bin/ffserver "${pkgdir}"/usr/bin/ffserver-2.8

  # not sure how to install versioned man pages, remove for now
  rm -rfv "${pkgdir}"/usr/share/man

  install -dm 755 "${pkgdir}"/etc/ld.so.conf.d
  echo -e '/usr/lib/\n/usr/lib/ffmpeg2.8/' > "${pkgdir}"/etc/ld.so.conf.d/ffmpeg2.8.conf
}
