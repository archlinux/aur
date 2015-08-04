# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Cedric Brancourt <cedric.brancourt at gmail dot com>

pkgname=imagemagick-no-hdri
pkgver=6.9.0.6
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/"
license=('custom')
makedepends=('libltdl' 'lcms2' 'libxt' 'fontconfig' 'libxext' 'ghostscript' \
             'openexr' 'libwmf' 'librsvg' 'libxml2' 'jasper' 'liblqr' \
             'opencl-headers' 'libcl' 'libwebp')

#source=(http://www.imagemagick.org/download/ImageMagick-${pkgver%.*}-${pkgver##*.}.tar.xz)
source=(http://ftp.lfs-matrix.net/pub/blfs/conglomeration/ImageMagick/ImageMagick-${pkgver%.*}-${pkgver##*.}.tar.xz )
sha1sums=('0233275c2e35264da6c90c163c5436c928352478')

provides=('imagemagick')
conflicts=('imagemagick')

prepare() {
  cd ImageMagick-${pkgver%.*}-${pkgver##*.}
  sed '/AC_PATH_XTRA/d' -i configure.ac
  autoreconf --force --install
}

build() {
  cd ImageMagick-${pkgver%.*}-${pkgver##*.}
  ./configure --prefix=/usr --sysconfdir=/etc --with-modules --disable-static \
    --with-wmf --with-openexr --with-xml --with-lcms2 --with-jp2 \
    --with-webp --with-gslib --with-gs-font-dir=/usr/share/fonts/Type1 \
    --with-perl --with-perl-options="INSTALLDIRS=vendor" --with-lqr --with-rsvg \
    --enable-opencl --without-gvc --without-djvu --without-autotrace \
    --without-jbig --without-fpx --without-dps --without-fftw 
 make
}

check() {
  cd ImageMagick-${pkgver%.*}-${pkgver##*.}
  # checks realy takes a long time
  # make check
}

package() {
  pkgdesc="An image viewing/manipulation program"
  depends=('perl' 'libltdl' 'lcms2' 'libxt' 'fontconfig' 'libxext' 'liblqr' 'libcl')
  optdepends=('ghostscript: for Ghostscript support' 
              'openexr: for OpenEXR support' 
              'libwmf: for WMF support' 
              'librsvg: for SVG support' 
              'libxml2: for XML support' 
              'jasper: for JPEG-2000 support' 
              'libpng: for PNG support' 
	      'libwebp: for WEBP support')
  backup=("etc/ImageMagick-${pkgver%%.*}/coder.xml"
          "etc/ImageMagick-${pkgver%%.*}/colors.xml"
          "etc/ImageMagick-${pkgver%%.*}/delegates.xml"
          "etc/ImageMagick-${pkgver%%.*}/log.xml"
          "etc/ImageMagick-${pkgver%%.*}/magic.xml"
          "etc/ImageMagick-${pkgver%%.*}/mime.xml"
          "etc/ImageMagick-${pkgver%%.*}/policy.xml"
          "etc/ImageMagick-${pkgver%%.*}/quantization-table.xml"
          "etc/ImageMagick-${pkgver%%.*}/thresholds.xml"
          "etc/ImageMagick-${pkgver%%.*}/type.xml"
          "etc/ImageMagick-${pkgver%%.*}/type-dejavu.xml"
          "etc/ImageMagick-${pkgver%%.*}/type-ghostscript.xml"
          "etc/ImageMagick-${pkgver%%.*}/type-windows.xml")
  options=('!docs' 'libtool' '!emptydirs')

  cd ImageMagick-${pkgver%.*}-${pkgver##*.}
  make -j1 DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/imagemagick/LICENSE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/imagemagick/NOTICE"

#Cleaning
  rm -f "${pkgdir}"/usr/lib/*.la
}
