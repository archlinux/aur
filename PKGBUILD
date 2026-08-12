# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname="udpx-git"
pkgver=1.0.7.r19.gd612eb2
pkgrel=1
pkgdesc="Single-packet UDP scanner written in Go"
arch=('x86_64')
url="https://github.com/nullt3r/udpx"
license=('MIT')
depends=(
  'glibc'
)
makedepends=(
  'go>=1.17'
  'git'
)
source=("git+$url")
b2sums=('SKIP')

pkgver() {
  cd udpx
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd udpx
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
  go build -ldflags "-compressdwarf=false -linkmode external" ./cmd/udpx
}

check() {
  cd udpx
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
  go test ./...
}

package() {
  cd udpx
  install -Dm0755 -t "$pkgdir/usr/bin" udpx
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

# vim: ts=2 sw=2 et:
