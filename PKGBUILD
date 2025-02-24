# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: farid <farid at archlinuc-br.org>
# Contributor: Archie <Mymaud@gmail.com>
# Contributor: Calogero Scarnà <info@codelinsoft.it>

pkgbase=gmic-pre
pkgname=(gmic-pre-gimp3
         gimp-plugin-gmic-pre-gimp3)
pkgver=3.5.2
arch=('x86_64')
#_pkgver=prerelease
#__pkgver=3.5.0_pre
pkgrel=3
pkgdesc="Prerelease G-MIC for GIMP3"
url='https://gmic.eu/'
license=(CECILL-C)
makedepends=(cmake
             eigen
             fftw
             gimp
             graphicsmagick
             opencv
             openexr
             qt5-base
             qt5-tools)
source=(https://gmic.eu/files/source/gmic_$pkgver.tar.gz)
sha256sums=('SKIP')
optdepends=('qt5-base: for the Qt UI')
  conflicts=('cimg' 'gmic' 'gimp-plugin-gmic')
  replaces=('gmic-pre' 'gimp-plugin-gmic-pre')

build() {
  cmake -B build -S gmic-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_DYNAMIC_LINKING=ON \
    -DBUILD_LIB_STATIC=OFF \
    -DENABLE_OPENCV=ON
  cmake --build build
# Temp install to link gmic-qt
  DESTDIR="tmp-install" cmake --install build

  export LDFLAGS="$LDFLAGS -L../build"
  cmake -B build-qt -S gmic-$pkgver/gmic-qt \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_DYNAMIC_LINKING=ON \
    -DGMIC_PATH="$srcdir"/gmic-$pkgver/src \
    -DCMAKE_PREFIX_PATH="$srcdir"/tmp-install/usr \
    -DGMIC_QT_HOST=none
  cmake --build build-qt

  cmake -B build-gimp -S gmic-$pkgver/gmic-qt \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_DYNAMIC_LINKING=ON \
    -DGMIC_PATH="$srcdir"/gmic-$pkgver/src \
    -DCMAKE_PREFIX_PATH="$srcdir"/tmp-install/usr \
    -DGMIC_QT_HOST=gimp3
  cmake --build build-gimp
}

package_gmic-pre-gimp3() {
  pkgdesc="GREYC's Magic Image Converter: image processing framework - Prerelease G-MIC for GIMP3"
  depends=(curl
           fftw
           gcc-libs
           glibc
           graphicsmagick
           imath
           libjpeg-turbo
           libpng
           libtiff
           libx11
           opencv
           openexr
           zlib)
  optdepends=('qt5-base: for the Qt UI')
  conflicts=('cimg' 'gmic' 'gimp-plugin-gmic')
  replaces=('gmic-pre' 'gimp-plugin-gmic-pre')

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 gmic-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
# .cpp is included by .h
  install -Dm644 gmic-$pkgver/src/gmic.cpp -t "$pkgdir"/usr/include

  DESTDIR="$pkgdir" cmake --install build-qt

  install -Dm644 gmic-$pkgver/resources/gmic_cluts.gmz -t "$pkgdir"/usr/share/gmic
}

package_gimp-plugin-gmic-pre-gimp3() {
  pkgdesc="Gimp plugin for the G'MIC image processing framework - Prerelease G-MIC for GIMP3"
  depends=(babl
           fftw
           gcc-libs
           gegl
           gimp
           glib2
           glibc
           gmic
           libx11
           qt5-base
           zlib
)
  conflicts=('cimg' 'gmic' 'gimp-plugin-gmic')
  replaces=('gmic-pre' 'gimp-plugin-gmic-pre')
  DESTDIR="$pkgdir" cmake --install build-gimp
  install -Dm644 gmic-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
