# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=firectl
pkgver=0.1.0
pkgrel=1
pkgdesc="A command-line tool to run Firecracker microVMs"
arch=('x86_64')
url="https://github.com/firecracker-microvm/firectl"
license=('Apache')
depends=('firecracker')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('9f4f765074a205260778d3395b7ae99c6bb3a3edbfa5559ee0e7100d19b9317398cd2df7b8ca6d28cfa2a1d5f86c2ff4d6ac893a19114350e426d405fd04941e')

prepare() {
	cd "$pkgname-$pkgver"

  mkdir -p build

  go mod vendor
}

build() {
	cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build .
}

package() {
	cd "$pkgname-$pkgver"
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"
}
