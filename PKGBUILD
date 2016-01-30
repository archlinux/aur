# Maintainer:  PitBall

pkgname=lib32-ffmpeg-compat
pkgver=0.10.16
pkgrel=2
epoch=1
pkgdesc='Complete and free Internet live audio and video broadcasting solution (32bit)'
arch=('x86_64')
url='http://ffmpeg.org/'
license=('GPL')
depends=(
      'lib32-gsm' 'lib32-lame' 'lib32-libass' 'lib32-libmodplug' 'lib32-libpulse'
      'lib32-libtheora' 'lib32-libva' 'lib32-opencore-amr' 'lib32-openjpeg' 'lib32-rtmpdump'
      'lib32-schroedinger' 'lib32-sdl' 'lib32-speex' 'lib32-v4l-utils' 'lib32-xvidcore'
      'lib32-libvpx'  'lib32-jack' 'lib32-libx264')
makedepends=('lib32-libvdpau' 'gcc-multilib' 'yasm')
source=(http://ffmpeg.org/releases/ffmpeg-$pkgver.tar.bz2
        ffmpeg-0.10-libvpx-1.5.patch)
sha256sums=('e77823cbd58dfdb61f88059476070bc432d80e3821c14abcf804ef709d2f3fd1'
            'd6797973889582b82b7c81b91a39c222e09b5ccf8a7e031c364ae1e9275a497d')


prepare() {
  cd ffmpeg-$pkgver
  patch -p1 -i ../ffmpeg-0.10-libvpx-1.5.patch
}

build() {
  cd ffmpeg-$pkgver

  PKG_CONFIG_PATH="/usr/lib32/pkgconfig" \
  CFLAGS+=" -I/usr/include/openjpeg-1.5" \
  ./configure \
    --prefix=/usr \
    --cc="gcc -m32" \
    --libdir=/usr/lib32/ffmpeg-compat \
    --shlibdir=/usr/lib32/ffmpeg-compat \
    --disable-debug \
    --disable-static \
    --enable-gpl \
    --enable-libass \
    --enable-libfreetype \
    --enable-libgsm \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libpulse \
    --enable-librtmp \
    --enable-libschroedinger \
    --enable-libspeex \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libx264 \
    --enable-libxvid \
    --enable-postproc \
    --enable-runtime-cpudetect \
    --enable-shared \
    --enable-vdpau \
    --enable-version3 \
    --enable-x11grab

  make
}

package() {
  cd ffmpeg-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/{include,share,bin}

  install -dm755 "$pkgdir"/etc/ld.so.conf.d/
  echo -e '/usr/lib32/\n/usr/lib32/ffmpeg-compat/' > "$pkgdir"/etc/ld.so.conf.d/$pkgname.conf
}
