# Maintainer: Ángel Navarro <lito.15[at]proton[dot]me>

pkgname=beekeeper-qt
pkgver=a0339c8
pkgrel=1
pkgdesc="Deduplicate redundant data in your disk and save space"
url="https://github.com/techmanwalker/beekeeper-qt"
depends=('qt6-base' 'qt6-tools' 'polkit-qt6' 'systemd' 'btrfs-progs' 'bees')
arch=('x86_64')
license=('AGPL-3.0-or-later')
makedepends=('git' 'cmake' 'pkgconf' 'ninja')
optdepends=('util-linux' 'doxygen')
provides=('beekeeper')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # Check if HEAD is exactly at a tag
  TAG=$(git describe --tags --exact-match 2>/dev/null || true)
  if [ -n "$TAG" ]; then
    # If on a tag, use tag name (remove leading v if exists)
    echo "${TAG#v}"
  else
    # Otherwise, fallback to commit hash style (current behavior)
    git describe --long --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  fi
}

build() {
  cd "$pkgname"
  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$pkgname"
  # remove samples instal which are only needed for unit tests
  sed '/samples\/cmake_install.cmake/d' -i build/cmake_install.cmake
  DESTDIR="${pkgdir}" cmake --install build
}

# vim: ts=2 sw=2 et:
