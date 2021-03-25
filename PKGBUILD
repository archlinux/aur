# Maintainer: lmartinez-mirror
pkgname=hilbish
pkgver=0.1.2
pkgrel=1
pkgdesc="A shell written in Go and extended with Lua"
arch=('x86_64' 'aarch64')
url="https://github.com/hilbis/hilbish"
license=('MIT')
depends=('readline')
makedepends=('go>=1.16')
optdepends=('lua')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('435496b0a3f6e59c17efaa74fe5ccb7161296ca906b82030da63e0c8509313f8')

prepare() {
  mv "Hilbish-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  sed -i "s|/usr|$pkgdir/usr|" Makefile
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  make install
  install -Dm 444 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 444 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}