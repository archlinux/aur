# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=rapidfuzz-cpp
pkgver=1.0.1
pkgrel=1
pkgdesc="Rapid fuzzy string matching in C++ using the Levenshtein Distance"
arch=(any)
url="https://github.com/maxbachmann/rapidfuzz-cpp"
license=(MIT)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('17ef77d33c3d48cd4cba33a4f1aabbf453473ac4826333da24d7631d2953dfa5')

prepare() {
  # Don't install headers to /usr/lib (upstream issue #71)
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
