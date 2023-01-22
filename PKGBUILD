# Maintainer: Josephine Pfeiffer <hi@josie.lol>

pkgname=getmesh
pkgver=1.1.4+15+g7c27fd3
pkgrel=1
pkgdesc="Integration, and lifecycle management CLI tool for Istio"
arch=(x86_64)
url="https://github.com/tetratelabs/getmesh"
license=('Apache-2.0')
depends=(glibc)
makedepends=(git go)
_commit="7c27fd3824d9d5625a28b02c3808211d60ca9533" # v1.16.1
source=("$pkgname::git+$url#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

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
  go build -o build .
}

check() {
  cd "$pkgname"
  # todo: failing upstream https://github.com/tetratelabs/getmesh/issues/120
  # go test -v ./...
}

package() {
  cd "$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
