# Maintainer: Ryan Steed <ryan.steed.usa@pm.me>
# Contributor: Self Denial <selfdenial@pm.me>
pkgname='gollama'
pkgdesc='Go manage your Ollama models'
pkgver='2.0.1'
pkgrel='1'
arch=('x86_64')
url="https://github.com/sammcj/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('ollama: ollama support.')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('a717f3d67261b093b5164cc4c6f955ae7ab99f1634f16530ac42bcf0207feb861ecf22aed353be33e802f49f38946b49891b516e7c6bd144824ea8e30e23e3d6')

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
