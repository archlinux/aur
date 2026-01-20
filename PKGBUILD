# Maintainer: ThatOneCalculator <kainoa@t1c.dev>

_pkgname="qtengine"
pkgname="$_pkgname"
pkgver=0.2.0
pkgrel=5
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
sha256sums=('87d93bfa7eefc8fe3b652bc4dd7c82358e4f5d6e7f9bc123e76f4f63c02fbfcc'
            'e6816d7a46a0c16c5916d0624bfb722c0d0eb16b9830bd54db242975ff5c95c9')
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
