# Maintainer: Roland Suchan <snrd at arcor dot de>

pkgname=ffmpeg2.1
pkgver=2.1
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video'
arch=('i586' 'x86_64')
url='https://ffmpeg.org/'
license=('GPL2')
depends=(
  #x264_152
)
provides=(

)
makedepends=(

)
options=('staticlibs')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.gz"
        '0024-fix-gcc13-binutils.patch'
       )
md5sums=('6dc14b2521eb956b2d3799717d6b0ed1'
         'aaace471c8fde060fa8bd3ef29bd88d4'
        )
        
options=('debug' '!lto')

prepare() {
  patch -d ffmpeg-2.1 -p1 -i "${srcdir}/0024-fix-gcc13-binutils.patch"
}


build() {
  cd ffmpeg-${pkgver}/libswresample/x86/
  sed -i 's@DECLARE_ALIGNED@DECLARE_ASM_CONST@g' resample_mmx.h

  cd ../../../ffmpeg-${pkgver}
  #sed -i 's@-Werror@@g' configure

  CFLAGS="${CFLAGS} -Wno-incompatible-pointer-types -Wno-implicit-function-declaration" \
  ./configure \
    --prefix=/opt \
    --libdir=/opt/lib/ffmpeg2.1 \
    --incdir=/opt/include/ffmpeg2.1 \
    --shlibdir=/opt/lib/ffmpeg2.1 \
    --bindir=/opt/bin \
    --enable-gpl \
    --enable-static \
    --enable-shared \
    --disable-yasm \
    --disable-doc \
    --extra-ldflags=-L/opt/lib \
    --extra-cflags=-I/opt/include
    #--enable-libx264
    
    make clean
    make "-j$(nproc)" || return 1
}

package() {
  cd ffmpeg-${pkgver}

  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/opt/bin/ffprobe
  rm -rf "$pkgdir"/opt/share/ffmpeg

  find "${pkgdir}"/opt/bin -type f -exec mv {} {}2.1 \;
}

