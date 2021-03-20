# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=imagemagick6
pkgname=(libmagick6)
pkgver=6.9.12.3
pkgrel=1
pkgdesc="An image viewing/manipulation program (version 6)"
url="https://legacy.imagemagick.org/"
arch=(x86_64)
license=(custom)
depends=(libltdl lcms2 fontconfig libxext liblqr libraqm libpng)
makedepends=(ghostscript openexr libwmf librsvg libxml2 openjpeg2 libraw opencl-headers libwebp libzip
             chrpath ocl-icd glu ghostpcl ghostxps libheif jbigkit)
checkdepends=(gsfonts ttf-dejavu)
_relname=ImageMagick-${pkgver%%.*}
_tarname=ImageMagick6-${pkgver%.*}-${pkgver##*.}
source=(https://github.com/ImageMagick/ImageMagick6/archive/${pkgver%.*}-${pkgver##*.}.tar.gz
        arch-fonts.diff)
sha256sums=('46f8e7224cd34aaab2de8e5221ed23d357d154ad63f1a6c28e4fa0a650537190'
            'a85b744c61b1b563743ecb7c7adad999d7ed9a8af816650e3ab9321b2b102e73')

prepare() {
  mkdir -p binpkg/usr/lib/pkgconfig {binpkg,docpkg}/usr/share

  cd $_tarname

  # Fix up typemaps to match our packages, where possible
  patch -Np1 -i ../arch-fonts.diff

  # Don't run auto(re)conf; assumes use of git
}

build() {
  cd $_tarname
  ./configure \
    PKG_CONFIG="/usr/bin/env PKG_CONFIG_PATH=/usr/lib/$pkgbase/pkgconfig pkg-config" \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-shared \
    --with-dejavu-font-dir=/usr/share/fonts/TTF \
    --with-gs-font-dir=/usr/share/fonts/gsfonts \
    PSDelegate=/usr/bin/gs \
    XPSDelegate=/usr/bin/gxps \
    PCLDelegate=/usr/bin/gpcl6 \
    --enable-hdri \
    --enable-opencl \
    --without-gslib \
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
    --without-djvu \
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
  make check || :
)

package_libmagick6() {
  pkgdesc="${pkgdesc/)/; library)}"
  optdepends=('ghostscript: PS/PDF support'
              'libheif: HEIF support'
              'libraw: DNG support'
              'librsvg: SVG support'
              'libwebp: WEBP support'
              'libwmf: WMF support'
              'libxml2: Magick Scripting Language'
              'ocl-icd: OpenCL support'
              'openexr: OpenEXR support'
              'openjpeg2: JPEG2000 support'
              'pango: Text rendering')
  backup=(etc/$_relname/{coder,colors,delegates,log,magic,mime,policy,quantization-table,thresholds,type,type-{dejavu,ghostscript}}.xml)
  options=('!docs' '!emptydirs' libtool)

  cd $_tarname
  make DESTDIR="$pkgdir" install pkgconfigdir="/usr/lib/$pkgbase/pkgconfig"

  rm "$pkgdir"/etc/$_relname/type-{apple,urw-base35,windows}.xml
  rm "$pkgdir"/usr/lib/*.la

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE NOTICE

# Drop tools
  cd ../binpkg
  mv "$pkgdir/usr/bin" usr/
  mv "$pkgdir/usr/lib/perl5" usr/lib/
  mv "$pkgdir/usr/share/man" usr/share/

# Harden security policy https://bugs.archlinux.org/task/62785
  sed -e '/<\/policymap>/i \ \ <policy domain="delegate" rights="none" pattern="gs" \/>' -i "$pkgdir"/etc/ImageMagick-6/policy.xml

# Use correct options for inkscape<1.0
  sed -e 's|--export-file|--export-png|' -i "$pkgdir"/etc/ImageMagick-6/delegates.xml
}
