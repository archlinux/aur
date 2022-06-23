# $Id: PKGBUILD 320127 2018-03-24 09:48:28Z arojas $
# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
_pkgver=7.7.0
pkgver=${_pkgver//-/_} # for beta versions
pkgrel=1
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
        ffmpeg5.patch)
sha256sums=('c0c6dd2ea8a07514acbf2462f3a54518e7e8099b3337f881336168cff63d771c'
            'SKIP'
            'ef2601f9b2e668116a3643b4bd7ddcfc233ccfc747d813955423ca17b6a23dee')
validpgpkeys=(D1CF2444A7858C5F2FB095B74A77747BC2386E50) # digiKam.org (digiKam project) <digikamdeveloper@gmail.com>
options=(debug)

prepare() {
  patch -d $pkgname-$_pkgver -p1 < ffmpeg5.patch # Fix build with FFmpeg 5
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
