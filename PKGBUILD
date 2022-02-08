# Maintainer: Anthony Wang <ta180m at pm dot me>
# Contributor: Chris Lane <aur at chrislane dot com>
_pkgname=digikam
pkgname=digikam-git
pkgver=v7.5.0.r345.g61141c0787
pkgrel=1
pkgdesc='An advanced digital photo management application'
arch=(i686 x86_64)
license=(GPL)
url='https://www.digikam.org/'
depends=(lensfun opencv akonadi-contacts knotifyconfig libksane kfilemetadata qtav marble-common threadweaver kcalendarcore
         qt5-xmlpatterns imagemagick jasper glu perl-image-exiftool)
makedepends=(extra-cmake-modules doxygen eigen boost kdoctools)
optdepends=('hugin: panorama tool' 'qt5-imageformats: support for additional image formats (WEBP, TIFF)'
            'rawtherapee: RAW import' 'darktable: RAW import'
            'perl: for digitaglinktree')
conflicts=('digikam')
provides=('digikam')
source=('git+https://invent.kde.org/graphics/digikam.git'
        ffmpeg5.patch)
sha256sums=('SKIP'
            'ef2601f9b2e668116a3643b4bd7ddcfc233ccfc747d813955423ca17b6a23dee')

pkgver() {
  cd ${_pkgname}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  patch -d ${_pkgname} -p1 < ffmpeg5.patch
}

build() {
  cmake -B build -S ${_pkgname} \
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

# vim:set ts=2 sw=2 et:
