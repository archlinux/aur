# Maintainer: Anthony Vitacco <avitacco@protonmail.com>

pkgname=cowbird
pkgver=0.5.0
pkgrel=5
pkgdesc='A password manager that uses HashiCorp Vault as its backend'
arch=('x86_64' 'aarch64')
url='https://github.com/avitacco/cowbird'
license=('GPL-3.0-or-later')
makedepends=('go')
depends=('glibc')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "co.avitac.cowbird.desktop"
        "co.avitac.cowbird.svg")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$pkgname" .
}

check() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"
  go test ./...
}

package() {
  install -Dm644 "$srcdir/co.avitac.cowbird.desktop" "$pkgdir/usr/share/applications/co.avitac.cowbird.desktop"
  install -Dm644 "$srcdir/co.avitac.cowbird.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/co.avitac.cowbird.svg"
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
