# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Zatherz <zatherz at linux dot pl>

pkgname=qt5ct-kde
_pkgname=qt5ct
pkgver=1.2
pkgrel=2
pkgdesc="Qt5 Configuration Utility, patched to work correctly with KDE applications"
arch=(x86_64)
url="https://qt5ct.sourceforge.io/"
license=(BSD)
depends=(qqc2-desktop-style)
makedepends=(cmake qt5-tools)
conflicts=(qt5ct)
provides=(qt5ct)
source=(https://downloads.sourceforge.net/project/$_pkgname/$_pkgname-$pkgver.tar.bz2
        qt5ct-datadir.patch
        qt5ct-shenanigans.patch)
sha256sums=('1de3f06e6d5d0746bf19a949e56cc04b53bdbc18294f38cb20759f35006b872e'
            '58422b0fff7de20ba45744d0a7610da5685142daf5db12414d3fed8fd91b152f'
            'bdac1e0bf247e2ae054f3ad5f8069b41f84ac60740a1afa9e9433908c71ae0f4')

prepare() {
  patch -d $_pkgname-$pkgver -p1 < qt5ct-datadir.patch # Fix data install dir
  patch -d $_pkgname-$pkgver -p1 < qt5ct-shenanigans.patch # The magic
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $_pkgname-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
} 

