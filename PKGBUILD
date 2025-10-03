# Maintainer: Amolith <amolith@secluded.site>

pkgname=go-prism
pkgver=1.1.0
pkgrel=1
pkgdesc='Turn raw test output into beautiful data'
arch=('x86_64' 'aarch64')
url='https://github.com/DaltonSW/prism'
license=('MIT')
install=.install
makedepends=('go')
conflicts=('go-prism-bin' 'go-prism-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('1a0c12a9d5cf35fe4bb21a946e5280efa4aa5232e5dcec3785b15a13461c5c1e430e9b00778a16930079d10fc09fd807590e5a409200ed6534ac62e8c746cef6')

prepare() {
  cd "prism-$pkgver"
  export GOPATH="$srcdir"
  go mod download -modcacherw
}

build() {
  cd "prism-$pkgver"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd "prism-$pkgver"
  install -Dm755 "prism" "$pkgdir/usr/bin/go-prism"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
