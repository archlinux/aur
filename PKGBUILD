# Maintainer: Andrew Krasichkov <dev@buglloc.cc>

pkgname=mr.duppl
pkgver=1.0.1
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
sha256sums=('4355aa196802882f91d62aa5bfc761ac240b9361aa5141abbb277751bb64e5c3')

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
