pkgname=taskvanguard
pkgver=0.2.4
pkgrel=1
pkgdesc='TaskVanguard - LLM / AI Wrapper for TaskWarrior via API (OpenAI, Deepseek etc.)'
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/taskvanguard/taskvanguard"
license=('AGPL-3.0')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('93d8437fc713d6830f9671c30d15008ea0d0b8367d954fb986f71c1682dc974f')

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
