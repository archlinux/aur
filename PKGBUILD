# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# Contributor: Teo Mrnjavac <teo@kde.org>

pkgbase=qtkeychain
pkgname=(qtkeychain-qt5
         qtkeychain-qt6)
pkgver=0.15.0
pkgrel=1
pkgdesc='Provides support for secure credentials storage'
arch=(x86_64)
url='https://github.com/frankosterfeld/qtkeychain'
license=(BSD)
depends=(gcc-libs
         glib2
         glibc
         org.freedesktop.secrets)
makedepends=(clang
             cmake
             git
             qt5-tools
             qt6-declarative
             qt6-tools)
source=(git+https://github.com/frankosterfeld/qtkeychain#tag=$pkgver)
sha256sums=('0ffe67e46fa4a99da93c1f13090a7e153dfe1cee25b9ef269f85a504834360db')

build() {
  cmake -B build-qt5 -S $pkgbase \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build-qt5

  cmake -B build-qt6 -S $pkgbase \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_WITH_QT6=ON
  cmake --build build-qt6
}

package_qtkeychain-qt5() {
  depends+=(qt5-base)
  optdepends=('kwallet5: kwallet backend')
  conflicts=(qtkeychain)
  provides=(qtkeychain)
  replaces=(qtkeychain)

  DESTDIR="$pkgdir" cmake --install build-qt5
  install -Dm644 $pkgbase/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_qtkeychain-qt6() {
  depends+=(qt6-base)
  optdepends=('kwallet: kwallet backend')

  DESTDIR="$pkgdir" cmake --install build-qt6
  install -Dm644 $pkgbase/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
