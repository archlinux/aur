# Maintainer: lmartinez-mirror
pkgname=hilbish-git
_pkgname=${pkgname%-git}
pkgver=0.1.2.r3.g795a7d7
pkgrel=2
pkgdesc="A shell written in Go and extended with Lua"
arch=('x86_64' 'aarch64')
url="https://github.com/hilbis/hilbish"
license=('MIT')
depends=('readline')
makedepends=('git' 'go>=1.16')
optdepends=('lua')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$pkgname"
  sed -i '\|/etc/shells|d' Makefile
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$pkgname"
  make build
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir/" make install
  install -Dm 444 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 444 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
