# Maintainer: Self Denial <selfdenial@pm.me>
pkgname='gollama'
pkgdesc='Go manage your Ollama models'
pkgver='1.27.24'
pkgrel='2'
arch=('x86_64')
url="https://github.com/sammcj/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('ollama: ollama support.')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('540476addfe7d163440265935685006f5b2b5c7ff261e3fa660089d1c892074cf283f6dba94016bbc49d2663a0bc9d2f7358da91c956a81c26f9aa4681dcd95c')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -modcacherw'
  go mod tidy
  go build -ldflags="-X main.Version=$pkgver" -o build .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
