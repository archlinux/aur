# Maintainer: Ángel Navarro <lito.15[at]proton[dot]me>
# Note: if you already cloned the original techmanwalker/beekeeper-qt repo, 
# this will clone it again. To use this PKGBUILD, it's better to
# download it separately.

pkgname=beekeeper-qt-git
pkgver=v1.3.4.r5.gbe37f24
pkgrel=1
pkgdesc="Deduplicate redundant data in your disk and save space"
url="https://github.com/techmanwalker/beekeeper-qt"
depends=('qt6-base' 'qt6-tools' 'polkit-qt6' 'systemd' 'btrfs-progs' 'bees' 'util-linux')
arch=('x86_64')
license=('AGPL-3.0-or-later')
makedepends=('git' 'cmake' 'pkgconf' 'ninja' 'cli11')
optdepends=('doxygen')
conflicts=('beekeeper-qt')
provides=('beekeeper' 'beekeeper-qt')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/"${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/"${pkgname%-git}"
  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir"/"${pkgname%-git}"
  # remove samples instal which are only needed for unit tests
  sed '/samples\/cmake_install.cmake/d' -i build/cmake_install.cmake
  DESTDIR="${pkgdir}" cmake --install build
}

# vim: ts=2 sw=2 et:
