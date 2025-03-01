pkgname=snapmate
pkgver=0.0.3
pkgrel=1
pkgdesc="Timeshift snapshot utility to create snapshots before upgrade with useful comments"
arch=('x86_64')
url="https://github.com/flopana/snapmate"
license=('BSD-3-Clause')
depends=('timeshift')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/flopana/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7b80c21225e0f03f83aed87291ef60d46aa590a9ac6da2e9a6f1669c6879a63d')

build() {
  cd "$pkgname-$pkgver/src"

  # Set GOPATH to a temporary directory within the build directory
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # Build the project
  go build -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "src/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 00-snapmate.hook "$pkgdir/usr/share/libalpm/hooks/00-snapmate.hook"
  install -Dm644 config.ini "$pkgdir/etc/snapmate/config.ini"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
