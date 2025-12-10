# Maintainer: Niels Cautaerts <nielscautaerts@hotmail.com>

pkgname=bastion-pod-ctl
pkgver=0.1.0
pkgrel=1
pkgdesc='A tool for creating tcp tunnels into a private network via a Pod running on a worker node in that private network'
arch=('x86_64')
url="https://github.com/norwoodj/$pkgname"
license=('GPL-3.0-only')
options=("!debug" "!lto")
depends=(
  "glibc"
)
makedepends=(
  'git'
  'go'
)
source=(
  "git+$url#tag=v$pkgver"
)

sha256sums=('758bf0316298c510f8e87c53f7bc0a795b7f82b8ecc16fe9dc3d149fa189b9ae')

prepare(){
  cd $pkgname
  mkdir -p build/
}

build() {
  cd $pkgname
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="$srcdir"

  local ld_flags=" \
    -compressdwarf=false \
    -linkmode=external \
  "
  go build -v -ldflags "$ld_flags" -o build ./cmd/...

}

check() {
  cd $pkgname
  go test -v ./...
}

package() {
  cd $pkgname
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
