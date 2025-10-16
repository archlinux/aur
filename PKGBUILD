# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname=abra
pkgver=0.11.0
pkgrel=1
pkgdesc='The Co-op Cloud command-line interface.'
arch=('any')
makedepends=('go')
url='https://git.coopcloud.tech/toolshed/abra'
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver-beta.tar.gz")
sha256sums=('9a0c11160daf8f485770d1a2f3b34820b059a54c3a2e1e27fce209e364b7d8ec')

prepare() {
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"

  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  LDEXTRA="-X 'main.Commit=$pkgver-beta'"
  go build \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode external -s -w $LDEXTRA -extldflags \"${LDFLAGS}\"" \
    -o build \
    ./cmd/...
}

package() {
  cd "$pkgname"
  install -Dm755 -t "$pkgdir/usr/bin/" build/*
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

