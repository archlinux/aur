# Maintainer: Rustmilian Rustmilian@proton.me

pkgname=calamares-git
_pkgname=calamares

pkgver=3.4.2.r4.g841b47857
pkgrel=1
pkgdesc="Distribution-independent installer framework (git version with Python support)"
url="https://codeberg.org/Calamares/calamares"
license=("GPL-3.0-or-later")
arch=('x86_64')

provides=("calamares")
conflicts=("calamares")

depends=(
  kcoreaddons
  kpmcore
  libpwquality
  qt6-declarative
  qt6-svg
  yaml-cpp
  python
  python-yaml
  python-jsonschema
)

makedepends=(
  git
  cmake
  extra-cmake-modules
  ninja
  qt6-tools
  qt6-translations
  libglvnd
  pybind11
)

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --always | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cmake -S "$srcdir/$_pkgname" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_QT6=ON \
    -DWITH_PYTHONQT=ON \
    -DBUILD_TESTING=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
