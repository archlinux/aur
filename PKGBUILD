# Maintainer: orumin <dev at orum.in>

pkgname=lib32-imagemagick
_basename=imagemagick
pkgver=7.0.7.19
pkgrel=1
pkgdesc="An image viewing/manipulation program (32-bit)"
arch=('x86_64')
url="http://www.imagemagick.org/"
license=('custom')
depends=('lib32-libltdl' 'lib32-lcms2' 'lib32-libxt' 'lib32-fontconfig'
         'lib32-libxext' 'lib32-liblqr' 'lib32-ocl-icd' 'lib32-libraqm')
makedepends=('lib32-libltdl' 'lib32-lcms2' 'lib32-libxt' 'lib32-fontconfig'
             'lib32-libxext' 'ghostscript' 'lib32-openexr' 'lib32-libwmf'
             'lib32-librsvg' 'lib32-libxml2' 'lib32-liblqr' 'lib32-openjpeg2' 'lib32-libraw'
             'opencl-headers' 'lib32-ocl-icd' 'lib32-libwebp' 'subversion' 'lib32-glu' 'git' 'imagemagick')
checkdepends=(gsfonts ttf-dejavu)
_tarname=ImageMagick-${pkgver%.*}-${pkgver##*.}
options=('!docs' 'libtool' '!emptydirs' libtool)

source=(http://www.imagemagick.org/download/$_tarname.tar.xz{,.asc}
        arch-fonts.diff)
sha256sums=('5f1156824c37e5dde6ec37c5b1c51d9806f6d0e97aeaeb1e6907d7aba15951d9'
            'SKIP'
            'a85b744c61b1b563743ecb7c7adad999d7ed9a8af816650e3ab9321b2b102e73')
validpgpkeys=('D8272EF51DA223E4D05B466989AB63D48277377A') # Lexie Parsimoniae

shopt -s extglob

prepare() {
  cd $_tarname

  # Fix up typemaps to match our packages, where possible
  patch -Np1 -i "${srcdir}/arch-fonts.diff"

}

build() {
  cd $_tarname

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --sysconfdir=/etc \
    --build=i686-pc-linux-gnu --libdir=/usr/lib32 \
    --with-dejavu-font-dir=/usr/share/fotns/TTF \
    --with-gs-font-dir=/usr/share/fotns/gsfonts \
    PSDelegate=/usr/bin/gs \
    XPSDelegate=/usr/bin/gxps \
    PCLDelegate=/usr/bin/gpcl6 \
    --enable-hdri \
    --enable-opencl \
    --with-gslib \
    --with-lqr \
    --with-modules \
    --with-openexr \
    --with-openjp2 \
    --with-rsvg \
    --with-webp \
    --with-wmf \
    --with-xml \
    --without-autotrace \
    --without-djvu \
    --without-dps \
    --without-fftw \
    --without-fpx \
    --without-gcc-arch \
    --without-gvc \
    --without-jbig
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $_tarname
  ulimit -n 4096
  make check
}

package() {
  cd $_tarname
  make -j1 DESTDIR="${pkgdir}" install

#Cleaning
  rm -f "${pkgdir}"/usr/lib32/*.la
  rm -rf "${pkgdir}"/usr/bin
  rm -rf "${pkgdir}"/usr/include
  rm -rf "${pkgdir}"/usr/share
  rm -rf "${pkgdir}"/etc

# template end;
}
