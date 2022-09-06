# Maintainer: Roland Suchan <snrd at arcor dot de>


pkgname=ffmpeg063-static
pkgver=0.6.3
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
md5sums=('cdf4ad9b2a4d195b5ca874494bc7b0b0')

build() {
  cd ffmpeg-${pkgver}
  
  sed -i 's@-Werror@@g' configure

  ./configure \
    --prefix=/opt/local \
    --libdir=/opt/local/lib \
    --incdir=/opt/local/include \
    --shlibdir=/opt/local/lib \
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
  rm -rf "$pkgdir"/opt/local/bin/ffprobe
  rm -rf "$pkgdir"/opt/local/share

  find "${pkgdir}"/opt/local/bin -type f -exec mv {} {}063 \;
}

