# Maintainer: Adam Hellberg <sharparam@sharparam.com>

pkgname=mapshot
pkgver=0.0.27
pkgrel=1
pkgdesc="Tool to export Factorio saves as zoomable HTML maps"
arch=('x86_64')
url="https://github.com/Palats/mapshot"
license=('Apache')
depends=('glibc')
makedepends=('go' 'npm')
optdepends=('factorio: The game in some form is required for rendering maps')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Palats/mapshot/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2a3d02f2b7b93eda8b2559fcbd288339f98e7c957f05b3cf42aa73ea832c5261')

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
