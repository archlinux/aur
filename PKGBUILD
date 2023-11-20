# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname='baloo-widgets'
pkgname="${_pkgname}-git"
pkgver=24.01.75.r5.gd46693c
pkgrel=2
pkgdesc='Widgets for Baloo (Git)'
arch=('i686' 'x86_64')
url="https://invent.kde.org/libraries/${_pkgname}"
license=('LGPL')
depends=(
  'gcc-libs'
  'glibc'
  'baloo'
  'kconfig'
  'kcoreaddons'
  'kfilemetadata'
  'ki18n'
  'kio'
  'kservice'
  'kwidgetsaddons'
  'qt6-base'
)
makedepends=(
  'extra-cmake-modules-git'
  'git'
  'kdoctools'
)
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}"
  'kf5-transition-dummy'    # needs to avoid pulling in this fake package
)
source=("${_pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"
  cmake -B build -S "${_pkgname}" \
      -DBUILD_TESTING=OFF \
      -DBUILD_WITH_QT6=ON \
      -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
