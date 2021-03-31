# Maintainer: lmartinez-mirror
pkgname=hilbish
pkgver=0.2.0
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
sha256sums=('8f7d950af1710b1d71dfb87834f6afc0dd6351f9f269e381327247046b7d1ec2')

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
