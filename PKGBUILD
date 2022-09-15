# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgbase=adwaita-qt-git
pkgname=(adwaita-qt5-git adwaita-qt6-git)
pkgver=1.4.1.r17.g417df19
pkgrel=1
pkgdesc='A style to bend Qt applications to look like they belong into GNOME Shell, git package.'
arch=(x86_64)
url='https://github.com/FedoraQt/adwaita-qt'
license=(GPL)
makedepends=(cmake git qt5-x11extras qt6-base)
source=("${pkgbase%-git}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${pkgbase%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build-qt5 -S ${pkgbase%-git} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=OFF
  cmake --build build-qt5

  cmake -B build-qt6 -S ${pkgbase%-git} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=ON
  cmake --build build-qt6
}

package_adwaita-qt5-git() {
  pkgdesc='A style to bend Qt5 applications to look like they belong into GNOME Shell, git version'
  depends=(qt5-base)
  optdepends=('qt5-x11extras: For X11 and/or xwayland support')
  conflicts=(adwaita-qt adwaita-qt5)
  provides=(adwaita-qt5 adwaita-qt-git)

  DESTDIR="$pkgdir" cmake --install build-qt5
}

package_adwaita-qt6-git() {
  pkgdesc='A style to bend Qt6 applications to look like they belong into GNOME Shell, git version'
  depends=(qt6-base)
  conflicts=(adwaita-qt6)
  provides=(adwaita-qt6)

  DESTDIR="$pkgdir" cmake --install build-qt6
}
