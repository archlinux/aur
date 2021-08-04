# Maintainer: Marc ROGER de CAMPAGNOLLE <fora at mrdc dot fr>

pkgname=qt5-jpegxl-image-plugin-git
_pkgname=qt-jpegxl-image-plugin
pkgver=0.2.0.r0.geb424dd
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
options=('!emptydirs')
source=("git+$url.git"
        "010-$_pkgname-allow-qt6-coinstall.patch")
sha256sums=('SKIP'
            '05d7106ddc07a91ae3dccaa8815cf74fa9aef87c12e2961dfadc1240c5f07790')

pkgver() {
  git -C $_pkgname describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  patch -d $_pkgname -Np1 -i "$srcdir/010-$_pkgname-allow-qt6-coinstall.patch"
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DQT_MAJOR:STRING='5' \
    -Wno-dev
  make -C build
}

check() {
  make -C build test
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
