# Maintainer: Andrew Krasichkov <dev@buglloc.cc>

pkgname=mr.duppl
pkgver=1.0.3
pkgrel=2
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
sha256sums=('735ec421cb7e9a86f99cc11dd74c8655f1c9ce3d45f813ec13cd6f6b9f038eea')

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
  go build -v ./cmd/mr.duppl
}

package() {
  cd "$pkgname-$pkgver/software"
  install -vDm755 -t "$pkgdir/usr/lib/wireshark/extcap" dupplcap
  install -vDm755 -t "$pkgdir/usr/bin" mr.duppl
}
