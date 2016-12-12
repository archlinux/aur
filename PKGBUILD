# Maintainer: Tugdil Goldhand <aur@xosc.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Pierre-Paul Paquin <pierrepaulpaquin@gmail.com>
# Contributor: xduugu

_pkgbase=mupdf
pkgbase=${_pkgbase}-nojs
pkgname=(libmupdf-nojs mupdf-nojs mupdf-gl-nojs mupdf-tools-nojs)
pkgver=1.10a
pkgrel=1
pkgdesc='Lightweight PDF and XPS viewer'
arch=('i686' 'x86_64')
url='http://mupdf.com'
license=('AGPL3')
conflicts=(libmupdf mupdf mupdf-gl mupdf-tools)
makedepends=('curl' 'desktop-file-utils' 'freetype2' 'glfw' 'harfbuzz'
             'jbig2dec' 'libjpeg' 'mesa-libgl' 'openjpeg2' 'openssl')
# we need static libs for zathura-pdf-mupdf
options=('staticlibs')
source=("http://mupdf.com/downloads/mupdf-${pkgver/_/}-source.tar.gz"
        '0001-mupdf-openjpeg.patch'
        'mupdf.desktop'
        'mupdf.xpm')
sha256sums=('aacc1f36b9180f562022ef1ab3439b009369d944364f3cff8a2a898834e3a836'
'e55c3b876149d46983b155b0a237fa7d8d47a49e4ecab848bfca3fd549c644c4'
'70f632e22902ad4224b1d88696702b3ba4eb3c28eb7acf735f06d16e6884a078'
'a435f44425f5432c074dee745d8fbaeb879038ec1f1ec64f037c74662f09aca8'
)

prepare() {
  cd ${_pkgbase}-${pkgver/_/}-source

  # remove bundled packages, we want our system libraries
  rm -rf thirdparty/{curl,freetype,glfw,harfbuzz,jbig2dec,jpeg,openjpeg,zlib}

  # fix function for openjpeg 2.1.x
  patch -Np1 < "${srcdir}/0001-mupdf-openjpeg.patch"

  # fix includes for jbig2dec
  sed '/^JBIG2DEC_CFLAGS :=/s|$| -I./include/mupdf|' -i Makethird
}

build() {
  CFLAGS+=' -fPIC -fPIE -fno-plt -fstack-check -fstack-protector-all -D_FORTIFY_SOURCE=2'
  CXXFLAGS+=' -fPIC -fPIE -fno-plt -fstack-check -fstack-protector-all -D_FORTIFY_SOURCE=2'
  LDFLAGS+=' -pie -z,now'
  export CFLAGS CXXFLAGS LDFLAGS

  HAVE_GLFW='yes'
  SYS_GLFW_CFLAGS="$(pkg-config --cflags glfw3)"
  SYS_GLFW_LIBS="$(pkg-config --libs glfw3) -lGL"
  export HAVE_GLFW SYS_GLFW_CFLAGS SYS_GLFW_LIBS

  cd ${_pkgbase}-${pkgver/_/}-source
  HAVE_MUJS="no" make build=release
}

package_libmupdf-nojs() {
  pkgdesc='Library for Lightweight PDF and XPS viewer'

  cd ${_pkgbase}-${pkgver/_/}-source

  HAVE_MUJS="no" make build=release prefix="$pkgdir"/usr install

  rm -rf "$pkgdir"/usr/{bin,share/man}
  mv "$pkgdir"/usr/share/doc/mupdf "$pkgdir"/usr/share/doc/libmupdf

  find "$pkgdir"/usr/include "$pkgdir"/usr/share "$pkgdir"/usr/lib \
    -type f -exec chmod 0644 {} +
}

package_mupdf-nojs() {
  pkgdesc='Lightweight PDF and XPS viewer'
  depends=('curl' 'desktop-file-utils' 'freetype2' 'harfbuzz' 'jbig2dec'
           'libjpeg' 'openjpeg2' 'openssl')

  cd ${_pkgbase}-${pkgver/_/}-source

  install -D -m0755 build/release/mupdf-x11-curl "$pkgdir"/usr/bin/mupdf

  install -D -m0644 docs/man/mupdf.1 "$pkgdir"/usr/share/man/man1/mupdf.1

  install -d "$pkgdir"/usr/share/doc/mupdf
  install -m0644  README COPYING CHANGES "$pkgdir"/usr/share/doc/mupdf

  install -D -m0644 ../mupdf.desktop "$pkgdir"/usr/share/applications/mupdf.desktop
  install -D -m0644 ../mupdf.xpm "$pkgdir"/usr/share/pixmaps/mupdf.xpm
}

package_mupdf-gl-nojs() {
  pkgdesc='Lightweight PDF and XPS viewer with OpenGL backend'
  conflicts=('mupdf')
  provides=('mupdf')
  depends=('desktop-file-utils' 'freetype2' 'glfw' 'harfbuzz' 'jbig2dec'
           'libjpeg' 'openjpeg2' 'openssl')

  cd ${_pkgbase}-${pkgver/_/}-source

  install -D -m0755 build/release/mupdf-gl "$pkgdir"/usr/bin/mupdf

  install -D -m0644 docs/man/mupdf.1 "$pkgdir"/usr/share/man/man1/mupdf.1

  install -d "$pkgdir"/usr/share/doc/mupdf
  install -m0644 README COPYING CHANGES "$pkgdir"/usr/share/doc/mupdf

  install -D -m0644 ../mupdf.desktop "$pkgdir"/usr/share/applications/mupdf.desktop
  install -D -m0644 ../mupdf.xpm "$pkgdir"/usr/share/pixmaps/mupdf.xpm
}

package_mupdf-tools-nojs() {
  pkgdesc='Tools for Lightweight PDF and XPS viewer'
  depends=('mupdf')
  depends=('freetype2' 'jbig2dec' 'libjpeg'
         'openssl' 'openjpeg2' 'harfbuzz')

  cd ${_pkgbase}-${pkgver/_/}-source

  install -D -m0755 build/release/mutool "$pkgdir"/usr/bin/mutool
  install -D -m0755 build/release/mujstest "$pkgdir"/usr/bin/mujstest

  install -D -m0644 docs/man/mutool.1 "$pkgdir"/usr/share/man/man1/mutool.1

  install -d "$pkgdir"/usr/share/doc/mupdf-tools
  install -m0644 README COPYING CHANGES "$pkgdir"/usr/share/doc/mupdf-tools
}

