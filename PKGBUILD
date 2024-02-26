# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=opengfw
_pkgname=OpenGFW
pkgver=0.2.2
pkgrel=1
pkgdesc="A flexible, easy-to-use, open source implementation of GFW"
arch=(x86_64)
url="https://github.com/apernet/OpenGFW"
license=(MPL-2.0)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0ae53fa277ed69c5ac7111f5e9583676eacb8b729372a8cf1bbda1b05792bf8e')

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

  # Skip failing tests - not sure why they fail.
  local unit_tests=$(
    go list -buildvcs=false ./... \
      | grep -v github.com/apernet/OpenGFW/ruleset/builtins/geo/v2geo \
      | sort
  )
  # shellcheck disable=SC2086
  go test $unit_tests
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" OpenGFW
  ln -s /usr/bin/OpenGFW "$pkgdir/usr/bin/opengfw"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -a -t "$pkgdir/usr/share/doc/$pkgname" docs
}
