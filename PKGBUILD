# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Alessandro Pezzoni <alessandro_pezzoni@lavabit.com>

# Maintainer: AndyRTR <andyrtr@archlinux.org>

set -u
pkgname=ghostscript
pkgver=10.07.r11385.g8bfcbc50a
pkgrel=1
pkgdesc="An interpreter for the PostScript language"
url="https://www.ghostscript.com/"
arch=('x86_64')
license=('AGPL-3.0-or-later')
depends=('libxt' 'libcups' 'fontconfig' 'zlib' 'libpng' 'libjpeg-turbo' 'jbig2dec'
         'libtiff' 'lcms2' 'libpaper' 'ijs' 'openjpeg2' 'libidn' 'poppler-data'
         'cairo' 'glibc' 'libx11' 'gdk-pixbuf2' 'glib2' 'sh')
optdepends=('gtk3:              needed for gsx')
makedepends=('gtk3' 'gnutls' 'glu' 'freeglut')
#replaces=('ghostpcl' 'ghostxps')
conflicts=('ghostpcl' 'ghostxps')
# https://github.com/ArtifexSoftware/ghostpdl-downloads/releases
source=(https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${pkgver//./}/ghostscript-${pkgver}.tar.xz
        2010_add_build_timestamp_setting.patch)
# https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10051/SHA512SUMS
sha512sums=('SKIP'
            'cd7794ee4f28b11177021b950196385200b610127ed6cb94a45e3202b690b721a0dfcc0276ff39448d4dab64c1b31a76e6c323696a8315aad9edc22077f18a3d')

### update jbig2dec first! ###

_pkgver="${pkgver%%.r*}"
_pkgverm="${_pkgver%.*}"
_srcdir="ghostscript-${pkgver}"
_cvs=''
if :; then
  _cvs='-git'
  pkgname+="${_cvs}"
  makedepends+=('git')
  _srcdir='ghostpdl'
  source[0]='git://git.ghostscript.com/ghostpdl.git'
  #source[0]+='#commit=ce64b060279948da2a58e268190da0c520cac39a'
  sha512sums[0]='SKIP'
pkgver() {
  local -
  set -u
  cd "${_srcdir}"
  local _ver1="$(sed -n -e 's:^GS_VERSION_MAJOR=\(.\+\)$:\1:p' 'base/version.mak')"
  local _ver2="$(sed -n -e 's:^GS_VERSION_MINOR=\(.\+\)$:\1:p' 'base/version.mak')"
  local _rev="$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
  _rev="${_rev#ghostpdl.}"
  printf '%s.%s.%s' "${_ver1}" "${_ver2}" "${_rev}"
}
fi

prepare() {
  local -
  set -u
  cd "${_srcdir}"
  sed -e '/srcdir\/configure/ s@^@: #@g' -i 'autogen.sh'

  # *** remove after final decision ***
  # new in 9.54.0: 
  # https://www.ghostscript.com/doc/9.54.0/News.htm

  # 1) inclusion of the tesseract/leptonica sources for OCR capabilities
  # at the moment we do not support linking with tesseract/leptonica shared libraries. 
  # As is normal with such included libraries, deleting those directories and (re)running
  # configure (on Unix like systems) will automatically build without the OCR functionality.
  # increases package size ghostpcl 2.7->4.9MB | ghostscript 18->23MB | ghostxps 2,7->4.9MB
  # https://www.ghostscript.com/doc/9.54.0/VectorDevices.htm#UseOCR - 
  # this doesn't seem to be worth to keep enabled until linking with shared libs is supported
  rm -rf tesseract leptonica

  # 2) new directory addition in the source tree: "extract/". 
  # It contains the implementation for the writing of docx format files used by the
  # new "docxwrite" device. This is *not* a "thirdparty library". 
  # For distribution package maintainers, if you want your packaged Ghostscript to include
  # the "docxwrite" device, do not delete this directory.
  # ^ this one doesn't affect package size - so let's keep it

  # force it to use system-libs
  rm -r cups/libs ijs jbig2dec jpeg lcms2mt libpng openjpeg tiff zlib
  # using tree freetype because of https://bugs.archlinux.org/task/56849
  # lcms2mt is the new lcms2 fork aimed to replace lcms2 in a thread safe way
  
  # http://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=40dc5b409c6262b18b4bf5386b5482ead4c511e3
  # libs link unwanted to libgpdl that isn't installed
  rm -rf gpdl
  
  # Remove internal CMaps (CMaps from poppler-data are used instead)
  rm -r Resource/CMap

  # Debian: # allow the build timestamp to be externally set
  patch -Np1 -i ../2010_add_build_timestamp_setting.patch
  # fix build with gcc15
  # patch -Np1 -i ../gcc15.patch
}

build() {
  local -
  set -u
  cd "${_srcdir}"
  set -x

  if [ ! -s 'configure' ]; then
    NOCONFIGURE=1 ./autogen.sh
  fi

  if [ ! -s 'Makefile' ]; then
  # gcc14 buildfix
  # export CFLAGS+=" -Wno-incompatible-pointer-types -Wno-int-conversion"

  # fix #3 - fall back to GNU dialect of ISO C17 - from Fedora commit:
  # The code defines a custom 'bool' type (as an 'int'), which is incompatible
  # with C23 in which bool is a keyword, and trying to use <stdbool.h> fails
  # because 'int' and 'bool' are used interchangeably in the code.
  # see also https://bugs.ghostscript.com/show_bug.cgi?id=708608
  export CFLAGS="$CFLAGS -std=gnu17"

  ./configure --prefix=/usr \
              --with-ijs \
              --with-jbig2dec \
              --with-x \
              --with-drivers=ALL \
              --with-fontpath=/usr/share/fonts/gsfonts \
              --without-versioned-path \
              --enable-fontconfig \
              --enable-freetype \
              --enable-openjpeg \
              --with-system-libtiff \
              --with-libpaper \
              --disable-compile-inits #--help # needed for linking with system-zlib
  fi
  make so
}

package() {
  local -
  set -ux
  local pkgver="${_pkgver}"
  provides=("ghostscript=${_pkgver}")
  conflicts=('ghostscript')
  cd "${_srcdir}"

  make -j1 DESTDIR="${pkgdir}" soinstall

  # gsc collides with gambit gambit-c
  mv "${pkgdir}"/usr/bin/{gsc,gs}
  ln -s gs "${pkgdir}"/usr/bin/ghostscript
  ln -s /usr/share/man/man1/gs.1.gz "${pkgdir}"/usr/share/man/man1/ghostscript.1

  # remove obsolete lpr bsd/Unix related files
  rm -rv "${pkgdir}"/usr/bin/{lprsetup.sh,unix-lpr.sh}

  # install the CMaps from poppler-data
  # mkdir "${pkgdir}"/usr/share/ghostscript/Resource
  ln -s /usr/share/poppler/cMap "${pkgdir}"/usr/share/ghostscript/Resource/CMap

  install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m644 LICENSE

  rm "${pkgdir}/usr/lib"/libgxps.so* "${pkgdir}/usr/bin/gxpsc"
  rm "${pkgdir}/usr/lib"/libgpcl6.so* "${pkgdir}/usr/bin/gpcl6c"
  #rm "${pkgdir}/usr/lib"/libgpdl.so* "${pkgdir}/usr/bin/gpdlc"
}
set +u
