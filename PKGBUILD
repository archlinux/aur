# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tobias Göbel <kubax1983.at.gmail.dot.com>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Cedric Brancourt <cedric.brancourt at gmail dot com>

pkgname='imagemagick-no-hdri'
pkgver=7.1.0.39
pkgrel=1
pkgdesc='An image viewing/manipulation program'
url='https://www.imagemagick.org/'
arch=(i686 x86_64)
license=(custom)
depends=(libltdl lcms2 fontconfig libxext liblqr libraqm libpng libjxl libwmf)
makedepends=(ghostscript openexr libwmf librsvg libxml2 openjpeg2 libraw opencl-headers libwebp libzip libjxl highway
             chrpath ocl-icd glu ghostpcl ghostxps libheif jbigkit lcms2 libxext liblqr libraqm libpng djvulibre)
checkdepends=(gsfonts ttf-dejavu)
optdepends=('ghostscript: PS/PDF support'
            'libheif: HEIF support'
            'libraw: DNG support'
            'librsvg: SVG support'
            'libwebp: WEBP support'
            'libxml2: Magick Scripting Language'
            'libzip: OpenRaster support'
            'ocl-icd: OpenCL support'
            'openexr: OpenEXR support'
            'openjpeg2: JPEG2000 support'
            'djvulibre: DJVU support'
            'pango: Text rendering'
            'imagemagick-doc: manual and API docs')
_relname=ImageMagick-${pkgver%%.*}
_tarname=ImageMagick-${pkgver%.*}-${pkgver##*.}
source=("${url}archive/${_tarname}.tar.xz"{,.asc}
        arch-fonts.diff)
sha256sums=('a82c632449a790b6ad78d281b94bdb17a6054ed8afd4f2f21e8304b1f2d2416f'
            'SKIP'
            'a85b744c61b1b563743ecb7c7adad999d7ed9a8af816650e3ab9321b2b102e73')
validpgpkeys=(D8272EF51DA223E4D05B466989AB63D48277377A)  # Lexie Parsimoniae
options=(!docs !emptydirs libtool)
provides=(
  "imagemagick=${pkgver}"
  "libmagick=${pkgver}"
  "libmagick${pkgver%%.*}"
  'libMagick++-7.Q8.so'
  'libMagickCore-7.Q8.so'
  'libMagickWand-7.Q8.so'
)
conflicts=('imagemagick' 'imagemagick6')
backup=(etc/$_relname/{colors,delegates,log,mime,policy,quantization-table,thresholds,type,type-{dejavu,ghostscript}}.xml)

shopt -s extglob

prepare() {
  cd $_tarname

  # Fix up typemaps to match our packages, where possible
  patch -p1 -i ../arch-fonts.diff
}

build() {
  cd $_tarname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-shared \
    --disable-static \
    --with-dejavu-font-dir=/usr/share/fonts/TTF \
    --with-gs-font-dir=/usr/share/fonts/gsfonts \
    PSDelegate=/usr/bin/gs \
    XPSDelegate=/usr/bin/gxps \
    PCLDelegate=/usr/bin/gpcl6 \
    --disable-docs \
    --disable-hdri \
    --with-quantum-depth=8 \
    --enable-opencl \
    --without-gslib \
    --with-djvu \
    --with-jxl \
    --with-lqr \
    --with-modules \
    --with-openexr \
    --with-openjp2 \
    --with-perl \
    --with-perl-options=INSTALLDIRS=vendor \
    --with-rsvg \
    --with-webp \
    --with-wmf \
    --with-xml \
    --without-autotrace \
    --without-dps \
    --without-fftw \
    --without-fpx \
    --without-gcc-arch \
    --without-gvc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() (
  cd $_tarname
  ulimit -n 4096
  make check
)

package() {
  cd $_tarname
  make DESTDIR="$pkgdir" install

  find "$pkgdir/usr/lib/perl5" -name '*.so' -exec chrpath -d {} +
  rm "$pkgdir"/etc/$_relname/type-{apple,urw-base35,windows}.xml
  rm "$pkgdir"/usr/lib/*.la

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE NOTICE
}
