# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=hilbish
pkgver=0.5.0
pkgrel=1
pkgdesc="A shell written in Go and extended with Lua"
arch=('x86_64' 'aarch64')
url="https://github.com/rosettea/hilbish"
license=('MIT')
depends=('readline' 'lua51-lunacolors-git')
makedepends=('go>=1.16')
optdepends=('lua')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4c0a5608445ea5fc5ee1c7db8825ea7e19e6363624d94e84523a11141f127ba3')

prepare() {
  cd "Hilbish-$pkgver"
  sed -i '\|/etc/shells|d' Makefile
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "Hilbish-$pkgver"
  make build
}

package() {
  cd "Hilbish-$pkgver"
  DESTDIR="$pkgdir/" make install
  install -Dm 444 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 444 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
