# Maintainer: Marc ROGER de CAMPAGNOLLE <fora at mrdc dot fr>

pkgname=qt5-jpegxl-image-plugin-git
_pkgname=qt-jpegxl-image-plugin
pkgver=0.3.2.r0.g811669b
pkgrel=1
pkgdesc='Qt5 plug-in to allow Qt5 and KDE based applications to read/write JXL images (git version)'
arch=('x86_64')
url="https://github.com/novomesk/$_pkgname"
license=('GPL3')
depends=('libjxl' 'qt5-base')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'highway')
checkdepends=('appstream')
provides=('qt5-jpegxl-image-plugin')
conflicts=('qt5-jpegxl-image-plugin')
source=("git+$url.git"
        'jpegxlthumbnail.desktop')
sha256sums=('SKIP'
            'd57870099934ebd6fddfc38ca8c6420e891f072e7a3c1779496cc1ad75039315')

pkgver() {
  git -C $_pkgname describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  make -C build
}

check() {
  make -C build test
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -D -m644 jpegxlthumbnail.desktop -t "$pkgdir/usr/share/kservices5"
}
