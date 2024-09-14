# Maintainer: Self Denial <selfdenial@pm.me>
pkgname='gollama'
pkgdesc='Go manage your Ollama models'
pkgver='1.27.7'
pkgrel='1'
arch=('x86_64')
url="https://github.com/sammcj/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('ollama: ollama support.')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('cee0a179c02cb34af967c2bea39316f903b5480597a2ab2516709f310e14294db5b5a74e071256e0336c8e17a5f5f0bba056756256cd7be7bb144e047b14456a')

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
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
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
