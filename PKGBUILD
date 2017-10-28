# Maintainer: valoq <valoq@mailbox.org>

_pkgbase=mupdf
pkgbase=${_pkgbase}-seccomp
pkgname=(libmupdf-seccomp mupdf-seccomp)
pkgver=1.11
_pkgver=1.11
pkgrel=5
_openjpeg_version=2.3
pkgdesc='Mupdf with seccomp filter'
arch=('i686' 'x86_64')
url='http://mupdf.com'
license=('AGPL3')
conflicts=(libmupdf mupdf)
makedepends=('curl' 'desktop-file-utils' 'freetype2' 'glfw' 'harfbuzz'
             'jbig2dec' 'libjpeg' 'mesa-libgl' 'openjpeg2' 'openssl' 'libxext')
source=("https://mupdf.com/downloads/mupdf-${pkgver/_/}-source.tar.gz"
        '0001-mupdf-openjpeg.patch'
        'mupdf.desktop'
        'mupdf.xpm'
        'seccomp.patch'
        'CVE-2017-15587.patch')

sha256sums=('209474a80c56a035ce3f4958a63373a96fad75c927c7b1acdc553fc85855f00a'
            'e87b0911121753ab24758a8c2bd533abe347b425f0681e84c945a225c62c63be'
            '70f632e22902ad4224b1d88696702b3ba4eb3c28eb7acf735f06d16e6884a078'
            'a435f44425f5432c074dee745d8fbaeb879038ec1f1ec64f037c74662f09aca8'
            '53b0b5c745869b86e9a27dcba86d1492573df0ac78626ad5ce67d0433fe5ac40'
            '5a51384bc6eddfff6295d235662024876eb486588266c040f5579c5958a32a97')


prepare() {
  cd ${_pkgbase}-${_pkgver/_/}-source

  # remove bundled packages, we want our system libraries
  rm -rf thirdparty/{curl,freetype,glfw,harfbuzz,jbig2dec,libjpeg,openjpeg,mujs,zlib}

  # fix function for openjpeg 
  patch -Np1 < "${srcdir}/0001-mupdf-openjpeg.patch"
  sed -i "s/__OPENJPEG__VERSION__/${_openjpeg_version}/" source/fitz/load-jpx.c

  # fix includes for jbig2dec
  sed '/^JBIG2DEC_CFLAGS :=/s|$| -I./include/mupdf|' -i Makethird

  # apply seccomp patch
  patch -Np1 < "${srcdir}/seccomp.patch"

  # apply CVE-2017-15587 patch
  patch -Np1 < "${srcdir}/CVE-2017-15587.patch"


  # embedding CJK fonts into binaries is madness...
  sed '/* #define TOFU_CJK /c #define TOFU_CJK 1' -i include/mupdf/fitz/config.h
  sed '/* #define TOFU /c #define TOFU 1' -i include/mupdf/fitz/config.h
  sed '/* #define TOFU_CJK_EXT /c #define TOFU_CJK_EXT 1' -i include/mupdf/fitz/config.h
  sed '/* #define TOFU_EMOJI /c #define TOFU_EMOJI 1' -i include/mupdf/fitz/config.h
  sed '/* #define TOFU_HISTORIC /c #define TOFU_HISTORIC 1' -i include/mupdf/fitz/config.h
  sed '/* #define TOFU_SYMBOL /c #define TOFU_SYMBOL 1' -i include/mupdf/fitz/config.h
  sed '/* #define TOFU_SIL /c #define TOFU_SIL 1' -i include/mupdf/fitz/config.h

  # disable XPS
  sed '/* #define FZ_ENABLE_XPS /c #define FZ_ENABLE_XPS 0' -i include/mupdf/fitz/config.h

  # disable SVG
  sed '/* #define FZ_ENABLE_SVG /c #define FZ_ENABLE_SVG 0' -i include/mupdf/fitz/config.h
  
  # disable CBZ
  sed '/* #define FZ_ENABLE_CBZ /c #define FZ_ENABLE_CBZ 0' -i include/mupdf/fitz/config.h

  # disable IMG
  sed '/* #define FZ_ENABLE_IMG /c #define FZ_ENABLE_IMG 0' -i include/mupdf/fitz/config.h

  # disable TIFF
  sed '/* #define FZ_ENABLE_TIFF /c #define FZ_ENABLE_TIFF 0' -i include/mupdf/fitz/config.h

  # disable HTML
  sed '/* #define FZ_ENABLE_HTML /c #define FZ_ENABLE_HTML 0' -i include/mupdf/fitz/config.h

  # disable EPUB
  sed '/* #define FZ_ENABLE_EPUB /c #define FZ_ENABLE_EPUB 0' -i include/mupdf/fitz/config.h

  # disable GPRF
  sed '/* #define FZ_ENABLE_GPRF /c #define FZ_ENABLE_GPRF 0' -i include/mupdf/fitz/config.h

  # disable JS
  sed '/* #define FZ_ENABLE_JS /c #define FZ_ENABLE_JS 0' -i include/mupdf/fitz/config.h
}

build() {
  CFLAGS+=' -fPIC -fPIE -fstack-protector-all -D_FORTIFY_SOURCE=2'
  CXXFLAGS+=' -fPIC -fPIE -fstack-protector-all -D_FORTIFY_SOURCE=2'
  LDFLAGS+=' -pie'
  export CFLAGS CXXFLAGS LDFLAGS

#  CFLAGS+=' -fPIC'
#  CXXFLAGS+=' -fPIC'
#  export CFLAGS CXXFLAGS

#  HAVE_GLFW='yes'
#  SYS_GLFW_CFLAGS="$(pkg-config --cflags glfw3)"
#  SYS_GLFW_LIBS="$(pkg-config --libs glfw3) -lGL"
#  export HAVE_GLFW SYS_GLFW_CFLAGS SYS_GLFW_LIBS
  
  cd ${_pkgbase}-${_pkgver/_/}-source
  make build=release
}

#the libmupdf package does not contain any seccomp functionalty. Seccomp is process based.
package_libmupdf-seccomp() {
pkgdesc='Library for Lightweight PDF viewer'

  cd ${_pkgbase}-${_pkgver/_/}-source

  make build=release prefix="$pkgdir"/usr install

  rm -rf "$pkgdir"/usr/{bin,share/man}
  mv "$pkgdir"/usr/share/doc/mupdf "$pkgdir"/usr/share/doc/libmupdf

  find "$pkgdir"/usr/include "$pkgdir"/usr/share "$pkgdir"/usr/lib \
    -type f -exec chmod 0644 {} +
}

package_mupdf-seccomp() {
  pkgdesc='Lightweight PDF viewer with seccomp filter'
  depends=('curl' 'desktop-file-utils' 'freetype2' 'harfbuzz' 'jbig2dec'
           'libjpeg' 'openjpeg2' 'openssl')

  cd ${_pkgbase}-${_pkgver/_/}-source

  install -D -m0755 build/release/mupdf-x11 "$pkgdir"/usr/bin/mupdf
  install -D -m0644 docs/man/mupdf.1 "$pkgdir"/usr/share/man/man1/mupdf.1
  install -d "$pkgdir"/usr/share/doc/mupdf
  install -m0644  README COPYING CHANGES "$pkgdir"/usr/share/doc/mupdf
  install -D -m0644 ../mupdf.desktop "$pkgdir"/usr/share/applications/mupdf.desktop
  install -D -m0644 ../mupdf.xpm "$pkgdir"/usr/share/pixmaps/mupdf.xpm
}


