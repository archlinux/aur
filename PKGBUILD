# Maintainer: Tiago Seabra <tiagolseabra at gmail dot com>

pkgname=go-ascii-tool-git
_pkgname=goat
_pkgbin=go-ascii-tool

pkgver=r108.07bb911
pkgrel=1

pkgdesc='GoAT: render ASCII art as SVG diagrams'
arch=(x86_64)
url='https://github.com/blampe/goat'
license=(MIT)

depends=(glibc)
makedepends=(git go)

source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  mkdir -p build
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build \
    ./cmd/...
}

check() {
  cd $_pkgname
  go test ./...
}

package() {
  cd $_pkgname
  install -Dm755 build/$_pkgname "$pkgdir/usr/bin/$_pkgbin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
