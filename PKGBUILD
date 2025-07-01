#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=tldx
pkgver=1.2.4
pkgrel=1
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
sha256sums=('5bc6836e033ae63187b17e523e808cfd8bb6525715163fdc158bf85f36a2b834')

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
