# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgbase=kvantum-git
pkgname=(kvantum-git
  kvantum-qt5-git)
_pkgname=Kvantum
pkgver=1.0.10.r52.ge1c4d44a
pkgrel=1
pkgdesc='SVG-based theme engine for Qt6 (including config tool and extra themes)'
arch=(x86_64)
url='https://github.com/tsujan/Kvantum'
license=(GPL-3.0-or-later)
depends=(gcc-libs
  glibc
  libx11)
makedepends=(cmake
  kwindowsystem5
  qt5-svg
  qt5-tools
  qt5-x11extras
  qt6-svg
  qt6-tools)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/"${_pkgname}"
  git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Fix Qt6 build with Qt5 installed
  sed -e 's|Qt6 Qt5|Qt6|' -i Kvantum/Kvantum/*/CMakeLists.txt
  # Build manager with Qt6
  sed -e 's|if(ENABLE_QT5)|if(TRUE)|' -i Kvantum/Kvantum/CMakeLists.txt
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

package_kvantum-git() {
  depends+=(qt6-base
    qt6-svg)
  optdepends=('kvantum-qt5-git: Qt5 style')
  conflicts=(kvantum)
  provides=(kvantum)
  replaces=(kvantum-qt6-git)

  DESTDIR="$pkgdir" cmake --install build6
}

package_kvantum-qt5-git() {
  pkgdesc='SVG-based theme engine for Qt5'
  depends+=(kvantum-git
    kwindowsystem5
    qt5-base
    qt5-svg
    qt5-x11extras)
  conflicts=(kvantum-qt5)
  provides=(kvantum-qt5)

  DESTDIR="$pkgdir" cmake --install build5/style
}
