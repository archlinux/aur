pkgname=wush
pkgver=0.1.2
pkgrel=1
pkgdesc='lets you easily transfer files and open shells over a peer-to-peer WireGuard connection'
arch=('x86_64')
url="https://github.com/coder/wush"
license=('CC0-1.0')
makedepends=('go')
source=("git+$url.git#tag=7a09a3f6c2f6ed8e9b1e7f9e1dc2d4f8688764c7")
sha256sums=('83344b53484d19b99f1543c573f83a59e79dd995c74d00a36e057d465afe81e4')

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
