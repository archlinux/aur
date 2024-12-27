pkgname=wush
pkgver=0.4.0
pkgrel=2
pkgdesc='lets you easily transfer files and open shells over a peer-to-peer WireGuard connection'
arch=('x86_64')
url="https://github.com/coder/wush"
license=('CC0-1.0')
makedepends=('go')
source=("git+$url.git#tag=ca4d666d41f63e470ef4327c19b4feb762a814b6")
sha256sums=('97ec90787cfd7e4940943cc85494112ebf889b29a590aef007cf9886247fdd28')

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
