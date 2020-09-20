# Maintainer: Hsiu-Ming Chang <cges30901@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Pierre-Paul Paquin <pierrepaulpaquin@gmail.com>
# Contributor: xduugu

pkgname=libmupdf-pymupdf
pkgver=1.17.0
pkgrel=3
pkgdesc='Library for Lightweight PDF and XPS viewer with patch to build PyMuPDF'
arch=('x86_64')
url='https://mupdf.com/'
license=('AGPL3')
makedepends=('desktop-file-utils' 'freetype2' 'freeglut' 'glu' 'harfbuzz'
             'jbig2dec' 'libjpeg' 'mesa-libgl' 'openjpeg2' 'libxext')
# we need static libs for zathura-pdf-mupdf
provides=('libmupdf=1.17.0')
conflicts=('libmupdf')
options=('staticlibs')
source=("https://mupdf.com/downloads/archive/mupdf-${pkgver/_/}-source.tar.xz"
        '0001-Set-noexecstack-on-linker-generated-binary-data-files.patch'
        '0002-pymupdf.patch'
        'mupdf.desktop'
        'mupdf.xpm')
sha256sums=('c935fb2593d9a28d9b56b59dad6e3b0716a6790f8a257a68fa7dcb4430bc6086'
            '53e3ccc9dd613277a1cfb99dcf7e71216c8497a84f6a7663a2fbff9d58a10be5'
            '10d6ee6ea3707b5821f84ba81f855b46b44492821d7158ae109db458563bbd8f'
            'ccff66979249bd4ab4ba8918660f194eb90eb0ae231b16e36a6cecdcf471883f'
            'a435f44425f5432c074dee745d8fbaeb879038ec1f1ec64f037c74662f09aca8')

prepare() {
  cd mupdf-${pkgver/_/}-source

  # remove bundled packages, we want our system libraries
  rm -rf thirdparty/{freeglut,freetype,harfbuzz,jbig2dec,libjpeg,openjpeg,zlib}

  # Set noexecstack on linker-generated binary data files.
  patch -Np1 < ../0001-Set-noexecstack-on-linker-generated-binary-data-files.patch

  # Add patch to build PyMuPDF
  patch -Np1 < ../0002-pymupdf.patch
}

build() {
  CFLAGS+=' -fPIC'
  CXXFLAGS+=' -fPIC'
  export CFLAGS CXXFLAGS
  
  USE_SYSTEM_LIBS='yes'
  export USE_SYSTEM_LIBS

  cd mupdf-${pkgver/_/}-source
  make HAVE_X11=no HAVE_GLFW=no HAVE_GLUT=no build=release libs apps
}

package() {
  cd mupdf-${pkgver/_/}-source

  make HAVE_X11=no HAVE_GLFW=no HAVE_GLUT=no build=release prefix="$pkgdir"/usr install

  rm -rf "$pkgdir"/usr/{bin,share/man}
  mv "$pkgdir"/usr/share/doc/mupdf "$pkgdir"/usr/share/doc/libmupdf

  find "$pkgdir"/usr/include "$pkgdir"/usr/share "$pkgdir"/usr/lib \
    -type f -exec chmod 0644 {} +
}

