# Maintainer: Marc ROGER de CAMPAGNOLLE <fora at mrdc dot fr>

pkgbase=qt5-avif-image-plugin
_pkgname=qt-avif-image-plugin
pkgname=(qt5-avif-image-plugin qt6-avif-image-plugin)
pkgver=0.8.1
pkgrel=1
pkgdesc='Qt5 plug-in to allow Qt5 and KDE based applications to read/write AVIF images'
arch=('x86_64')
url="https://github.com/novomesk/$_pkgname"
license=('BSD-2-Clause')
depends=('libavif' 'glibc' 'gcc-libs')
makedepends=('cmake' 'extra-cmake-modules' 'qt5-base' 'qt6-base')
checkdepends=('appstream')
source=("$url/archive/v$pkgver/$_pkgname-$pkgver.tar.gz"
        'avifthumbnail.desktop')
sha256sums=('768c345468080ca5f919124f3e8107e116f5a6dcc7f74d2736c75f276991b84c'
            '909c0b92ff504a6b125d3e73e7500900e0def24e4b27f4c961e40c992bfaf83b')

build() {
  cmake -B build-qt5 -S "$_pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DQT_MAJOR_VERSION=5 \
    -Wno-dev
  cmake --build build-qt5
  cmake -B build-qt6 -S "$_pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_SKIP_RPATH=YES \
    -DQT_MAJOR_VERSION=6 \
    -Wno-dev
  cmake --build build-qt6
}

check() {
  ctest --test-dir build-qt5 --output-on-failure
  ctest --test-dir build-qt6 --output-on-failure
}

package_qt5-avif-image-plugin() {
  depends+=('qt5-base')
  DESTDIR="$pkgdir" cmake --install build-qt5
  install -Dm644 avifthumbnail.desktop -t "$pkgdir/usr/share/kservices5"
  install -Dm644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
package_qt6-avif-image-plugin() {
  pkgdesc='Qt6 plug-in to allow Qt6 and KDE 6 based applications to read/write AVIF images'
  depends+=('qt6-base')
  DESTDIR="$pkgdir" cmake --install build-qt6
  install -Dm644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

