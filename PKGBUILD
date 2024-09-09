# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: BrinkerVII <brinkervii@gmail.com>

pkgname=luau
pkgver=0.642
pkgrel=1
pkgdesc="A fast, small, safe, gradually typed embeddable scripting language derived from Lua"
arch=(x86_64)
url="https://github.com/luau-lang/luau"
license=(MIT)
depends=(
  gcc-libs
  glibc
)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('cc7954979d2b1f6a138a9b0cb0f2d27e3c11d109594379551bc290c0461965ba')

build() {
  cd $pkgname-$pkgver

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DLUAU_BUILD_TESTS=ON \
    -DCMAKE_CXX_FLAGS="-Wstringop-overread"
  cmake --build build
}

check() {
  cd $pkgname-$pkgver

  ./build/Luau.Conformance
  ./build/Luau.UnitTest
}

package() {
  cd $pkgname-$pkgver

  local executables=(
    luau
    luau-analyze
    luau-ast
    luau-bytecode
    luau-compile
    luau-reduce
  )
  for executable in "${executables[@]}"; do
    install -Dm755 -t "$pkgdir/usr/bin" "build/$executable"
  done

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
  install -Dm644 \
    extern/isocline/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/isocline-LICENSE.txt"
}
