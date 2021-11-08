# Maintainer: Marc ROGER de CAMPAGNOLLE <fora at mrdc dot fr>

pkgname=qt5-avif-image-plugin-git
_basename=${pkgname%-git}
_pkgname=qt-avif-image-plugin
pkgver=0.4.6.r0.g0188a7d
pkgrel=1
pkgdesc='Qt5 plug-in to allow Qt5 and KDE based applications to read/write AVIF images (git version)'
arch=('x86_64')
url="https://github.com/novomesk/$_pkgname"
license=('BSD')
depends=('libavif' 'qt5-base')
makedepends=('git' 'cmake' 'extra-cmake-modules')
checkdepends=('appstream')
provides=('qt5-avif-image-plugin')
conflicts=('qt5-avif-image-plugin')
source=("git+$url.git"
        'avifthumbnail.desktop')
sha256sums=('SKIP'
            '909c0b92ff504a6b125d3e73e7500900e0def24e4b27f4c961e40c992bfaf83b')

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
  install -Dm644 avifthumbnail.desktop -t "$pkgdir/usr/share/kservices5"
  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_basename/LICENSE"
}
