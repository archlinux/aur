# $Id: PKGBUILD 320127 2018-03-24 09:48:28Z arojas $
# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
_pkgver=7.3.0
pkgver=${_pkgver//-/_} # for beta versions
pkgrel=3
pkgdesc='An advanced digital photo management application'
arch=(x86_64)
license=(GPL)
url='https://www.digikam.org/'
depends=(lensfun opencv akonadi-contacts knotifyconfig libksane kfilemetadata qtav marble-common threadweaver kcalendarcore
         qt5-xmlpatterns imagemagick jasper glu perl-image-exiftool)
makedepends=(extra-cmake-modules doxygen eigen boost kdoctools)
optdepends=('hugin: panorama tool' 'qt5-imageformats: support for additional image formats (WEBP, TIFF)'
            'rawtherapee: RAW import' 'darktable: RAW import'
            'perl: for digitaglinktree')
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$_pkgver.tar.xz{,.sig}
        49ee18fb.patch)
sha256sums=('95aea93be1cfd39bb52333b82b3e57bf68080c7d1319d754d167a20f6dbe4551'
            'SKIP'
            'e1980cd4ee76160e1262ec1044d5072a1c8ea1e36a020882e53f5cb7edd0ce23')
validpgpkeys=(D1CF2444A7858C5F2FB095B74A77747BC2386E50) # digiKam.org (digiKam project) <digikamdeveloper@gmail.com>

prepare() {
  patch -d $pkgname-$pkgver -p1 < 49ee18fb.patch # Upgrade database on mysql version updates
}

build() {
  cmake -B build -S $pkgname-$_pkgver \
    -DBUILD_TESTING=OFF \
    -DENABLE_KFILEMETADATASUPPORT=ON \
    -DENABLE_MEDIAPLAYER=ON \
    -DENABLE_AKONADICONTACTSUPPORT=ON \
    -DENABLE_MYSQLSUPPORT=ON \
    -DENABLE_APPSTYLES=ON \
    -DENABLE_QWEBENGINE=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
