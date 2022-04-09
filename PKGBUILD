# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kreport
pkgver=3.2.0
pkgrel=3
pkgdesc='A framework for creation and generation of reports in multiple formats'
arch=(x86_64)
url='http://www.kexi-project.org/'
license=(GPL2)
depends=(kproperty qt5-declarative)
makedepends=(extra-cmake-modules python qt5-tools marble-common doxygen qt5-doc qt5-webkit)
optdepends=('marble-common: support for maps in reports' 'qt5-webkit: for web reports')
source=(https://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/libraries/kreport/-/commit/5d3053ea.patch)
sha256sums=('22716d719654e8f887fe4d33654e252ddf3d3d818c44e15a8af0e6f2e7d6ccd7'
            'SKIP'
            'c4f0b7ead3b0ffb1bd1d1997a78a48496c1de5dea11d48c2b9491cbabf4c5543')
validpgpkeys=(4866BAF713B465677A4059643C7C0E201B6524DB) # Jarosław Staniek <staniek@kde.org>

prepare() {
  patch -d $pkgname-$pkgver -p1 < 5d3053ea.patch # Fix missing symbols with GCC 10
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
