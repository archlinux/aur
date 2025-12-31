# Maintainer: Ryan Steed <ryan.steed.usa@pm.me>
# Contributor: Self Denial <selfdenial@pm.me>
pkgname='gollama'
pkgdesc='Go manage your Ollama models'
pkgver='2.0.4'
pkgrel='1'
arch=('x86_64')
url="https://github.com/sammcj/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('ollama: ollama support.')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('44f111e0d3ac3669e2691b1071f09de244af663a15c5c2ed7de75a54e1127f63bc8672482f0360c97545d24903a29b1250bc97e25f8b54721a69d99e6c82826d')

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
