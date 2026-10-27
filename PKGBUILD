# Maintainer: Keshav Bhatt <keshavnrj@gmail.com>

pkgname=omnidict-git
_pkgname=omnidict
pkgver=1.1.0.r2.ga0824b4
pkgrel=1
pkgdesc="Offline dictionary for any language"
arch=('x86_64')
url="https://github.com/keshavbhatt/omnidict"
license=('GPL-3.0-or-later')
depends=(
  'glibc'
  'hicolor-icon-theme'
  'icu'
  'libgcc'
  'libstdc++'
  'qt6-base'
  'qt6-svg'
  'sqlite'
  'zstd'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)
optdepends=(
  'qt6-wayland: native Wayland windows'
  'xdg-desktop-portal: the quick lookup shortcut on Wayland'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/keshavbhatt/omnidict.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # The latest release tag, then the commits since: 1.1.0.r12.gabc1234. The rolling
  # "dictionaries" tag is not a version, so only v* tags count.
  git describe --long --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # The CMake project lives in app/; the dictionary pipeline next to it is not needed here.
  cmake -B build -S "${_pkgname}/app" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOMNIDICT_BUILD_TESTS=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
