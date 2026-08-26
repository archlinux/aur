# Maintainer: Damian Höster <damian.hoester@posteo.de>

_pkgname=rawtoaces
pkgname=$_pkgname-git
pkgver=2.1.0.r47.ab25a36
pkgrel=1
pkgdesc='RAW to ACES utility for converting digital camera RAW files to ACES container files'
arch=(x86_64)
url=https://github.com/AcademySoftwareFoundation/rawtoaces
license=(Apache-2.0)

depends=(
  ceres-solver
  eigen
  gcc-libs
  glibc
  lensfun
  nanobind
  nlohmann-json
  openimageio
  python
)

makedepends=(
  cmake
  git
  ninja
  pkgconf
)

optdepends=(
  'perl-image-exiftool: for reading RAW image metadata via exiftool'
)

provides=($_pkgname)
conflicts=($_pkgname)

source=(
  $_pkgname::git+$url.git
  rawtoaces-data::git+https://github.com/AcademySoftwareFoundation/rawtoaces-data.git
)

sha256sums=(
  SKIP
  SKIP
)

pkgver() {
  git -C $_pkgname describe --long --tags |
    sed -E 's/^v//; s/-([^-]*)-g([^-]*)$/.r\1.\2/; s/-/./g'
}

prepare() {
  # Fix installation path when pre-populating rawtoaces-data via FETCHCONTENT_SOURCE_DIR.
  sed -i \
    's|\${PROJECT_BINARY_DIR}/_deps/rawtoaces_data-src|\${rawtoaces_data_SOURCE_DIR}|g' \
    $_pkgname/CMakeLists.txt

  # Set the system data directory in search paths.
  local _search='"/usr/local/share/rawtoaces/data" + separator + legacy_path'
  local _replace='"/usr/share/rawtoaces/data"'
  sed -i "s|$_search|$_replace|" $_pkgname/src/rawtoaces_util/image_converter.cpp
}

build() {
  export CFLAGS+=" -ffile-prefix-map=$srcdir=."
  export CXXFLAGS+=" -ffile-prefix-map=$srcdir=."

  cmake -S $_pkgname -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFETCHCONTENT_SOURCE_DIR_RAWTOACES_DATA="$srcdir"/rawtoaces-data \
    -DRTA_BUILD_TESTS=OFF \
    -G Ninja

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $_pkgname/LICENSE \
    -t "$pkgdir"/usr/share/licenses/$pkgname

  # Move Python C extension module into Python site-packages directory.
  local _site_packages
  _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

  mkdir -p $pkgdir"$_site_packages"

  find "$pkgdir"/usr/lib \
    -maxdepth 1 \
    -name 'rawtoaces*.so' \
    -exec mv -t "$pkgdir$_site_packages" {} +
}
