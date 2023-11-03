# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname=abra
pkgver=0.8.1
pkgrel=1
pkgdesc='The Co-op Cloud command-line interface.'
arch=('any')
makedepends=('go')
url='https://git.coopcloud.tech/coop-cloud/abra'
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver-beta.tar.gz")
sha256sums=('60b679068fc506f31c5fed637e8a5c8f027c8a80adf1b8a2954ff6cddd256cd6')

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

