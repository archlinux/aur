# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# From core package
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

set -u
_pkgname='imagemagick'
pkgbase="${_pkgname}-git"
#_srcdir="${pkgbase}"
_srcdir='ImageMagick'
pkgname=("${pkgbase}"{,-doc})
pkgver=7.0.8.45.r15636.g909488f04
pkgrel=1
pkgdesc='An image viewing/manipulation program'
arch=('x86_64')
url="https://www.imagemagick.org/"
license=(custom)
makedepends=('ghostscript' 'openexr' 'libwmf' 'librsvg' 'libxml2' 'openjpeg2' 'libraw' 'opencl-headers' 'libwebp'
             'chrpath' 'ocl-icd' 'glu' 'ghostpcl' 'ghostxps' 'libheif' 'jbigkit' 'lcms2' 'libxext' 'liblqr' 'libraqm' 'libpng')
#makedepends+=('libltdl' 'libxt' 'fontconfig')
makedepends+=('patch' 'git')
checkdepends=(gsfonts ttf-dejavu)
_relname=ImageMagick-${pkgver%%.*}
_verwatch=("${url/script/download/}" 'ImageMagick-\([-0-9\.]\+\)\.tar\.bz2' 'l')
_archlink="@@@::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/@@@?h=packages/${_pkgname}"
source=(
  #"${_srcdir}::git+http://git.imagemagick.org/repos/ImageMagick.git"
  "git+https://github.com/ImageMagick/ImageMagick.git"
  "${_archlink//@@@/arch-fonts.diff}"
  "${_archlink//@@@/IM7-GS-policy.patch}"
)
sha256sums=('SKIP'
            'a85b744c61b1b563743ecb7c7adad999d7ed9a8af816650e3ab9321b2b102e73'
            'f20c09860da65a4259ec9627ceeca7d993949b7460fa199c5ffd874633814cf6')
#validpgpkeys=('D8272EF51DA223E4D05B466989AB63D48277377A')  # Lexie Parsimoniae

pkgver() {
  set -u
  cd "${_srcdir}/"
  local _version="$(grep -o -m1 '[0-9]\+\.[0-9]\+\.[0-9\.-]\+' 'ChangeLog')"
  printf '%s.r%s.g%s' "${_version//-/.}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  set +u
}

prepare() {
  set -u
  mkdir -p docpkg/usr/share

  cd "${_srcdir}"

  # Fix up typemaps to match our packages, where possible
  patch -p1 -i ../arch-fonts.diff

  # Work around ghostscript security issues https://bugs.archlinux.org/task/59778
  patch -p1 -i ../IM7-GS-policy.patch
  set +u
}

_configure() {
  set -u
  cd "${_srcdir}"
if [ ! -s 'Makefile' ]; then
  autoreconf --force --install
  ./configure \
    --prefix='/usr' \
    --sysconfdir='/etc' \
    --with-dejavu-font-dir='/usr/share/fonts/TTF' \
    --with-gs-font-dir='/usr/share/fonts/gsfonts' \
    PSDelegate='/usr/bin/gs' \
    XPSDelegate='/usr/bin/gxps' \
    PCLDelegate='/usr/bin/gpcl6' \
    --enable-hdri \
    --enable-opencl \
    --with-gslib \
    --with-lqr \
    --with-modules \
    --with-openexr \
    --with-openjp2 \
    --with-perl \
    --with-perl-options='INSTALLDIRS=vendor' \
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
fi
  cd "${srcdir}"
  set +u
}

build() {
  _configure
  set -u
  cd "${_srcdir}"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -s -j "${_nproc}"
  set +u
}

check_disabled() {
  cd "${_srcdir}"
  ulimit -n 4096
  sed -e '/validate-formats/d' -i Makefile # these fail due to the security patch
  make -s -j1 check
}

package_imagemagick-git() {
  set -u
  depends=(libltdl lcms2 fontconfig libxext liblqr libraqm libpng libxml2)
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
              'pango: Text rendering'
              'imagemagick-doc: manual and API docs')
  options=(!emptydirs libtool)
  backup=(etc/$_relname/{colors,delegates,log,mime,policy,quantization-table,thresholds,type,type-{dejavu,ghostscript}}.xml)
  conflicts=(imagemagick6)
  provides=(libmagick)
  replaces=(imagemagick6 libmagick)
  provides+=("${_pkgname}=${pkgver%.r*}")
  conflicts+=("${_pkgname}")

  cd "${_srcdir}"
  make -s -j1 DESTDIR="${pkgdir}" install

  find "${pkgdir}/usr/lib/perl5" -name '*.so' -exec chrpath -d {} +
  rm "${pkgdir}"/etc/$_relname/type-{apple,urw-base35,windows}.xml
  rm "${pkgdir}"/usr/lib/*.la

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE NOTICE

# Split docs
  mv "${pkgdir}/usr/share/doc" "${srcdir}/docpkg/usr/share/"
  set +u
}

package_imagemagick-git-doc() {
  set -u
  pkgdesc+=" (manual and API docs)"
  provides=("${_pkgname}-doc")
  conflicts=("${_pkgname}-doc")
  depends=("${_pkgname}")

  mv docpkg/* "${pkgdir}"

  cd "${_srcdir}"
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE NOTICE
  set +u
}
set +u
