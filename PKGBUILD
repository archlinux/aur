# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname="udpx-git"
pkgver=1.0.8.r98.gd612eb2
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
provides=("udpx=$pkgver")
conflicts=('udpx')

pkgver() {
  cd udpx
  local _maj _min _patch _tag
  _maj="$(grep '^\s*MajorVersion' pkg/version/version.go | awk '{print $3}')"
  _min="$(grep '^\s*MinorVersion' pkg/version/version.go | awk '{print $3}')"
  _patch="$(grep '^\s*PatchVersion' pkg/version/version.go | awk '{print $3}')"
  _tag="$_maj.$_min.$_patch"
  printf "%s.r%s.g%s" "$_tag" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
