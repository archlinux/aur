# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
_pkgver=8.1.0
pkgver=${_pkgver//-/} # for beta versions
pkgrel=4
pkgdesc='An advanced digital photo management application'
arch=(x86_64)
license=(GPL)
url='https://www.digikam.org/'
depends=(lensfun opencv akonadi-contacts5 knotifyconfig5 libksane kfilemetadata5 marble-common threadweaver5 kcalendarcore5
         qt5-networkauth qt5-xmlpatterns imagemagick jasper glu perl-image-exiftool)
makedepends=(extra-cmake-modules doxygen eigen boost kdoctools5)
optdepends=('hugin: panorama tool' 'qt5-imageformats: support for additional image formats (WEBP, TIFF)'
            'rawtherapee: RAW import' 'darktable: RAW import'
            'perl: for digitaglinktree')
source=(https://download.kde.org/stable/$pkgname/${_pkgver%-*}/digiKam-$_pkgver.tar.xz{,.sig}
        https://invent.kde.org/graphics/digikam/-/commit/f5ea91a7.patch)
sha256sums=('0503c034e445ff424f18a6715c0a7a79be4a5e0c82b3ebc461a21cec3745a5b3'
            'SKIP'
            'b0fec727f28ac7021adc94a6284286d34cdf0f8a1e463eb83ec50df0a3d9b761')
validpgpkeys=(D1CF2444A7858C5F2FB095B74A77747BC2386E50) # digiKam.org (digiKam project) <digikamdeveloper@gmail.com>

prepare() {
  patch -d $pkgname-$_pkgver -p1 < f5ea91a7.patch # Fix build with exiv2 0.28.1
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
