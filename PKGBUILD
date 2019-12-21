# $Id: PKGBUILD 320127 2018-03-24 09:48:28Z arojas $
# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
_pkgver=6.4.0
pkgver=${_pkgver//-/_} # for beta versions
pkgrel=4
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
         initialize-imagemagick.patch::"https://cgit.kde.org/digikam.git/patch/?id=76ff65ae"
         digikam-opencv-4.2.patch)
sha256sums=('775012ff515bdd25a0b894c95bf5d33e7122b523da9c0f3af260ec3eff498d6f'
            'SKIP'
            'c559882c0df2243c5a5baab3373bda4084fb9a1d54959770b8846fe026eaf360'
            'fcd9a18dee3b4d009ec7256207d1b6645d2e2aa918b5cf9f9dc9b44db41f6a7b')
validpgpkeys=(D1CF2444A7858C5F2FB095B74A77747BC2386E50) # digiKam.org (digiKam project) <digikamdeveloper@gmail.com>

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
  patch -p1 -i ../initialize-imagemagick.patch # Properly initialize exceptions in imagemagick
  patch -p1 -i ../digikam-opencv-4.2.patch # Fix build with opencv 4.2
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
