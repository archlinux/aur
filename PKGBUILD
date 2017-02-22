# Maintainer:  epitron <chris@ill-logic.com>
# Contributor: Kamran Mackey <kamranm1200@gmail.com>
# Contributor: richteer <richteer at lastprime.net>
# Contributor: DrZaius <lou at fakeoutdoorsman.com>

pkgname=ffmpeg-qsv-git
pkgver=3.3.r83607.gc9e3952b82
pkgrel=1
pkgdesc="Complete solution to record, convert and stream audio and video (git version, with Intel Quick Sync Video hardware acceleration)"
arch=('i686' 'x86_64')
license=('GPL3' 'Non-free')
url="http://ffmpeg.org/"
depends=('alsa-lib' 'bzip2' 'fontconfig' 'fribidi' 'gmp' 'gnutls' 'gsm' 'lame'
         'libass' 'libavc1394' 'libbluray' 'libiec61883' 'libmodplug' 'libpulse'
         'libsoxr' 'libssh' 'libtheora' 'libva' 'libvdpau' 'libwebp'
         'netcdf' 'opencore-amr' 'openjpeg' 'opus' 'schroedinger' 'sdl' 'speex'
         'v4l-utils' 'xvidcore' 'zlib'  'libvidstab.so' 'libvorbis.so' 'libvorbisenc.so'
         'libvpx.so' 'libx264.so' 'libx265.so' 'libfdk-aac'
         'intel-media-sdk')
makedepends=('hardening-wrapper' 'ladspa' 'libvdpau' 'yasm' 'git')
optdepends=('ladspa: LADSPA filters')
provides=('ffmpeg' 'libavcodec.so' 'libavdevice.so' 'libavfilter.so'
          'libavformat.so' 'libavresample.so' 'libavutil.so' 'libpostproc.so'
          'libswresample.so' 'libswscale.so')
conflicts=('ffmpeg' 'ffmpeg-full-git')
source=("$pkgname"::'git://source.ffmpeg.org/ffmpeg.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  _ver="$(git describe --tags | sed 's|-[^.]*$||' | sed 's|^n||')"
  _rev="$(git rev-list --count HEAD)"
  _gitid="$(git rev-parse --short HEAD)"
  echo "${_ver}.r${_rev}.g${_gitid}"
}

build() {
  cd "$srcdir/$pkgname"

  PKG_CONFIG_PATH=/opt/intel/mediasdk/lib/pkgconfig/ \
  ./configure --prefix=/usr \
	      --disable-debug \
	      --disable-static \
	      --enable-libmfx \
        --enable-avisynth \
	      --enable-avresample \
	      --enable-fontconfig \
	      --enable-gnutls \
	      --enable-gpl \
	      --enable-ladspa \
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
	      --enable-libfdk-aac \
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
	      --enable-nonfree \
	      --enable-shared \
	      --enable-version3 \
	      --enable-x11grab \

  make EXTRA_CFLAGS="$CFLAGS"
  make tools/qt-faststart
  make doc/ff{mpeg,play,server}.1
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install install-man
  install -D -m755 tools/qt-faststart "$pkgdir/usr/bin/qt-faststart"
}

# vim: ts=8 sw=8 et:
