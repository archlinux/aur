# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
_pkgver=8.0.0
pkgver=${_pkgver//-/} # for beta versions
pkgrel=3
pkgdesc='An advanced digital photo management application'
arch=(x86_64)
license=(GPL)
url='https://www.digikam.org/'
depends=(lensfun opencv akonadi-contacts knotifyconfig libksane kfilemetadata marble-common threadweaver kcalendarcore
         qt5-networkauth qt5-xmlpatterns imagemagick jasper glu perl-image-exiftool)
makedepends=(extra-cmake-modules doxygen eigen boost kdoctools)
optdepends=('hugin: panorama tool' 'qt5-imageformats: support for additional image formats (WEBP, TIFF)'
            'rawtherapee: RAW import' 'darktable: RAW import'
            'perl: for digitaglinktree')
source=(https://download.kde.org/stable/$pkgname/${_pkgver%-*}/digiKam-$_pkgver.tar.xz{,.sig}
        akonadi-22.04.patch)
sha256sums=('102c712b6209fe2ac877c9b1d019dacadaf115adf915570d26816066d151e847'
            'SKIP'
            '4b02d8c00c0117fb7e440bdf30fa366efda62a7710a44b49fb649a93fc1165d9')
validpgpkeys=(D1CF2444A7858C5F2FB095B74A77747BC2386E50) # digiKam.org (digiKam project) <digikamdeveloper@gmail.com>

prepare() {
  patch -d $pkgname-$pkgver -p1 < akonadi-22.04.patch # Fix build with akonadi 22.04
}

build() {
  cmake -B build -S $pkgname-$_pkgver \
    -DBUILD_TESTING=OFF \
    -DENABLE_KFILEMETADATASUPPORT=ON \
    -DENABLE_MEDIAPLAYER=ON \
    -DENABLE_AKONADICONTACTSUPPORT=ON \
    -DENABLE_MYSQLSUPPORT=ON \
    -DENABLE_APPSTYLES=ON \
    -DENABLE_QWEBENGINE=ON \
    -DSSE4_1_FOUND=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
