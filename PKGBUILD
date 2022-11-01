# Maintainer: skwerlman <skw@tetrarch.co>
# Contributor: Ethan Rakoff <ethan@ethanrakoff.com>
# Contributor: Scott Linder <scott.linder18@gmail.com>
# Contributor: Jorge Araya Navarro <elcorreo@deshackra.com>
# Contributor: Mikhail Burakov <mikhail.burakov@gmail.com>

# shellcheck shell=bash
# shellcheck disable=SC2034

_pkgbase=cockatrice
pkgname=("cockatrice-client-git" "cockatrice-server-git")
pkgver=2.8.1.beta.10.r16.g5854a635
pkgrel=1
pkgdesc='Open-source multiplatform supported program for playing tabletop card games over a network.'
arch=('i686' 'x86_64')
url='https://cockatrice.github.io/'
license=('GPL2')
makedepends=('cmake' 'git' 'zlib' 'xz' 'mariadb-libs' 'protobuf' 'qt6-svg' 'qt6-tools' 'qt6-multimedia' 'qt6-websockets')
checkdepends=('gtest' 'valgrind')
source=("git+https://github.com/cockatrice/cockatrice")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgbase}" || exit 1
  git describe --long --tags | cut -d- -f5- | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "${_pkgbase}/build"
}

build() {
  # Normally, CMake PKGBUILDS should override to set -O2 manually
  # However, trice sets -O2 for Release builds, so we don't need to do this
  # See the following:
  # https://wiki.archlinux.org/title/CMake_package_guidelines#CMake_can_automatically_override_the_default_compiler_optimization_flag
  # https://github.com/Cockatrice/Cockatrice/blob/master/CMakeLists.txt#L119
  cmake -B "${_pkgbase}/build" -S "${_pkgbase}" -DCMAKE_INSTALL_PREFIX:PATH=/usr -DWITH_ORACLE=1 -DWITH_CLIENT=1 -DWITH_DBCONVERTER=1 -DWITH_SERVER=1 -DTEST=1
  make -C "${_pkgbase}/build"
}

check() {
  make -C "${_pkgbase}/build" test
}

package_cockatrice-client-git() {
  provides=('cockatrice-client')
  conflicts=('cockatrice-client')
  depends=('protobuf' 'qt6-multimedia' 'qt6-websockets' 'hicolor-icon-theme')
  optdepends=('zlib: Support compressed MTGJSON in Oracle' 'xz: Support compressed MTGJSON in Oracle')

  cmake -B "${_pkgbase}/build" -S "${_pkgbase}" -DCMAKE_INSTALL_PREFIX:PATH=/usr -DWITH_ORACLE=1 -DWITH_CLIENT=1 -DWITH_DBCONVERTER=1 -DWITH_SERVER=0 -DTEST=0
  make -C "${_pkgbase}/build" DESTDIR="${pkgdir}/" install
}

package_cockatrice-server-git() {
  provides=('cockatrice-server')
  conflicts=('cockatrice-server')
  depends=('protobuf' 'qt6-websockets' 'hicolor-icon-theme')
  optdepends=('mariadb: database support')

  cmake -B "${_pkgbase}/build" -S "${_pkgbase}" -DCMAKE_INSTALL_PREFIX:PATH=/usr -DWITH_ORACLE=0 -DWITH_CLIENT=0 -DWITH_DBCONVERTER=0 -DWITH_SERVER=1 -DTEST=0
  make -C "${_pkgbase}/build" DESTDIR="${pkgdir}/" install
}
