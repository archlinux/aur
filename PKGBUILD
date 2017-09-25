# Maintainer: orumin <dev at orum.in>

pkgname=lib32-imagemagick
_basename=imagemagick
pkgver=6.9.9.5
pkgrel=2
pkgdesc="An image viewing/manipulation program (32-bit)"
arch=('x86_64')
url="http://www.imagemagick.org/"
license=('custom')
depends=('lib32-libltdl' 'lib32-lcms2' 'lib32-libxt' 'lib32-fontconfig'
         'lib32-libxext' 'lib32-liblqr' 'lib32-ocl-icd')
makedepends=('lib32-libltdl' 'lib32-lcms2' 'lib32-libxt' 'lib32-fontconfig'
             'lib32-libxext' 'ghostscript' 'lib32-openexr' 'lib32-libwmf'
             'lib32-librsvg' 'lib32-libxml2' 'lib32-liblqr' 'lib32-openjpeg2' 'lib32-libraw'
             'opencl-headers' 'lib32-ocl-icd' 'lib32-libwebp' 'subversion' 'lib32-glu' 'git' 'imagemagick')
optdepends=('imagemagick-doc: for additional information'
            'ghostscript: for Ghostscript support' 
            'openexr: for OpenEXR support' 
   	        'openjpeg2: for JP2 support' 
            'libwmf: for WMF support' 
            'librsvg: for SVG support' 
            'libxml2: for XML support' 
            'libpng: for PNG support' 
	        'libwebp: for WEBP support')
options=('!docs' 'libtool' '!emptydirs')

source=(http://www.imagemagick.org/download/releases/ImageMagick-${pkgver%.*}-${pkgver##*.}.tar.xz{,.asc}
        perlmagick.rpath.patch)
sha1sums=('1241b0cbc87fffb471a30cade2d87dea533eeba3'
          'SKIP'
          'e143cf9d530fabf3b58023899b5cc544ba93daec')
validpgpkeys=('D8272EF51DA223E4D05B466989AB63D48277377A')

prepare() {
  cd ImageMagick-${pkgver%.*}-${pkgver##*.}
  sed '/AC_PATH_XTRA/d' -i configure.ac
  autoreconf --force --install
  patch -p0 -i "${srcdir}/perlmagick.rpath.patch"
}

build() {
  cd ImageMagick-${pkgver%.*}-${pkgver##*.}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --sysconfdir=/etc --with-modules \
    --build=i686-pc-linux-gnu --libdir=/usr/lib32 \
    --enable-hdri --with-wmf --with-openexr --with-xml \
    --with-webp --with-gslib --with-gs-font-dir=/usr/share/fonts/Type1 \
    --with-lqr --with-rsvg --enable-opencl --with-openjp2 --without-gvc \
    --without-djvu --without-autotrace \
    --without-jbig --without-fpx --without-dps --without-fftw
  make
}

check() {
  cd ImageMagick-${pkgver%.*}-${pkgver##*.}
#  make check
}

package() {
  cd ImageMagick-${pkgver%.*}-${pkgver##*.}
  make -j1 DESTDIR="${pkgdir}" install

#Cleaning
  rm -f "${pkgdir}"/usr/lib32/*.la
  rm -rf "${pkgdir}"/usr/bin
  rm -rf "${pkgdir}"/usr/include
  rm -rf "${pkgdir}"/usr/share
  rm -rf "${pkgdir}"/etc

# template end;
}
