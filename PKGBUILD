pkgname=wush
pkgver=0.4.0
pkgrel=3
pkgdesc='lets you easily transfer files and open shells over a peer-to-peer WireGuard connection'
arch=('x86_64')
url="https://github.com/coder/wush"
license=('CC0-1.0')
makedepends=('go')
source=("git+$url.git#tag=1ff2c900451e11ae43666d36a0651f8a9142e082")
sha256sums=('839f0971a0345b23ec6cc623e0af8a1dd3171242d874f87297b6bf6db7c30e54')


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
