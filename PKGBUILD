# Maintainer: ThatOneCalculator <kainoa@t1c.dev>

_pkgname="qtengine"
pkgname="$_pkgname"
pkgver=0.2.2
pkgrel=1
pkgdesc="QT Platform Theme made easy"
url="https://github.com/kossLAN/qtengine"
license=('BSD-2-Clause')
arch=('x86_64')
depends=(
  kcolorscheme
  kconfig
  kiconthemes
  kconfigwidgets
  kconfigwidgets5
  kiconthemes5
  qt6-base
  qt5-base
)
makedepends=(
  cmake
  ninja
  extra-cmake-modules
)
provides=("$_pkgname")
conflicts=(
    # "$_pkgname"
    "$_pkgname-bin"
    "$_pkgname-git"
)
source=(
    "${url}/archive/refs/tags/${pkgver}.tar.gz"
    "config.example.json"
)
sha256sums=('8406285955ac735c8b208a73ad4d106535b32da47e25f050a5be18bbc9f0445e'
            '5dfcc6479a03140e492eff69936c708d1bffba3edf9d5312b27b5efff61fa06e')
install="$_pkgname.install"

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  local _cmake_options=(
    -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  cd "$srcdir"
  install -Dm0644 ./config.example.json -t "$pkgdir/etc/$_pkgname/"

  cd "$_pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm0644 ./LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"

}
