# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Yuki Takagi <takagiy.4dev@gmail.com>

pkgname=toml11-git
pkgver=4.3.0.r10.0c5472e
pkgrel=1
pkgdesc="A C++11 header-only toml parser/encoder depending only on C++ standard library"
arch=(any)
url="https://github.com/ToruNiina/toml11"
license=(MIT)
makedepends=(git cmake boost)
provides=(toml11)
conflicts=(toml11)
source=("git+https://github.com/ToruNiina/toml11.git#branch=main"
        "git+https://github.com/doctest/doctest.git"
        "nlohmann-json::git+https://github.com/nlohmann/json.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd toml11
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd toml11
  git submodule init
  git config submodule.tests/extlib/doctest.url "${srcdir}/doctest"
  git config submodule.tests/extlib/json.url "${srcdir}/nlohmann-json"
  git config submodule.docs/themes/hugo-book.update none
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S "toml11" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DTOML11_BUILD_TESTS:BOOL=ON \
    -DTOML11_BUILD_TOML_TESTS:BOOL=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "toml11/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "toml11/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
