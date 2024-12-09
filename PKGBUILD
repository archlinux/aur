# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: farid <farid at archlinuc-br.org>
# Contributor: Archie <Mymaud@gmail.com>
# Contributor: Calogero Scarnà <info@codelinsoft.it>

pkgbase=gmic-pre
pkgname=(gmic-pre
         gimp-plugin-gmic-pre)
pkgver=3.5.0
_pkgver=prerelease
__pkgver=3.5.0_pre
pkgrel=2
pkgdesc="Prerelease G-MIC for GIMP3"
arch=(x86_64)
url='https://gmic.eu/'
license=(CECILL-C)
makedepends=(cmake
             eigen
             fftw
             gimp
             graphicsmagick
             opencv
             openexr
             qt6-base
             qt6-tools)
source=(https://gmic.eu/files/prerelease/gmic_$_pkgver.tar.gz)
sha256sums=('SKIP')


build() {
  cmake -B build -S gmic-$__pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_DYNAMIC_LINKING=ON \
    -DBUILD_LIB_STATIC=OFF \
    -DENABLE_OPENCV=ON
  cmake --build build
# Temp install to link gmic-qt
  DESTDIR="tmp-install" cmake --install build

  export LDFLAGS="$LDFLAGS -L../build"
  cmake -B build-qt -S gmic-$__pkgver/gmic-qt \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_DYNAMIC_LINKING=ON \
    -DGMIC_PATH="$srcdir"/gmic-$__pkgver/src \
    -DCMAKE_PREFIX_PATH="$srcdir"/tmp-install/usr \
    -DGMIC_QT_HOST=none
  cmake --build build-qt

  cmake -B build-gimp -S gmic-$__pkgver/gmic-qt \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_DYNAMIC_LINKING=ON \
    -DGMIC_PATH="$srcdir"/gmic-$__pkgver/src \
    -DCMAKE_PREFIX_PATH="$srcdir"/tmp-install/usr \
    -DGMIC_QT_HOST=gimp3
  cmake --build build-gimp
}

package_gmic-pre() {
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
  optdepends=('qt6-base: for the Qt UI')
  conflicts=('cimg' 'gmic' 'gimp-plugin-gmic')

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 gmic-$__pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
# .cpp is included by .h
  install -Dm644 gmic-$__pkgver/src/gmic.cpp -t "$pkgdir"/usr/include

  DESTDIR="$pkgdir" cmake --install build-qt

  install -Dm644 gmic-$__pkgver/resources/gmic_cluts.gmz -t "$pkgdir"/usr/share/gmic
}

package_gimp-plugin-gmic-pre() {
  pkgdesc="Gimp plugin for the G'MIC image processing framework - Prerelease G-MIC for GIMP3"
  depends=(babl
           fftw
           gcc-libs
           gegl
           gimp
           glib2
           glibc
           gmic-pre
           libx11
           qt6-base
           zlib)
  conflicts=('cimg' 'gmic' 'gimp-plugin-gmic')
  DESTDIR="$pkgdir" cmake --install build-gimp
  install -Dm644 gmic-$__pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
