# Maintainer: Suchan Roland <snrd at arcor dot de>

pkgname=ffmpeg21
pkgver=2.1
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video'
arch=('i586' 'x86_64')
url='https://ffmpeg.org/'
license=('GPL2')
depends=(
  x264_152
)
provides=(

)
makedepends=(

)
options=('staticlibs')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.gz")
md5sums=('6dc14b2521eb956b2d3799717d6b0ed1')

build() {
  cd ffmpeg-${pkgver}

  sed -i 's@-Werror@@g' configure

  PKG_CONFIG_PATH="/usr/local/lib/pkgconfig" \
  ./configure \
    --prefix=/var/local \
    --libdir=/var/local/lib \
    --incdir=/var/local/include \
    --shlibdir=/var/local/lib \
    --enable-gpl \
    --enable-static \
    --enable-shared \
    --disable-yasm \
    --disable-doc \
    --enable-libx264 \
    --extra-ldflags=-L/usr/local/lib \
    --extra-cflags=-I/usr/local/include
    
    make clean
    make "-j$(nproc)" || return 1
}

package() {
  cd ffmpeg-${pkgver}

  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/var/local/bin/ffprobe
  rm -rf "$pkgdir"/var/local/share

  find "${pkgdir}"/var/local/bin -type f -exec mv {} {}21 \;
}
