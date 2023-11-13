# Maintainer: Roland Suchan <snrd at arcor dot de>


pkgname=ffmpeg067-static
pkgver=0.6.7
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video'
arch=('i686' 'x86_64')
url='https://ffmpeg.org/'
license=('GPL2')
depends=(
  'bzip2'
)
provides=(
  'libavcodec.so'
  'libavdevice.so'
  'libavformat.so'
  'libavutil.so'
  'libswscale.so'
  'libavcodec.a'
  'libavdevice.a'
  'libavformat.a'
  'libavutil.a'
  'libswscale.a'
  'ffmpeg063'
)
options=('staticlibs')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.bz2")
md5sums=('2afecd1ef31053ef077bdb2d6a7402ce')

build() {
  cd ffmpeg-${pkgver}
  
  CFLAGS="${CFLAGS} -Wno-implicit-function-declaration" \

  ./configure \
    --prefix=/opt/ffmpeg067 \
    --libdir=/opt/ffmpeg067/lib \
    --incdir=/opt/ffmpeg067/include \
    --shlibdir=/opt/ffmpeg067/lib \
    --bindir=/opt/bin \
    --enable-gpl \
    --enable-static \
    --enable-shared \
    --disable-ffserver
    make clean
    make "-j$(nproc)" || return 1
}

package() {
  cd ffmpeg-${pkgver}

  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/opt/bin/ffprobe
  rm -rf "$pkgdir"/opt/ffmpeg067/share

  find "${pkgdir}"/opt/bin -type f -exec mv {} {}067 \;
}

