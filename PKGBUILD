# Maintainer: Lobo Torres <lobo@praderi.es>

# -*- mode: sh -*-

pkgname='betula'
pkgver=1.1.0
pkgrel=1
pkgdesc='Self-hosted personal link collection manager'
arch=('aarch64' 'armv7h' 'x86_64')
url="https://git.sr.ht/~bouncepaw/$pkgname"
license=('AGPL3')
depends=('sqlite' 'glibc')
makedepends=('go')
source=("v$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
options=('lto')

prepare() {
  cd "$pkgname-v$pkgver"

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  mkdir -p build
  go mod tidy
}

build() {
  cd "$pkgname-v$pkgver"

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.version=$pkgver" \
    -mod=readonly \
    -modcacherw \
    -o build \
     ./cmd/betula
}

package() {
  cd "$pkgname-v$pkgver"

  install -Dm0755 "build/betula"  "$pkgdir/usr/bin/betula"
  install -Dm0644 "README.md"         "$pkgdir/usr/share/doc/$pkgname/README.md"
}

sha256sums=('62746f36de696099536eabb2879203606d7ec7b80b1a985d4d5319f332158fb6')

# eof
