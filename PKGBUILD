# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=opengfw
_pkgname=OpenGFW
pkgver=0.3.0
pkgrel=1
pkgdesc="A flexible, easy-to-use, open source implementation of GFW"
arch=(x86_64)
url="https://github.com/apernet/OpenGFW"
license=(MPL-2.0)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('19f43967fc6bb80574d5d4a02bf911ee9250ae3c45574ac9c4076830b2fc22ca')

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  go mod download -x
}

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -buildvcs=false
}

check() {
  cd "$_archive"

  go test -v ./...
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" OpenGFW
  ln -s /usr/bin/OpenGFW "$pkgdir/usr/bin/opengfw"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -a -t "$pkgdir/usr/share/doc/$pkgname" docs
}
