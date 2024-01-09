# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgbase=kdsoap
pkgname=(kdsoap-qt5
         kdsoap-qt6)
pkgver=2.2.0
pkgrel=1
pkgdesc='Qt-based client-side and server-side SOAP component'
license=(GPL3 LGPL custom)
arch=(x86_64)
url='https://github.com/KDAB/KDSoap'
depends=(gcc-libs
         glibc)
makedepends=(cmake
             qt5-base
             qt6-base)
source=(https://github.com/KDAB/KDSoap/releases/download/$pkgbase-$pkgver/$pkgbase-$pkgver.tar.gz{,.asc})
sha256sums=('d9ef11948442197c9fa44bd6fbadc842b7280a60dfc40577af66fded637af356'
            'SKIP')
validpgpkeys=(E86C000370B1B9E2A9191AD53DBFB6882C9358FB) # KDAB Products (user for KDAB products) <info@kdab.com>

build() {
  cmake -B build5 -S $pkgbase-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DINSTALL_INCLUDE_DIR=/usr/include/KDSoap-qt5
  cmake --build build5

  cmake -B build6 -S $pkgbase-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DKDSoap_QT6=ON
  cmake --build build6
}

package_kdsoap-qt5() {
  depends+=(qt5-base)
  conflicts=(kdsoap)
  provides=(kdsoap)
  replaces=(kdsoap)

  DESTDIR="$pkgdir" cmake --install build5
  install -Dm644 $pkgbase-$pkgver/LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_kdsoap-qt6() {
  depends+=(qt6-base)

  DESTDIR="$pkgdir" cmake --install build6
  install -Dm644 $pkgbase-$pkgver/LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
