# Maintainer: tarball <bootctl@gmail.com>

pkgname=goread
pkgver=1.7.3
pkgrel=1
pkgdesc='Read RSS/Atom feeds right in the terminal'
url='https://github.com/TypicalAM/goread'
arch=(i686 x86_64 aarch64 riscv64)
license=(GPL-3.0-only)
makedepends=(go)
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9b08cae05593034711c599b6b17605194a11bbfae769b4e7e0076a01ec197c37')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  go mod download
}

build() {
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  cd "$srcdir/$pkgname-$pkgver"
  go build -o $pkgname
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # binary
  install -Dm755 $pkgname \
    "$pkgdir/usr/bin/$pkgname"
}
