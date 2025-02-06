# Maintainer: Self Denial <selfdenial@pm.me>
pkgname='gollama'
pkgdesc='Go manage your Ollama models'
pkgver='1.28.12'
pkgrel='1'
arch=('x86_64')
url="https://github.com/sammcj/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('ollama: ollama support.')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('04bf5fe43a92b5000140b0e71176ef266ab8a6d5258ec5890f7cde2c94cbc7f19f4b544ce09695c2a379ac77addda8c11a70a6a6ba63b743396e6a846730d1c4')

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
  go build -ldflags="-X main.Version=$pkgver" -o build .
}

check() {
  cd "$pkgname-$pkgver"
  env CI=1 go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
