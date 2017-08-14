# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# From core package
# Contributor: Eric Bélanger <eric@archlinux.org>

set -u
_pkgname='imagemagick'
pkgbase="${_pkgname}-git"
#_srcdir="${pkgbase}"
_srcdir='ImageMagick'
pkgname=("${pkgbase}"{,-doc})
pkgver=7.0.6.7.r12351.geaada474d
pkgrel=1
pkgdesc='An image viewing/manipulation program'
arch=('i686' 'x86_64')
url='http://www.imagemagick.org/script/'
license=('custom')
makedepends=('libltdl' 'lcms2' 'libxt' 'fontconfig' 'libxext' 'ghostscript'
             'openexr' 'libwmf' 'librsvg' 'libxml2' 'liblqr' 'openjpeg2'
             'opencl-headers' 'ocl-icd' 'libwebp' 'patch' 'git')
_verwatch=("${url/script/download/}" 'ImageMagick-\([-0-9\.]\+\)\.tar\.bz2' 'l')
_archlink="@@@::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/@@@?h=packages/${_pkgname}"
source=(
  #"${_srcdir}::git+http://git.imagemagick.org/repos/ImageMagick.git"
  "git+https://github.com/ImageMagick/ImageMagick.git"
  'libpng_mmx_patch_x86_64.patch'
  "${_archlink//@@@/perlmagick.rpath.patch}"
)
sha256sums=('SKIP'
            '4f3ab23349fd3958a88eb09a7107e08c2c6f3953287907103ec48cfa83575e87'
            '17218bbecc17f3c7a86935a09d5a47e46113a1fc28f7d91c2fe495019cc36088')
#validpgpkeys=('D8272EF51DA223E4D05B466989AB63D48277377A')

pkgver() {
  set -u
  cd "${_srcdir}/"
  local _version="$(grep -o -m1 '[0-9]\+\.[0-9]\+\.[0-9\.-]\+' 'ChangeLog')"
  printf '%s.r%s.g%s' "${_version//-/.}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}/"
  #[ "${CARCH}" = 'x86_64' ] && patch -p1 -i "${srcdir}/libpng_mmx_patch_x86_64.patch"
  sed -e '/AC_PATH_XTRA/d' -i 'configure.ac'
  set +u
}

_configure() {
  set -u
  cd "${_srcdir}/"
  if [ ! -s 'Makefile' ]; then
    autoreconf --force --install
    patch -p0 -i "${srcdir}/perlmagick.rpath.patch"
    declare -A _EXTRAOPTS=([i686]='i686' [x86_64]='x86-64')
    #./configure --prefix='/usr' --sysconfdir='/etc' --with-modules --disable-static --enable-openmp --with-x --with-wmf --with-openexr --with-xml --with-gslib --with-gs-font-dir='/usr/share/fonts/Type1' --with-perl --with-perl-options='INSTALLDIRS=vendor' --without-gvc --with-djvu --without-autotrace --with-jp2 --with-jbig --without-fpx --without-dps --without-fftw
    ./configure --prefix='/usr' --sysconfdir='/etc' --with-modules \
      --enable-hdri --with-wmf --with-openexr --with-xml --with-lcms2 \
      --with-webp --with-gslib --with-gs-font-dir='/usr/share/fonts/Type1' \
      --with-perl --with-perl-options='INSTALLDIRS=vendor' --with-lqr --with-rsvg \
      --enable-opencl --with-openjp2 --without-gvc --without-djvu --without-autotrace \
      --without-jbig --without-fpx --without-dps --without-fftw --with-gcc-arch="${_EXTRAOPTS[${CARCH}]}"
    sed -e 's: -mtune=x86-64 : :g' -i 'Makefile' # This works even though the screen still shows the flags
  fi
  cd "${srcdir}"
  set +u
}

build() {
  _configure
  set -u
  cd "${_srcdir}/"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -s -j "${_nproc}"
  set +u
}

check() {
  cd "${_srcdir}/"
  #make -s -j1 check
}

package_imagemagick-git() {
  set -u
  pkgdesc='An image viewing/manipulation program'
  depends=('libltdl' 'lcms2' 'libxt' 'fontconfig' 'libxext' 'liblqr')
  optdepends=('imagemagick-doc: for additional information'
              'ghostscript: for Ghostscript support' 
              'openexr: for OpenEXR support' 
              'openjpeg2: for JP2 support' 
              'libwmf: for WMF support' 
              'librsvg: for SVG support' 
              'libxml2: for XML support' 
              'libpng: for PNG support' 
              'libwebp: for WEBP support')
  backup=("etc/ImageMagick-${pkgver%%.*}"/{coder,colors,delegates,log,magic,mime,policy,thresholds,type{,-dejavu,-ghostscript,-windows}})
  #options=('libtool' '!emptydirs' '!makeflags')
  options=('!docs' 'libtool' '!emptydirs')
  provides=("${_pkgname}=${pkgver%.r*}")
  conflicts=("${_pkgname}")

  cd "${_srcdir}/"
  make -s -j1 DESTDIR="${pkgdir}" install
  #install -d "${pkgdir}/usr/share/licenses/${_pkgname}/"
  install -Dpm644 'LICENSE' 'NOTICE' -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
  #Cleaning. Why are we deleting a file that says DO NOT DELETE?
  #rm -f "${pkgdir}/usr/lib"/*.la
  #rm -rf "${pkgdir}/usr/share/doc/" # same as option !docs

  # This looks dangerous. Upgrading perl will remove ImageMagick
  if ! :; then
    # template start; name=perl-binary-module-dependency; version=1;
    if [ ! -z "$(find "${pkgdir}/usr/lib/perl5/" -name '*.so')" ]; then
      local _perlver_min="$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')"
      local _perlver_max="$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')"
      eval 'dep''ends+=("perl>=${_perlver_min}" "perl<${_perlver_max}")' # keep mksrcinfo from reading this
    fi
    # template end;
  fi
  set +u
}

package_imagemagick-git-doc() {
  set -u
  pkgdesc='The ImageMagick documentation (utilities manuals and libraries API)'
  provides=("${_pkgname}-doc")
  conflicts=("${_pkgname}-doc")
  depends=("${_pkgname}")

  cd "${_srcdir}/"
  make -s DESTDIR="${pkgdir}" install-data-html
  install -Dpm644 'LICENSE' 'NOTICE' -t "${pkgdir}/usr/share/licenses/${_pkgname}-doc/"
  set +u
}
set +u
