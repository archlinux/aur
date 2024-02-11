# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Timothée Ravier <tim@siosm.fr>

_distname=networkmanager-qt
pkgname="${_distname}-git"
pkgver=5.249.0.r2.g7bc1121
pkgrel=4
pkgdesc="KDE's Qt wrapper for NetworkManager API (git build)"
arch=(x86_64)
url="https://invent.kde.org/frameworks/${_distname}"
license=('LGPL-2.1-only OR LGPL-3.0-only OR LicenseRef-KDE-Accepted-LGPL')
depends=(gcc-libs
         glibc
         qt6-base
         qt6-declarative)
makedepends=(doxygen
             extra-cmake-modules-git
             git
             libnm
             qt6-doc
             qt6-tools)
provides=("${_distname}=${pkgver%.r*}")
conflicts=("${_distname}")
source=("${_distname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd ${_distname}
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${_distname}" \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  depends+=(networkmanager)
  DESTDIR="${pkgdir}" cmake --install build

  cd "${_distname}/LICENSES"
  install -Dm644 LicenseRef-KDE-Accepted-LGPL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
