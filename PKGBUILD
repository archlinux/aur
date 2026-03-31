# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
pkgname="kwin-effect-rounded-corners-x11"
pkgver=0.8.7
pkgrel=1
pkgdesc="Rounds the corners of your windows (x11)"
url="https://github.com/matinlotfali/KDE-Rounded-Corners"
license=("GPL-3.0-only")
arch=('x86_64')

depends=(
  'kwin'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'ninja'
)


_pkgsrc="KDE-Rounded-Corners-$pkgver"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/matinlotfali/KDE-Rounded-Corners/archive/v${pkgver}.tar.gz")
sha256sums=('f753fe435d96cad6f5b543996eeb9a6f781fada34e77121ddef6ac5aced2f7d2')

prepare() {
  # ensure Qt6
  sed -E -e 's&\bQUIET\b&REQUIRED&' -i "$_pkgsrc/cmake/qtversion.cmake"
}


build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DKWIN_X11=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
