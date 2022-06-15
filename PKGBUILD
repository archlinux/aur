# $Id: PKGBUILD 320127 2018-03-24 09:48:28Z arojas $
# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
_pkgver=7.6.0
pkgver=${_pkgver//-/_} # for beta versions
pkgrel=5
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
source=(https://download.kde.org/stable/$pkgname/$pkgver/digiKam-$_pkgver.tar.xz{,.sig}
        ffmpeg5.patch
        akonadi-22.04.patch
        https://invent.kde.org/graphics/digikam/-/commit/8d16ea2e.patch)
sha256sums=('d8e1ee7321d3fc313916f515756e3029ac4187dc453b6933848d4de5314b6641'
            'SKIP'
            'ef2601f9b2e668116a3643b4bd7ddcfc233ccfc747d813955423ca17b6a23dee'
            '595f7e971c4f9784046ab7bcba0983305b990bdc21e6257d9ec81b013aab1dc3'
            '9f9d67c7edd7e9c1c5284b6e86337f09499d7bd0a59ea56d6ef31b05f7926687')
validpgpkeys=(D1CF2444A7858C5F2FB095B74A77747BC2386E50) # digiKam.org (digiKam project) <digikamdeveloper@gmail.com>
options=(debug)

prepare() {
  patch -d $pkgname-$_pkgver -p1 < ffmpeg5.patch # Fix build with FFmpeg 5
  patch -d $pkgname-$_pkgver -p1 < akonadi-22.04.patch # Fix build with akonadi 22.04
  patch -d $pkgname-$_pkgver -p1 < 8d16ea2e.patch # Fix crash when upgrading to mariadb 10.8
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
