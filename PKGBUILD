# Maintainer: Self Denial <selfdenial@pm.me>
pkgname='maestro'
pkgdesc='Turn natual language into commands. Your CLI tasks, now as easy as a conversation.'
pkgver='0.3.0'
pkgrel='1'
arch=('x86_64')
url="https://github.com/pluja/$pkgname"
depends=('glibc')
makedepends=('go')
optdepends=('ollama: ollama support.')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('66a0fb22182bbfee2fa362a7414d08b412697e46e76062d0decf98036545f65cf46ae9bd60ddd291375166f5c49bd707a6d938dc899856aeeb2ea0568f84ceca')

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
  go build -o build .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
