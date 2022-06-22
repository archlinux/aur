# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=kvantum-git
_pkgname=Kvantum
pkgver=1.0.2.r10.g01d397d5
pkgrel=1
pkgdesc='SVG-based theme engine for Qt5/6 (including config tool and extra themes)'
arch=(x86_64)
url='https://github.com/tsujan/Kvantum'
license=(GPL)
provides=(kvantum-qt5 kvantum)
conflicts=(kvantum-qt5 kvantum)
replaces=(kvantum-qt5)
depends=(qt5-svg kwindowsystem hicolor-icon-theme)
makedepends=(cmake qt5-tools qt6-tools qt6-svg)
optdepends=('qt6-svg: Qt6 style')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd "${srcdir}"/"${_pkgname}"
   git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Fix Qt6 build with Qt5 installed
  sed -e 's|Qt6 Qt5|Qt6|' -i Kvantum/Kvantum/*/CMakeLists.txt
}

build() {
  cmake -B build5 -S Kvantum/Kvantum \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build5

  cmake -B build6 -S Kvantum/Kvantum \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_QT5=OFF
  make -C build6
}

package() {
  DESTDIR="$pkgdir" cmake --install build5 
  DESTDIR="$pkgdir" cmake --install build6
}
