# Maintainer: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=digikam
pkgname=digikam-without-akonadi-mediawiki-vkontakte
_pkgver=7.9.0
pkgver=${_pkgver//-/_} # for beta versions
pkgrel=1
pkgdesc='An advanced digital photo management application'
arch=(x86_64)
license=(GPL)
url='https://www.digikam.org/'
depends=(lensfun opencv knotifyconfig libksane kfilemetadata qtav marble-common threadweaver kcalendarcore
         qt5-xmlpatterns imagemagick jasper glu perl-image-exiftool)
makedepends=(extra-cmake-modules doxygen eigen boost kdoctools)
conflicts=('digikam' 'digikam-git')
provides=('digikam')
optdepends=('hugin: panorama tool' 'qt5-imageformats: support for additional image formats (WEBP, TIFF)'
            'rawtherapee: RAW import' 'darktable: RAW import'
            'perl: for digitaglinktree')
source=(https://download.kde.org/stable/$_pkgname/$pkgver/digiKam-$_pkgver.tar.xz{,.sig}
        f2f86c3c.patch
        ffmpeg5.patch)
sha256sums=('c3b80abc090da3cbbc42e67a403080d7f5fe0a7c98698735bda556c60314bab4'
            'SKIP'
            '93e3bf4a6d8118db45171acbab51381ee0806a98f3dc5be7f32727445ea80ac1'
            'ef2601f9b2e668116a3643b4bd7ddcfc233ccfc747d813955423ca17b6a23dee')
validpgpkeys=(D1CF2444A7858C5F2FB095B74A77747BC2386E50) # digiKam.org (digiKam project) <digikamdeveloper@gmail.com>

prepare() {
  patch -d $_pkgname-$_pkgver -p1 < ffmpeg5.patch # Fix build with FFmpeg 5
  patch -d $_pkgname-$_pkgver -p1 < f2f86c3c.patch # Fix crashes on face recognition
}

build() {
  cmake -B build -S $_pkgname-$_pkgver \
    -DBUILD_TESTING=OFF \
    -DENABLE_KFILEMETADATASUPPORT=ON \
    -DENABLE_MEDIAPLAYER=ON \
    -DENABLE_AKONADICONTACTSUPPORT=OFF \
    -DENABLE_MYSQLSUPPORT=ON \
    -DENABLE_APPSTYLES=ON \
    -DENABLE_QWEBENGINE=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

