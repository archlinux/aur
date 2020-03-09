# Maintainer: Suchan Roland <snrd at arcor dot de>

pkgname=ffmpeg21
pkgver=2.1
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video'
arch=('i586' 'x86_64')
url='https://ffmpeg.org/'
license=('GPL2')
depends=(
  x264
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

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --incdir=/usr/include \
    --shlibdir=/usr/lib \
    --enable-gpl \
    --enable-static \
    --enable-shared \
    --disable-yasm \
    --disable-doc \
    --enable-libx264
    
    make clean
    make "-j$(nproc)" || return 1
}

package() {
  cd ffmpeg-${pkgver}

  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/bin/ffprobe
  rm -rf "$pkgdir"/usr/share

  find "${pkgdir}"/usr/bin -type f -exec mv {} {}21 \;
}
