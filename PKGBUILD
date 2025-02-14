pkgname=wush
pkgver=0.4.1
pkgrel=3
pkgdesc='lets you easily transfer files and open shells over a peer-to-peer WireGuard connection'
arch=('x86_64')
url="https://github.com/coder/wush"
license=('CC0-1.0')
makedepends=('go')
source=("git+$url.git#tag=ecdc4288f27b417b938b84b0eba8e883f468112b")
sha256sums=('dd0e9dfe1e9022388caadfb81c90b62960afc3e46a9ab19d133fe434a31288d3')


prepare(){
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
