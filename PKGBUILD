# Maintainer: envolution
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgbase=imagemagick6
pkgname=libmagick6
pkgver=6.9.13.35
_pkgver="${pkgver%.*}-${pkgver##*.}"
pkgrel=1
pkgdesc="An image viewing/manipulation program (legacy 6.9.13-* series)"
url="https://legacy.imagemagick.org/"
arch=('x86_64')
license=('custom')
depends=(
  'fontconfig'
  'lcms2'
  'liblqr'
  'libltdl'
  'libpng'
  'libraqm'
  'libxext'
  'libxml2'
)
makedepends=(
  'chrpath'
  'djvulibre'
  #  'ghostpcl'
  'ghostscript'
  #  'ghostxps'
  'glu'
  'jbigkit'
  'libheif'
  'libjxl'
  'libraw'
  'librsvg'
  'libwebp'
  'libwmf'
  'libzip'
  'ocl-icd'
  'opencl-headers'
  'openexr'
  'openjpeg2'
)
checkdepends=(
  'gsfonts'
  'ttf-dejavu'
)
source=("https://legacy.imagemagick.org/archive/releases/ImageMagick-${_pkgver}.tar.gz"{,.asc}
  'arch-fonts.diff')
sha256sums=('da69dd48d296619d9bf8e6a49e180fd56da224d4906b7cb2658a2dc47b0be3d6'
            'SKIP'
            'a85b744c61b1b563743ecb7c7adad999d7ed9a8af816650e3ab9321b2b102e73')
validpgpkeys=('D8272EF51DA223E4D05B466989AB63D48277377A') # Lexie Parsimoniae (ImageMagick code signing key) <lexie.parsimoniae@imagemagick.org>

shopt -s extglob

prepare() {
  mkdir -p binpkg/usr/lib/pkgconfig {binpkg,docpkg}/usr/share

  cd "ImageMagick-${_pkgver}"

  # Fix up typemaps to match our packages, where possible
  patch -p1 -i ../arch-fonts.diff
}

build() {
  cd "ImageMagick-${_pkgver}"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT PERL_MB_OPT PERL_MM_OPT
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
  cd "ImageMagick-${_pkgver}"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT PERL_MB_OPT PERL_MM_OPT
  ulimit -n 4096
  make check || :
)

package_libmagick6() {
  pkgdesc="${pkgdesc/)/; library)}"
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
  options=('!emptydirs' 'libtool')
  backup=(etc/ImageMagick-6/{coder,colors,delegates,log,magic,mime,policy,quantization-table,thresholds,type,type-{dejavu,ghostscript}}.xml)

  cd "ImageMagick-${_pkgver}"
  make DESTDIR="$pkgdir" install pkgconfigdir="/usr/lib/$pkgbase/pkgconfig"

  rm "$pkgdir"/etc/ImageMagick-6/type-{apple,urw-base35,windows}.xml
  rm "$pkgdir"/usr/lib/*.la

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE NOTICE

  # Drop tools
  cd ../binpkg
  mv "$pkgdir/usr/bin" usr/
  mv "$pkgdir/usr/lib/perl5" usr/lib/
  mv "$pkgdir/usr/share/man" usr/share/

  # Harden security policy https://bugs.archlinux.org/task/62785
  sed -e '/<\/policymap>/i \ \ <policy domain="delegate" rights="none" pattern="gs" \/>' -i \
    "$pkgdir"/etc/ImageMagick-6/policy.xml
}
# vim:set ts=2 sw=2 et:
