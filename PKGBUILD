# Maintainer: brain <brain@derelict.garden>

pkgname=ladybird-git
pkgver='r64.7040a87'
pkgrel=1
pkgdesc='Web browser built from scratch using the SerenityOS LibWeb engine'
arch=(x86_64)
url="https://github.com/awesomekling/ladybird"
license=(BSD)
depends=(libgl qt6-base qt6-wayland)
conflicts=(ladybird)
provides=(ladybird)
makedepends=(cmake git ninja qt6-tools unzip)
_commit=7040a8790c1a8cb4879abe04b1198ec6e64d1c92
source=(
  "git+$url#commit=$_commit"
  "ladybird.sh"
)
sha256sums=('SKIP'
            '79a49b4ec5f413fae704df71c41542caa0f4a4c4b471a5c2529d1851fe0ae416')

pkgver() {
  cd ladybird
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ladybird

  cmake -GNinja -B Build
  cmake --build Build
  ninja -C Build
}

package() {
  cd ladybird
  mkdir -p "$pkgdir/usr/lib/ladybird" "$pkgdir/usr/share/serenity"

  cp -R Build/_deps/lagom-build/*.so* "$pkgdir/usr/lib/"
  cp -R Build/serenity/* "$pkgdir/usr/share/serenity/"
  install -Dm0755 Build/ladybird "$pkgdir/usr/share/serenity/Base/bin/ladybird"
  install -Dm0755 "$srcdir/ladybird.sh" "$pkgdir/usr/bin/ladybird"

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
