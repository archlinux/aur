# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=cli11-git
pkgver=2.4.2.r40.g5ed9783
pkgrel=1
pkgdesc="Command line parser for C++11"
arch=(any)
url="https://github.com/CLIUtils/CLI11"
license=(BSD-3-Clause)
makedepends=(git cmake catch2-v2 boost)
source=("git+https://github.com/CLIUtils/CLI11.git")
sha256sums=('SKIP')

pkgver() {
  cd CLI11
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _flags=(
    -DCLI11_BUILD_TESTS=ON
    -DCLI11_BOOST=ON
    -DCLI11_BUILD_DOCS=OFF
  )

  cmake -B build -S "CLI11" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D CLI11/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
