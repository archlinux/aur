# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# From core package
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

set -u
pkgname=imagemagick
pkgname+='-git'
pkgver=7.1.2.8.r35.g85c04c1
_pkgver=${pkgver%.*}-${pkgver##*.}
_pkgver="${pkgver%%.r*}"
_pkgver="${_pkgver%.*}-${_pkgver##*.}"
pkgrel=1
pkgdesc='An image viewing/manipulation program'
url='https://www.imagemagick.org/'
arch=(x86_64)
license=(custom)
license=('ImageMagick')
depends=(bzip2
         cairo
         fftw
         fontconfig
         freetype2
         gcc-libs
         glib2
         glibc
         lcms2
         liblqr
         libltdl
         libpng
         libraqm
         libxext
         libxml2
         xz
         zlib)
depends+=('libwmf' 'openjpeg2' 'perl' 'libraw' 'libultrahdr' 'libheif' 'libzip' 'djvulibre' 'libjxl' 'openexr' 'librsvg' 'pango' 'bash' 'libx11' 'jbigkit' 'libwebp' 'libtiff' 'libjpeg-turbo')
optdepends=('ghostscript: PS/PDF support'
            'jbigkit: JBIG support'
            'libheif: HEIF support'
            'libjpeg-turbo: JPEG support'
            'libjxl: JPEG XL support'
            'libraw: DNG support'
            'librsvg: SVG support'
            'libtiff: TIFF support'
            'libultrahdr: UHDR support'
            'libwebp: WEBP support'
            'libwmf: WMF support'
            'libzip: OpenRaster support'
            'ocl-icd: OpenCL support'
            'openexr: OpenEXR support'
            'openjpeg2: JPEG2000 support'
            'djvulibre: DJVU support'
            'pango: Text rendering')
options+=(!emptydirs libtool)
backup=(etc/ImageMagick-7/{colors,delegates,log,mime,policy,quantization-table,thresholds,type,type-{dejavu,ghostscript}}.xml)
provides=(libmagick)
makedepends=(chrpath
             djvulibre
             ghostscript
             git
             glu
             jbigkit
             libheif
             libjpeg-turbo
             libjxl
             libraw
             librsvg
             libultrahdr
             libwebp
             libwmf
             libzip
             ocl-icd
             opencl-headers
             openexr
             openjpeg2)
#makedepends+=('libxml2' 'ghostpcl' 'ghostxps' 'lcms2' 'libxext' 'liblqr' 'libraqm 'libpng')
#makedepends+=('libltdl' 'libxt' 'fontconfig')
checkdepends=(gsfonts
              ttf-dejavu)
replaces=(imagemagick-doc)
#_verwatch=("${url/script/download/}" 'ImageMagick-\([-0-9\.]\+\)\.tar\.bz2' 'l')
#_archlink='https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/imagemagick/trunk/@@@'
_srcdir='ImageMagick'
source=(git+https://github.com/ImageMagick/ImageMagick#tag=$_pkgver)
source+=(
  #"${_archlink//@@@/arch-fonts.diff}" # Fix up typemaps to match our packages, where possible
)
md5sums=('49b7f8e2106e814dda6c121d4b1fe224')
sha256sums=('3468666570fab914250c05f4ade6f9843d021e5bfe66a7f1c0ed4039f90cbc42')
#validpgpkeys=('D8272EF51DA223E4D05B466989AB63D48277377A')  # Lexie Parsimoniae
#validpgpkeys=(C305FEBD4C4081119CB3C12CE640E67B2C7F96AA)  # Dirk Lemstra <dirk@lemstra.org>

# optdepends in makedepends makes namcap complain
_clean_opt() {
  local _md _od _odc _oda=("${optdepends[@]}")
  optdepends=()
  for _od in "${_oda[@]}"; do
    _odc="${_od%%:*}"
    for _md in "${makedepends[@]}" "${depends[@]}"; do
      #printf 'Check %s %s\n' "${_md}" "${_odc}"
      if [ "${_md}" = "${_odc}" ]; then
        #printf 'Kill %s\n' "${_od}"
        _od=''
        break
      fi
    done
    if [ ! -z "${_od}" ]; then
      optdepends+=("${_od}")
    fi
  done
}
_clean_opt
#printf "optdepends+=('%s')\n" "${optdepends[@]}"; exit 1

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  source[0]='git+https://github.com/ImageMagick/ImageMagick.git'
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  conflicts=('imagemagick')
  provides=("imagemagick=${pkgver%%.r*}")
pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long --abbrev=7 | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}
elif [ "${pkgver%%.r*}" != "${pkgver}" ]; then
pkgver() {
  set -u
  printf '%s\n' "${pkgver%%.r*}"
  set +u
}
fi

prepare() {
  set -u
  cd "${_srcdir}"

  # Apply patches
  local _pt
  for _pt in "${source[@]%%::*}"; do
    _pt="${_pt##*/}"
    case "${_pt}" in
    *.patch)
      set +u; msg2 "*** Applying patch ${_pt}"; set -u
      patch --no-backup-if-mismatch -Np1 -i "${srcdir}/${_pt}"
      ;;
    esac
  done

  set +u
}

build() {
  set -u
  cd "${_srcdir}"
if [ ! -s 'Makefile' ]; then
  #autoreconf --force --install
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
    --enable-hdri \
    --enable-opencl \
    --without-gslib \
    --with-djvu \
    --with-fftw \
    --with-jxl \
    --with-lqr \
    --with-modules \
    --with-openexr \
    --with-openjp2 \
    --with-perl \
    --with-perl-options='INSTALLDIRS=vendor INSTALL_BASE=' \
    --with-rsvg \
    --with-uhdr \
    --with-webp \
    --with-wmf \
    --with-xml \
    --without-autotrace \
    --without-dps \
    --without-fpx \
    --without-gcc-arch \
    --without-gvc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
fi
  make
  set +u
}

check_disabled() {
  cd "${_srcdir}"
  ulimit -n 4096
  make check
}

package() {
  cd "${_srcdir}"
  make DESTDIR="$pkgdir" install

  find "$pkgdir/usr/lib/perl5" -name '*.so' -exec chrpath -d {} +
  rm "$pkgdir"/etc/ImageMagick-*/type-{apple,urw-base35,windows}.xml
  rm "$pkgdir"/usr/lib/*.la

  install -Dm644 LICENSE NOTICE -t "$pkgdir"/usr/share/licenses/$pkgname
}

set +u
