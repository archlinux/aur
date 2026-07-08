# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Felix Kauselmann <licorn at gmail dot com>

pkgname=yacreader-poppler
pkgver=10.1.0
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
source=("git+https://github.com/YACReader/yacreader.git#tag=${pkgver}")
sha256sums=('6cf1169fc01f4d850c5a9b505044ab06b21623f61daca3921c2d3f20b0d7bb06')

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
