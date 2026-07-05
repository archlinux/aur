# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
pkgname="kwin-effect-rounded-corners"
pkgver=0.9.0
pkgrel=2
pkgdesc="Rounds the corners of your windows (wayland)"
url="https://github.com/matinlotfali/KDE-Rounded-Corners"
license=("GPL-3.0-only")
arch=('x86_64')

depends=(
    'kwin'
    'vulkan-headers'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'ninja'
)
optdepends=(
  'kwin-effect-rounded-corners-x11: for X11 support'
)


_pkgsrc="KDE-Rounded-Corners-$pkgver"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/matinlotfali/KDE-Rounded-Corners/archive/v${pkgver}.tar.gz")
sha256sums=('4acaf2dad31a22cbfa009bdce836b969177996527237eb8c62c8393e03622c5f')

prepare() {
  # ensure Qt6
  sed -E -e 's&\bQUIET\b&REQUIRED&' -i "$_pkgsrc/cmake/qtversion.cmake"
}


build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
