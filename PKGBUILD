# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=jarowinkler-cpp
pkgver=1.0.0
pkgrel=1
pkgdesc="Fast Jaro and Jaro Winkler distance"
arch=(any)
url="https://github.com/maxbachmann/jarowinkler-cpp"
license=(MIT)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('879cf0b903ead3e747dab36f3d512a91db9226d80ee58bbd9cc4d5eef0d15400')

prepare() {
  # Don't install headers to /usr/lib (rapidfuzz-cpp upstream issue #71)
  sed -i '/PROPERTIES PUBLIC_HEADER/d' "$pkgname-$pkgver/CMakeLists.txt"
}

build() {
  cmake -B build -S "$pkgname-$pkgver" \
      -DCMAKE_BUILD_TYPE='None' \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE"
}
