# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=mosint
pkgver=3.0.0
pkgrel=1
pkgdesc="An automated e-mail OSINT tool"
arch=(
  x86_64
  i686
  aarch64
)
url="https://github.com/alpkeskin/mosint"
license=(MIT)
depends=(glibc)
makedepends=(go)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad34a5fc5f776dc5a1af79d997d6a7c20d72b49280bc6233ec6ef9c2075dddcd')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"
  cd v3

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o ../mosint -v cmd/mosint/main.go
}

package() {
  cd "$_archive"

  install -Dm755 mosint "$pkgdir/usr/bin/mosint"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
