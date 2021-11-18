# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# Contributor: Teo Mrnjavac <teo@kde.org>

pkgbase=qtkeychain
pkgname=(qtkeychain-qt5 qtkeychain-qt6)
pkgver=0.13.2
pkgrel=1
pkgdesc='Provides support for secure credentials storage'
arch=(x86_64)
url='https://github.com/frankosterfeld/qtkeychain'
license=(BSD)
depends=(libsecret)
makedepends=(cmake qt5-tools qt6-tools)
source=(https://github.com/frankosterfeld/qtkeychain/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('20beeb32de7c4eb0af9039b21e18370faf847ac8697ab3045906076afbc4caa5')

build() {
  cmake -B build-qt5 -S $pkgbase-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build-qt5

  cmake -B build-qt6 -S $pkgbase-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_WITH_QT6=ON
  cmake --build build-qt6
}

package_qtkeychain-qt5() {
  depends+=(qt5-base)
  optdepends=('kwallet: kwallet backend')
  conflicts=(qtkeychain)
  provides=(qtkeychain)
  replaces=(qtkeychain)

  DESTDIR="$pkgdir" cmake --install build-qt5
  install -Dm644 $pkgbase-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_qtkeychain-qt6() {
  depends+=(qt6-base)

  DESTDIR="$pkgdir" cmake --install build-qt6
  install -Dm644 $pkgbase-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
