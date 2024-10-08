pkgname=wush
pkgver=0.3.0
pkgrel=1
pkgdesc='lets you easily transfer files and open shells over a peer-to-peer WireGuard connection'
arch=('x86_64')
url="https://github.com/coder/wush"
license=('CC0-1.0')
makedepends=('go')
source=("git+$url.git#tag=b13f0553933bbac94d7290b284905adc9ac0f523")
sha256sums=('7332f0f5d7a8e7491f6c8592723a6acc2891b9f6bd4ff749a5eb6cffe94795b7')

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
