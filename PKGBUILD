# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>

_name="ghostscript"
pkgname="lib32-${_name}"
pkgver=10.05.1
pkgrel=2
pkgdesc="An interpreter for the PostScript language (32-bit)"
arch=('x86_64')
url="https://www.ghostscript.com"
_url="https://github.com/ArtifexSoftware/ghostpdl-downloads"
license=('AGPL-3.0-or-later')
depends=("${_name}>=${pkgver}" 'lib32-fontconfig' 'lib32-gcc-libs'
         'lib32-glibc' 'lib32-ijs' 'lib32-jbig2dec' 'lib32-lcms2'
         'lib32-leptonica' 'lib32-libcups' 'lib32-libidn' 'lib32-libjpeg-turbo'
         'lib32-libpaper' 'lib32-libpng' 'lib32-libtiff' 'lib32-libx11'
         'lib32-libxt' 'lib32-openjpeg2' 'lib32-tesseract>=4.1' 'lib32-zlib')
makedepends=('lib32-gtk3')
provides=('libgs.so') # 'lib32-ghost'{'xps','pcl'})
conflicts=('lib32-ghost'{'xps','pcl'})
replaces=('lib32-ghost'{'xps','pcl'})
options=('!lto')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.xz::${_url}/releases/download/gs${pkgver//./}/${_pkgsrc}.tar.xz"
        '2010_add_build_timestamp_setting.patch'
        'gcc15.patch')
sha512sums=('1a3f2b0f53db9a00a245df19ce8fdce0fbccc6fad47b64d14fc9058b494ab07c77e21bb073df8d4a2522b3ccb0df26735f8224a9e36c07367031ed2262fb26af'
            'cd7794ee4f28b11177021b950196385200b610127ed6cb94a45e3202b690b721a0dfcc0276ff39448d4dab64c1b31a76e6c323696a8315aad9edc22077f18a3d'
            '248ff8c61f8988286705aec0931b891287546db5d0e60564fa6878198490b0b7b8922d61ef9a1d059aade200e1a3c856b8d39cde04f9f67ec076a616d868aeac')

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
  rm -rf cups/libs ijs jbig2dec jpeg lcms2mt libpng openjpeg tiff zlib
  # using tree freetype because of https://bugs.archlinux.org/task/56849
  # lcms2mt is the new lcms2 fork aimed to replace lcms2 in a thread safe way
  
  # http://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=40dc5b409c6262b18b4bf5386b5482ead4c511e3
  # libs link unwanted to libgpdl that isn't installed
  rm -rf gpdl
  
  # Remove internal CMaps (CMaps from poppler-data are used instead)
  rm -rf Resource/CMap

  # Debian: allow the build timestamp to be externally set
  patch -Np1 -i "${srcdir}/2010_add_build_timestamp_setting.patch"
  patch -Np1 -i "${srcdir}/gcc15.patch"
}

build() {
  export CFLAGS+=" -m32 -Wno-incompatible-pointer-types -Wno-int-conversion"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local configure_options=(
    --prefix='/usr'
    --program-suffix='-32'
    --lib{exec,}dir='/usr/lib32'
    --build=i686-pc-linux-gnu
    --with-ijs
    --with-jbig2dec
    --with-x
    --with-drivers=ALL
    --with-fontpath='/usr/share/fonts/gsfonts'
    --without-versioned-path
    --enable-fontconfig
    --enable-freetype
    --enable-openjpeg
    --with-system-libtiff
    --with-libpaper
    --disable-compile-inits # needed for linking with system-zlib
    # --help
  )

  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh "${configure_options[@]}"
  make so-only
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install-so

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
