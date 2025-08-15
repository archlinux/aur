pkgname=taskvanguard
pkgver=0.2.8
pkgrel=1
pkgdesc='TaskVanguard - LLM / AI Wrapper for TaskWarrior via API (OpenAI, Deepseek etc.)'
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/taskvanguard/taskvanguard"
license=('AGPL-3.0')
makedepends=('go')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f53957ced0d8936dedf2f9c6d94dbf9550927443ad31b43cbffc7c7ff4fb0cf4')

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
  go build -o build ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/vanguard "$pkgdir"/usr/bin/vanguard
}
