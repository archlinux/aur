pkgname=wallhaven-cli
cli=wallhaven
pkgver=2.0.6
pkgrel=1
pkgdesc='Search and download wallpapers from wallhaven.'
arch=('x86_64')
url="https://github.com/r3tr0ananas/wallhaven-cli"
license=('MIT')
makedepends=('go' 'chafa' 'fzf')
optdepends=(
  'kitty'
)
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c042ce2773eb49f4cbac875172e5365873c66a8a81e80844c6691bd77a07ac50')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./wallhaven/...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$cli "$pkgdir"/usr/bin/$cli
}