# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: qwjyh <urataw421 at gmail dot com>

pkgname=servitor
pkgver=3
pkgrel=1
pkgdesc="A command-line Fediverse client that doesn’t require a server"
arch=('x86_64' 'aarch64')
url="https://github.com/BentonEdmondson/servitor"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('79f1ffe09f55f37c7969d8c50743eb1b934d97d5dd077f6f29b8196300a0cb5c')

prepare() {
  export GOPATH="$srcdir"
  cd "$pkgname-$pkgver"
  mkdir -p build
  go mod download -modcacherw
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd "$pkgname-$pkgver"
  go build -o build -ldflags "-X main.version=$pkgver -linkmode=external"
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 -t "$pkgdir/usr/bin/" "build/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/docs/$pkgname/" readme.md
}

# vim: sw=2:

