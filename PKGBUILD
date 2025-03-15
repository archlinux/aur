# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>

_name="ghostscript"
pkgbase="lib32-${_name}"
pkgname=('lib32-ghost'{'script','xps','pcl'})
pkgver=10.05.0
pkgrel=1
pkgdesc="An interpreter for the PostScript language (32-bit)"
arch=('x86_64')
url="https://www.ghostscript.com"
license=('AGPL-3.0-or-later')
depends=("${_name}>=${pkgver}" 'lib32-fontconfig' 'lib32-gcc-libs'
         'lib32-glibc' 'lib32-ijs' 'lib32-jbig2dec' 'lib32-lcms2'
         'lib32-leptonica' 'lib32-libcups' 'lib32-libjpeg-turbo'
         'lib32-libpaper' 'lib32-libpng' 'lib32-libtiff' 'lib32-libx11'
         'lib32-libxt' 'lib32-openjpeg2' 'lib32-tesseract>=4.1' 'lib32-zlib')
makedepends=('lib32-expat' 'lib32-libidn' 'lib32-gtk3')
options=('!lto')
_pkgsrc="ghostpdl-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${pkgver//./}/${_pkgsrc}.tar.xz"
        '2010_add_build_timestamp_setting.patch')
sha512sums=('01d59cd7e062f4653095f31d4648226a4d40627a99d3eae44f8f67a3cb586f013e9d37550a3485cd204beecddff1026307d3329f9025a9cd536fb54bfc37ba74'
            'cd7794ee4f28b11177021b950196385200b610127ed6cb94a45e3202b690b721a0dfcc0276ff39448d4dab64c1b31a76e6c323696a8315aad9edc22077f18a3d')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
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
  rm -rf cups/libs expat ijs jbig2dec jpeg lcms2mt libpng openjpeg tiff zlib
  # using tree freetype because of https://bugs.archlinux.org/task/56849
  # lcms2mt is the new lcms2 fork aimed to replace lcms2 in a thread safe way
  
  # http://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=40dc5b409c6262b18b4bf5386b5482ead4c511e3
  # libs link unwanted to libgpdl that isn't installed
  rm -rf gpdl
  
  # Remove internal CMaps (CMaps from poppler-data are used instead)
  rm -rf Resource/CMap

  # Debian: # allow the build timestamp to be externally set
  patch -Np1 -i "${srcdir}/2010_add_build_timestamp_setting.patch"
}

build() {
  export CFLAGS+=" -m32 -Wno-incompatible-pointer-types -Wno-int-conversion"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32" # -Wl,--no-warn-search-mismatch
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh \
    --prefix='/usr' \
    --program-suffix='-32' \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu \
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
  make so-only
}

package_lib32-ghostscript() {
  depends+=('lib32-libidn')

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install-so-gs

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}

package_lib32-ghostxps() {
  pkgdesc="${pkgdesc/PostScript/XPS document}"
  depends+=('lib32-expat')

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install-so-gxps

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"

  # fix file conflict - FS#70238
  cd "lib32"
  rm -f "libgxps.so"
}

package_lib32-ghostpcl() {
  pkgdesc="${pkgdesc/PostScript/PCL 6}"

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install-so-gpcl6

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
