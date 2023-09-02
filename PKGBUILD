# Maintainer: lobo torres <wolf at fastmail dot co dot uk>

# -*- mode: sh -*-

pkgname='betula'
pkgver=1.0.0
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

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  mkdir -p build
  go mod tidy
}

build() {
  cd "$pkgname-v$pkgver"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
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

sha256sums=('95488f9a165c6bc273148b531be061b56de541d88ab5a7d6cfd4d6555fd9bf0d')
b2sums=('fac4250e2ccaddbeae95da61de0aeb760cf8fe37082ae28d9fc3e4006e3a55b85fcb29c1726520ff79f181e798701bcb5536def284291185381e034f553848c2')

# eof
