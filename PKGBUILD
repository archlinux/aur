# Maintainer: brain <brain@derelict.garden>
pkgname='ladybird'
pkgver='r64.7040a87'
pkgrel=1
pkgdesc="A web browser built from scratch using the SerenityOS LibWeb engine."
arch=('x86_64')
url="https://github.com/awesomekling/ladybird"
license=('BSD')
groups=()
depends=(qt6-base libgl qt6-wayland)
makedepends=(cmake ninja qt6-tools unzip git)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
commit=7040a8790c1a8cb4879abe04b1198ec6e64d1c92
source=(
	"git+https://github.com/awesomekling/$pkgname.git#commit=$commit"
	"ladybird.sh"
)
noextract=()
sha256sums=(
	'SKIP'
	'1d0fc030877f9074443ef71835518c043908360b5dac67d907d8b2317baa37c4'
)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  cmake -GNinja -B Build
  cmake --build Build
  ninja -C Build
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/lib/$pkgname" "$pkgdir/usr/share/serenity"

  cp -R Build/_deps/lagom-build/*.so* "$pkgdir/usr/lib/"
  cp -R Build/serenity/* "$pkgdir/usr/share/serenity/"
  install -Dm0755 Build/ladybird "$pkgdir/usr/share/serenity/Base/bin/$pkgname"
  install -Dm0755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
