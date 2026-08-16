# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bence Toth <oss at bnctth dot dev>
# Based on Chocobo1's rpi-image-git package, thanks!

pkgname=unraid-usb-creator-git
pkgver=2.0.11.unraid.1.r0.g9c04d58
pkgrel=1
pkgdesc="Unraid os usb creator utility"
arch=(x86_64)
url="https://github.com/unraid/usb-creator-next"
license=(Apache-2.0)
depends=(
    acl
    brotli
    glibc
    gnutls
    hicolor-icon-theme
    libgcc
    libidn2
    libstdc++
    liburing
    nettle
    qt6-base
    qt6-declarative
    )
makedepends=(
    cmake
    git
    jemalloc
    qt6-svg
    qt6-tools
    vulkan-headers
    )
provides=(unraid-usb-creator)
conflicts=(unraid-usb-creator)
source=("git+https://github.com/unraid/usb-creator-next.git")
sha256sums=('SKIP')

prepare() {
  cd "usb-creator-next/src/dependencies"
  # https://github.com/unraid/usb-creator-next/issues/123
  sed -i 's|8.20.0|8.21.0|g' curl.cmake
}

pkgver() {
  cd "usb-creator-next"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Disable all warnings
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"

  local _flags=(
    -DFETCHCONTENT_QUIET:BOOL=OFF
  )

  cmake -B build -S "usb-creator-next/src" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
