# Maintainer: ThatOneCalculator <kainoa@t1c.dev>

_pkgname="libbbf"
pkgname="$_pkgname"
pkgver=1.1.0
pkgrel=2
pkgdesc="Bound Book Format: A high-performance, DirectStorage-native container format for comics and manga"
url="https://github.com/ef1500/libbbf"
license=('MIT')
arch=('any')
depends=(
  xxhash
)
makedepends=(
  cmake
  ninja
  extra-cmake-modules
)
provides=("$_pkgname=$pkgver")
conflicts=(
    # "$_pkgname"
    "$_pkgname-bin"
    "$_pkgname-git"
)
source=(
    "${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "CMakeLists.txt"
)
sha256sums=('f730a2e8950f850a661ce94b577f787572614bc91306d6360431938775a85af2'
            '58b6aa1fdd80844b34e589c00f4de3768ab3c64f4e588a77396681e099749d3e')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  cp ../CMakeLists.txt .

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
  cd "$srcdir/$_pkgname-$pkgver"
  
  DESTDIR="$pkgdir" cmake --install build
  install -Dm0644 ./LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
