# Maintainer: Adam Hellberg <sharparam@sharparam.com>

pkgname=mapshot
pkgver=0.0.21
pkgrel=1
pkgdesc="Tool to export Factorio saves as zoomable HTML maps"
arch=('x86_64')
url="https://github.com/Palats/mapshot"
license=('Apache')
depends=('glibc')
makedepends=('go' 'npm')
optdepends=('factorio: The game in some form is required for rendering maps')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Palats/mapshot/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('01019f144704f5b33ec399b530a9770c48931ebc44529300880a0db5e5658fe9')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  npm --prefix frontend ci
  sh generate.sh
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOOS=linux
  export GOARCH=amd64
  go build -o "build/$pkgname" ./mapshot.go
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
