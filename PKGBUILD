# Maintainer: 
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_distname='baloo-widgets'
pkgname="${_distname}-git"
pkgver=24.01.90.r15.g87158a4
pkgrel=1
pkgdesc='Widgets for Baloo (Git)'
arch=('i686' 'x86_64')
url="https://invent.kde.org/libraries/${_distname}"
license=('LGPL-2.1-only OR LGPL-3.0-only OR LicenseRef-KDE-Accepted-LGPL')
depends=(
  'gcc-libs'
  'glibc'
  'baloo-git'
  'kconfig-git'
  'kcoreaddons-git'
  'kfilemetadata-git'
  'ki18n-git'
  'kio-git'
  'kservice-git'
  'kwidgetsaddons-git'
  'qt6-base'
)
makedepends=(
  'extra-cmake-modules-git'
  'git'
  'kdoctools-git'
)
provides=("${_distname}=${pkgver%.r*}")
conflicts=("${_distname}")
source=("${_distname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  git -C "${_distname}" describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"
  cmake -B build -S "${_distname}" \
      -DBUILD_TESTING=OFF \
      -DBUILD_WITH_QT6=ON \
      -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  cd "${_distname}/LICENSES"
  install -Dm644 LicenseRef-KDE-Accepted-LGPL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
