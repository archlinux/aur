# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Felix Kauselmann <licorn at gmail dot com>

pkgname=yacreader-poppler-git
pkgver=10.1.0.r0.g65ee651
pkgrel=1
pkgdesc="Comic reader for cross-platform reading and managing your digital comic collection, using poppler for PDF"
arch=(x86_64)
url="https://github.com/YACReader/yacreader"
license=(GPL-3.0-only)
depends=(
    glibc
    hicolor-icon-theme
    libgcc
    libstdc++
    libunarr
    poppler-qt6
    qt6-5compat
    qt6-base
    qt6-declarative
    qt6-speech
    qt6-svg
    )
makedepends=(
    cmake
    git
    qt6-tools
    vulkan-headers
    )
optdepends=(
    'qt6-imageformats: Support for extra image formats'
    'qrencode: YACReaderLibrary server info qr codes'
    )
provides=(yacreader)
conflicts=(yacreader)
source=("git+https://github.com/YACReader/yacreader.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "yacreader"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Disable warning Detected locale "C" with character encoding "ANSI_X3.4-1968", which is not UTF-8.
  export LANG=C.UTF-8
  export LC_ALL=C.UTF-8

  # Disable all warnings
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"

  local _flags=(
    -DDECOMPRESSION_BACKEND=unarr
    -DPDF_BACKEND=poppler
    -DPoppler_DIR=/usr/include/poppler/qt6
    -DBUILD_SERVER_STANDALONE=OFF
  )

  cmake -B build -S "yacreader" -Wno-dev \
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
}
