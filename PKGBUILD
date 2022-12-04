# Maintainer: brain <brain@derelict.garden>

pkgname=ladybird-git
pkgver='r190.175cfac'
pkgrel=1
pkgdesc='Web browser built from scratch using the SerenityOS LibWeb engine'
arch=(x86_64)
url="https://github.com/SerenityOS/ladybird"
license=(BSD)
depends=(libgl qt6-base qt6-wayland)
conflicts=(ladybird)
provides=(ladybird)
makedepends=(cmake git ninja qt6-tools unzip)
options=('!lto')
_commit=175cfaca9e5b5b326ef9ee3ce4717e161fe5f14e
_serenity_commit=f3763a527592fae56401e8f8461d644ddc172d05
source=(
  "git+$url#commit=$_commit"
  "git+https://github.com/SerenityOS/serenity.git#commit=$_serenity_commit"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd ladybird
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -GNinja -B build -S "ladybird" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DSERENITY_SOURCE_DIR="$srcdir/serenity" \
    -Wno-dev
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja install -C build
  install -Dm644 "$srcdir/ladybird/LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
