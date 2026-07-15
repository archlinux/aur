# Maintainer: Cycl0o0 <contact@cyclooo.fr>
# OpenDeezer terminal client (builds from the tagged source).
pkgname=opendeezer
pkgver=3.1.4
pkgrel=1
pkgdesc="Native terminal client for browsing and streaming a Deezer library"
arch=('x86_64')
url="https://github.com/Cycl0o0/OpenDeezer"
license=('AGPL-3.0-only')
depends=('alsa-lib')
makedepends=('go' 'git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ab74d97aea73c48046518b480f8ab223ade69bf3d776995dc5cf411054094db6')

prepare() {
  cd "OpenDeezer-$pkgver"
  export GOPATH="$srcdir"
  go mod download -modcacherw
}

build() {
  cd "OpenDeezer-$pkgver"
  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  local ldflags=(
    '-compressdwarf=false'
    '-linkmode=external'
    "-X main.version=$pkgver"
  )
  go build -ldflags "${ldflags[*]}" -o opendeezer ./cmd/opendeezer
}

check() {
  cd "OpenDeezer-$pkgver"
  export CGO_ENABLED=1
  export GOPATH="$srcdir"
  export GOFLAGS="-mod=readonly -modcacherw"
  go test ./...
}

package() {
  cd "OpenDeezer-$pkgver"
  install -Dm755 opendeezer "$pkgdir/usr/bin/opendeezer"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
