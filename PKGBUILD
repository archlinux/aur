# Maintainer: Damian Höster <damian.hoester@posteo.de>

pkgname=rawtoaces
pkgver=2.2.0
_dataver=1.1.0
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
  ninja
  pkgconf
)

optdepends=(
  'perl-image-exiftool: for reading RAW image metadata via exiftool'
)

source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
  rawtoaces-data-$_dataver.tar.gz::$url-data/archive/refs/tags/v$_dataver.tar.gz
)

sha256sums=(
  'dd4b53d83aaceb4a4ff97914b5bf1b820c929bd1a480d62c263d1849a8aa56dd'
  'd84051305009e5a154062f837f62d432bc69f7ad9e220f3a57a056ddc9b8911f'
)

prepare() {
  # Fix installation path when pre-populating rawtoaces-data via FETCHCONTENT_SOURCE_DIR.
  sed -i \
    's|\${PROJECT_BINARY_DIR}/_deps/rawtoaces_data-src|\${rawtoaces_data_SOURCE_DIR}|g' \
    $pkgname-$pkgver/CMakeLists.txt

  # Set the system data directory in search paths.
  local _search='"/usr/local/share/rawtoaces/data" + separator + legacy_path'
  local _replace='"/usr/share/rawtoaces/data"'
  sed -i "s|$_search|$_replace|" $pkgname-$pkgver/src/rawtoaces_util/image_converter.cpp
}

build() {
  export CFLAGS+=" -ffile-prefix-map=$srcdir=."
  export CXXFLAGS+=" -ffile-prefix-map=$srcdir=."

  cmake -S $pkgname-$pkgver -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFETCHCONTENT_SOURCE_DIR_RAWTOACES_DATA="$srcdir"/rawtoaces-data-$_dataver \
    -DRTA_BUILD_TESTS=OFF \
    -G Ninja

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $pkgname-$pkgver/LICENSE \
    -t "$pkgdir"/usr/share/licenses/$pkgname

  # Move Python C extension module into Python site-packages directory.
  local _site_packages
  _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

  mkdir -p "$pkgdir$_site_packages"

  find "$pkgdir"/usr/lib \
    -maxdepth 1 \
    -name 'rawtoaces*.so' \
    -exec mv -t "$pkgdir$_site_packages" {} +
}
