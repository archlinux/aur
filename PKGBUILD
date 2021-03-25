# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Brandon Andrews <bsa@bsa.isa-geek.com>
# Contributor: Mael Kerbiriou <mael.kerbiriouATfreeDOTfr>
pkgname=pfstools
pkgver=2.1.0
pkgrel=6
pkgdesc="Set of command line programs for reading, writing and manipulating high-dynamic range (HDR) images"
arch=('i686' 'x86_64')
url="http://pfstools.sourceforge.net/"
license=('LGPL2.1')
depends=('gcc-libs')
provides=('pfscalibration' 'pfstmo')
conflicts=('pfscalibration' 'pfstmo')
optdepends=('dcraw: RAW support'
            'fftw: durand02,fattal02,ferradans11 tone mapping operators'
            'freeglut: OpenGL image viewer pfsglview'
            'glu: OpenGL image viewer pfsglview'
            'gsl: mantiuk08 tone mapping operator'
            'imagemagick: ImageMagick support'
            'netpbm: PBM support'
            'octave: Octave support, pfsstat'
            'opencv: pfsalign'
            'openexr: OpenEXR support'
            'qt5-base: pfsalign, pfsview')
makedepends=('cmake' 'qt5-base' 'octave'
             'openexr' 'libmagick6' 'libtiff' 'netpbm'
             'gsl' 'fftw' 'libexif' 'opencv'
             'freeglut' 'glu')
options=(!libtool)
source=("http://downloads.sourceforge.net/pfstools/$pkgname-$pkgver.tgz"
        "https://sourceforge.net/p/pfstools/bugs/_discuss/thread/7209efcaac/18f1/attachment/pfstools-Fix-build-with-Octave-6.patch"
        "opencv3.patch" "force_imagemagick6.patch")
b2sums=('11a40c189ca42554a6f341d47b8d4e03145126d5e2d78c702ad097afd190ecc3f789c3b2f3d206dff4b41a14790c80967d5ccaeccd3c5c3cdc1c26acea2e86e9'
        '45a33ba5d3e983673f1aeb8bd8dd202502c1245e0ea6c1fa617848be158456de2f157b166e02cc7398c8a3cd3acb385b2dec6ceb693f8fd417d6f43621cbc093'
        '8a77db5e6ca74c1833d2de299051d28b3c1614b7686d264950e91c8593a5f20da05b0069c2a7a538694d550d13554d0b8dff646a6bfa9b793ed42a9770b046b0'
        'f7874dbd47672278404085d372c44102a08b0e9ba69aaa0db625bb05cdd493fb6155ee02a76f2ff459797d5a74d326051c3a0979326ed8c36bd1fed5470f9c23')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 < "$srcdir/opencv3.patch"
  patch -Np1 < "$srcdir/force_imagemagick6.patch"
  patch -Np1 < "$srcdir/pfstools-Fix-build-with-Octave-6.patch"
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}
