# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=imagemagick6
_pkgver=6.9.12-82
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An image viewing/manipulation program (legacy 6.9.12-* series)"
url="https://legacy.imagemagick.org/"
arch=('x86_64')
license=('custom')
depends=('libltdl' 'lcms2' 'fontconfig' 'libxext' 'liblqr' 'libraqm' 'libpng' 'libxml2')
makedepends=('ghostscript' 'openexr' 'libwmf' 'librsvg' 'libxml2' 'openjpeg2' 'libraw' 'opencl-headers' 'libwebp' 'libzip' 'libjxl'
             'chrpath' 'ocl-icd' 'glu' 'ghostpcl' 'ghostxps' 'libheif' 'jbigkit' 'lcms2' 'libxext' 'liblqr' 'libraqm' 'libpng' 'djvulibre')
optdepends=('ghostscript: PS/PDF support'
            'libheif: HEIF support'
            'libjxl: JPEG XL support'
            'libraw: DNG support'
            'librsvg: SVG support'
            'libwebp: WEBP support'
            'libwmf: WMF support'
            'libxml2: Magick Scripting Language'
            'ocl-icd: OpenCL support'
            'openexr: OpenEXR support'
            'openjpeg2: JPEG2000 support'
            'djvulibre: DJVU support'
            'pango: Text rendering')
checkdepends=('gsfonts' 'ttf-dejavu')
options=('!emptydirs' 'libtool')
backup=(etc/ImageMagick-6/{coder,colors,delegates,log,magic,mime,policy,quantization-table,thresholds,type,type-{dejavu,ghostscript}}.xml)
provides=('libmagick6')
source=("https://legacy.imagemagick.org/archive/releases/ImageMagick-$_pkgver.tar.gz"{,.asc}
        'arch-fonts.diff')
sha256sums=('996100def63692fd265e967a4cc8890ef541dc2a585eab68a078088f21b1dbda'
            'SKIP'
            'a85b744c61b1b563743ecb7c7adad999d7ed9a8af816650e3ab9321b2b102e73')
validpgpkeys=('D8272EF51DA223E4D05B466989AB63D48277377A') # Lexie Parsimoniae (ImageMagick code signing key) <lexie.parsimoniae@imagemagick.org>

shopt -s extglob

prepare() {
  mkdir -p docpkg/usr/share

  cd ImageMagick-$_pkgver

  # Fix up typemaps to match our packages, where possible
  patch -p1 -i ../arch-fonts.diff
}

build() {
  cd ImageMagick-$_pkgver
  ./configure \
    PKG_CONFIG="/usr/bin/env PKG_CONFIG_PATH=/usr/lib/$pkgbase/pkgconfig pkg-config" \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-shared \
    --disable-static \
    --with-dejavu-font-dir=/usr/share/fonts/TTF \
    --with-gs-font-dir=/usr/share/fonts/gsfonts \
    PSDelegate=/usr/bin/gs \
    XPSDelegate=/usr/bin/gxps \
    PCLDelegate=/usr/bin/gpcl6 \
    --enable-hdri \
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
  cd ImageMagick-$_pkgver
  ulimit -n 4096
  make check || :
)

package() {
  cd ImageMagick-$_pkgver
  make DESTDIR="$pkgdir" install pkgconfigdir="/usr/lib/$pkgbase/pkgconfig"

  find "$pkgdir/usr/lib/perl5" -name '*.so' -exec chrpath -d {} +
  rm "$pkgdir"/etc/ImageMagick-6/type-{apple,urw-base35,windows}.xml
  rm "$pkgdir"/usr/lib/*.la

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE NOTICE
}
