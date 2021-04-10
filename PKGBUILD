# Maintainer: lmartinez-mirror
pkgname=hilbish
pkgver=0.3.2
pkgrel=1
pkgdesc="A shell written in Go and extended with Lua"
arch=('x86_64' 'aarch64')
url="https://github.com/hilbis/hilbish"
license=('MIT')
depends=('readline')
makedepends=('go>=1.16')
optdepends=('lua')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('995c98696dd08642262a4576031a881a61e91ff52eb58694db25212b54f3ce54')

prepare() {
  mv "Hilbish-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  sed -i '\|/etc/shells|d' Makefile
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
  DESTDIR="$pkgdir/" make install
  install -Dm 444 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 444 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
