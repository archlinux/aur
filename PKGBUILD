# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname=abra
pkgver=0.9.0
pkgrel=1
pkgdesc='The Co-op Cloud command-line interface.'
arch=('any')
makedepends=('go')
url='https://git.coopcloud.tech/coop-cloud/abra'
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver-beta.tar.gz")
sha256sums=('47e78caba57b9b2c3c9580a8f4eab983a5165be5ac0d3cedab7d303929afc01e')

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

