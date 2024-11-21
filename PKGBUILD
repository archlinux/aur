# Maintainer: Andrew Krasichkov <dev@buglloc.cc>

pkgname=mr.duppl
pkgver=1.0.2
pkgrel=1
pkgdesc="The DupplCAP application to integrate Mr.Duppl with Wireshark or something"
arch=("x86_64")
url="https://github.com/buglloc/$pkgname"
license=("MIT")
depends=("glibc")
makedepends=(
  "go"
)
options=("!lto")
source=("https://github.com/buglloc/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5c16491593d70576b62b6efc4679867a7952c0ea5e23cb2251a247821d3a0b39')

prepare() {
  cd "$pkgname-$pkgver/software"
  GOFLAGS="-mod=readonly" go mod vendor -v
}

build() {
  cd "$pkgname-$pkgver/software"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export GOFLAGS="-buildmode=pie -mod=vendor -modcacherw"
  export GOPATH="$srcdir"
  go build -v ./cmd/dupplcap
}

package() {
  cd "$pkgname-$pkgver/software"
  install -vDm755 -t "$pkgdir/usr/lib/wireshark/extcap" dupplcap
}
