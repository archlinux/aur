#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=tldx
pkgver=1.0.0
pkgrel=2
pkgdesc="Domain Availability Research Tool"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
conflicts=('tldx')
provides=('tldx')
url="https://github.com/brandonyoungdev/tldx"
license=("Apache-2.0")
makedepends=(
  'go'
  'git'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brandonyoungdev/tldx/archive/v${pkgver}.tar.gz")
sha256sums=('4386238735382f341ddafb96b9d92a65324e51b47c2d3bc3d693de86b602cf84')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # Download dependencies
  go get -u
  go mod tidy

  # Build
  go build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "tldx" "$pkgdir/usr/bin/tldx"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/tldx/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/tldx/LICENSE"
}
