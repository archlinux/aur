# $Id: PKGBUILD 320127 2018-03-24 09:48:28Z arojas $
# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
_pkgver=6.4.0
pkgver=${_pkgver//-/_} # for beta versions
pkgrel=2
pkgdesc="An advanced digital photo management application"
arch=(x86_64)
license=(GPL)
url="https://www.digikam.org/"
depends=(lensfun opencv akonadi-contacts knotifyconfig libksane kfilemetadata qtav marble-common threadweaver kcalendarcore
         qt5-xmlpatterns imagemagick glu)
makedepends=(extra-cmake-modules doxygen eigen boost kdoctools libkvkontakte)
optdepends=('hugin: panorama tool' 'qt5-imageformats: support for additional image formats (WEBP, TIFF)'
            'libkvkontakte: VKontakte plugin'
            'rawtherapee: RAW import' 'darktable: RAW import')
source=("https://download.kde.org/stable/$pkgname/$_pkgver/$pkgname-$_pkgver.tar.xz"{,.sig}
         initialize-imagemagick.patch)
sha256sums=('6532c02d51a9861f101092dfde92f8de478b1554d3449bbf3a11e50d32d39460'
            'SKIP'
            'bc1dc65eb62a0e339698980ee438a17efa39f293419e4134948c7ee8f6733dad')
validpgpkeys=(D1CF2444A7858C5F2FB095B74A77747BC2386E50) # digiKam.org (digiKam project) <digikamdeveloper@gmail.com>

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
  patch -p1 -i ../initialize-imagemagick.patch # Properly initialize exceptions in imagemagick
}

build() {
  cd build

  cmake ../$pkgname-$_pkgver \
    -DBUILD_TESTING=OFF \
    -DENABLE_KFILEMETADATASUPPORT=ON \
    -DENABLE_MEDIAPLAYER=ON \
    -DENABLE_AKONADICONTACTSUPPORT=ON \
    -DENABLE_MYSQLSUPPORT=ON \
    -DENABLE_APPSTYLES=ON \
    -DENABLE_QWEBENGINE=ON \
    -DOpenGL_GL_PREFERENCE=GLVND
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
