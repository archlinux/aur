# Maintainer: Tmplt <tmplt@dragons.rocks>
_pkgname=bookwyrm
pkgname="${_pkgname}-git"
pkgver=v0.5.0.r0.g92cd41b
pkgrel=1
pkgdesc="traverse various sources, find ebooks/textbooks/papers, and download them "
arch=("x86_64")
url="https://github.com/Tmplt/bookwyrm"
license=("MIT")
depends=("curl" "python")
makedepends=("cmake" "git")
provides=("bookwyrm")
conflicts=("bookwyrm")
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed "s/-/.r/;s/-/./g"
}

prepare() {
  git -C "${_pkgname}" submodule update --init --recursive
  mkdir -p "${_pkgname}/build"

  # Comment out `find_package(Curses REQUIRED)` for now
  sed -i 's/find_package(Curses REQUIRED)/#find_package(Curses REQUIRED)/' "${_pkgname}/src/tui/CMakeLists.txt"
  sed -i 's/${CURSES_LIBRARIES}/ncursesw/' "${_pkgname}/src/tui/CMakeLists.txt"

  # ad-hoc fix some install paths
  sed -i 's/usr\/bin/bin/' "${_pkgname}/src/CMakeLists.txt"
  sed -i 's/usr\/lib/lib/' "${_pkgname}/src/core/bindings/CMakeLists.txt"
}

build() {
  cd "${_pkgname}/build" || exit 1
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
  cmake --build .
}

package() {
  cmake --build "${_pkgname}/build" --target install -- DESTDIR="${pkgdir}"
}
