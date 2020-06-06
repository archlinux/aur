# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

# Contributor: Luca P <meti at lplab.net>
# Contributor: Taijian <taijian@posteo.de>
# Contributor: Andy Kluger <andykluger@gmail.com>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=digikam
pkgname=digikam-without-akonadi-mediawiki-vkontakte
pkgver=6.4.0
pkgrel=1
pkgdesc="minimized build of Digikam for non-KDE users, without Plasma/KDE integration"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
depends=(liblqr libkipi libksane lensfun opencv knotifyconfig marble-common
	threadweaver kcalendarcore exiv2 imagemagick)
optdepends=('kipi-plugins: export to various online services'
            'hugin: panorama tool')
makedepends=(extra-cmake-modules boost doxygen eigen kdoctools glu)
conflicts=('digikam' 'digikam-git')
provides=('digikam')
source=("https://download.kde.org/stable/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.xz"{,.sig}
         initialize-imagemagick.patch::"https://cgit.kde.org/digikam.git/patch/?id=76ff65ae"
         digikam-opencv-4.2.patch
         digikam-qt-5.15.patch)
sha256sums=('775012ff515bdd25a0b894c95bf5d33e7122b523da9c0f3af260ec3eff498d6f'
            'SKIP'
            'c559882c0df2243c5a5baab3373bda4084fb9a1d54959770b8846fe026eaf360'
            '41e687eacf59f7a92deae535a097e456dcb4243686286aad16329acef71c7594'
            '3dd295fe3b49bf2140e44a86e65741522744034e0d204af12a642621feea81fc')

  prepare() {
  mkdir -p build
  cd $_pkgname-$pkgver
  patch -p1 -i ../initialize-imagemagick.patch # Properly initialize exceptions in imagemagick
  patch -p1 -i ../digikam-opencv-4.2.patch # Fix build with opencv 4.2
  patch -p1 -i ../digikam-qt-5.15.patch # Fix build with qt 5.15
}

build() {
  cd "${_pkgname}-${pkgver}"
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF \
    -DDIGIKAMSC_COMPILE_KIPIPLUGINS=OFF \
    -DDIGIKAMSC_COMPILE_PO=ON \
    -DENABLE_KFILEMETADATASUPPORT=OFF \
    -DENABLE_MEDIAPLAYER=OFF \
    -DENABLE_AKONADICONTACTSUPPORT=OFF \
    -DENABLE_MYSQLSUPPORT=ON \
    -DENABLE_APPSTYLES=ON \
    -DENABLE_OPENCV3=ON \
    -DENABLE_QWEBENGINE=ON \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DImageMagick_LIBRARIES=/usr/lib/libMagick++-7.Q16HDRI.so

  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
