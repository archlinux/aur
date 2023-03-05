# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Victor Homic <aur (at) dothomic (dot) de>
# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Aniket Pradhan <aniket17133 (at) iiitd (dot) ac (dot) in>
# Contributor: Martin Briza <m (at) rtinbriza (dot) cz>

_base=adwaita-qt
pkgbase=adwaita-solarized-qt
pkgname=(adwaita-solarized-qt5 adwaita-solarized-qt6)
pkgver=1.4.2
pkgrel=1
pkgdesc='A solarized style to bend Qt applications to look like they belong into GNOME Shell'
arch=(x86_64)
url='https://github.com/FedoraQt/adwaita-qt'
license=(GPL)
makedepends=(cmake qt5-x11extras qt6-base)
source=(
    https://github.com/FedoraQt/adwaita-qt/archive/$pkgver/$_base-$pkgver.tar.gz
    solarized.patch
)
sha256sums=('cd5fd71c46271d70c08ad44562e57c34e787d6a8650071db115910999a335ba8'
            'a9606b8d99e0e0ad6948ee75b39596baeed1061c97859cace80a3732fe444eaf')

prepare() {
    cd "$_base-$pkgver"

    patch -p1 < "$srcdir/solarized.patch"
}

build() {
  cmake -B build-qt5 -S $_base-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=OFF
  cmake --build build-qt5

  cmake -B build-qt6 -S $_base-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=ON
  cmake --build build-qt6
}

package_adwaita-solarized-qt5() {
  pkgdesc='A solarized style to bend Qt5 applications to look like they belong into GNOME Shell'
  depends=(qt5-x11extras)
  replaces=(adwaita-qt)
  conflicts=(adwaita-qt5)

  DESTDIR="$pkgdir" cmake --install build-qt5
}

package_adwaita-solarized-qt6() {
  pkgdesc='A solarized style to bend Qt6 applications to look like they belong into GNOME Shell'
  depends=(qt6-base)
  conflicts=(adwaita-qt6)

  DESTDIR="$pkgdir" cmake --install build-qt6
}

