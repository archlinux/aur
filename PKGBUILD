# Maintainer: urFate <georgiylakidon at gmail dot com>

pkgbase=qadwaitaplatform-git
_pkgname=QAdwaitaPlatform
pkgname=(qadwaitaplatform-qt5-git qadwaitaplatform-qt6-git qadwaita-color-schemes)
pkgver=4.0.r2.g280e210
pkgrel=1
pkgdesc='QAdwaitaPlatform is QGnomePlatform fork that implements modern LibAdwaita window decoration look to Qt applications.'
arch=(x86_64)
url='https://github.com/urFate/QAdwaitaPlatform'
license=(LGPL2.1)
makedepends=(cmake git gtk3 qt5-wayland qt5-quickcontrols2 qt6-wayland adwaita-qt5 adwaita-qt6)
source=(git+https://github.com/urFate/$_pkgname.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build-qt5 -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=OFF
  cmake --build build-qt5

  cmake -B build-qt6 -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=ON
  cmake --build build-qt6
}

package_qadwaitaplatform-qt5-git() {
  pkgdesc='QAdwaitaPlatform is QGnomePlatform fork that implements modern LibAdwaita window decoration look to Qt applications.'
  depends=(gtk3 qt5-wayland qt5-quickcontrols2 adwaita-qt5 qadwaita-color-schemes)
  replaces=(qadwaitaplatform qadwaitaplatform-git)
  provides=(qadwaitaplatform-qt5)
  conflicts=(qadwaitaplatform-qt5 qgnomeplatform-qt5)

  DESTDIR="$pkgdir" cmake --install build-qt5
  rm -r "$pkgdir"/usr/share
}

package_qadwaitaplatform-qt6-git() {
  pkgdesc='QAdwaitaPlatform is QGnomePlatform fork that implements modern LibAdwaita window decoration look to Qt applications.'
  depends=(gtk3 qt6-wayland adwaita-qt6 qadwaita-color-schemes)
  provides=(qadwaitaplatform-qt6)
  conflicts=(qadwaitaplatform-qt6 qgnomeplatform-qt6)

  DESTDIR="$pkgdir" cmake --install build-qt6
  rm -r "$pkgdir"/usr/share
}

package_qadwaita-color-schemes() {
  pkgdesc='Adwaita color schemes for KDE applications'
  conflicts=(adwaita-color-schemes)

  DESTDIR="$pkgdir" cmake --install build-qt5/src/color-schemes
}

