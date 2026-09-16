# Maintainer: Hu Butui <hot123tea123@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=goproxy
pkgver=15.3
pkgrel=1
pkgdesc="A high performance HTTP, HTTPS, websocket, TCP, UDP, Secure DNS, Socks5 proxy server"
arch=('x86_64')
url="https://github.com/snail007/goproxy"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::https://github.com/snail007/goproxy/archive/refs/tags/v$pkgver.tar.gz")
makedepends=('go')
sha256sums=('28e8a4d1a08edd147ca8ca172d72dab44eccdd1124351a66d78ef6844064f0b6')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  find . -name '*.go' -print0 | xargs -0 sed -i -e 's,"proxy/,"github.com/snail007/goproxy/,g'
  [[ -f go.mod ]] || go mod init github.com/snail007/goproxy
  # 上游未附带 go.sum；补齐后配合 -mod=readonly
  export GOPATH="${srcdir}"
  go mod tidy
  go mod download -modcacherw
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o "$pkgname" \
    .
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
# vim:set ts=2 sw=2 et:
