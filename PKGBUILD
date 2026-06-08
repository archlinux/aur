# Maintainer: Dafa <dafagareth@gmail.com>

# Source build of svault from a tagged release. This is the preferred AUR
# package: it compiles on the user's machine and does not trust a prebuilt
# binary. For a faster install from the published binary, see the svault-bin
# package (packaging/aur-bin/PKGBUILD).

pkgname=svault
pkgver=2.1.0
pkgrel=1
pkgdesc="Local encrypted secret vault for developers"
arch=('x86_64' 'aarch64')
url="https://github.com/dafagareth/svault"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dafagareth/svault/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3b9b129353121b272bb3fdffd429e78fd7967d90c698c7b52620d215ff1d6cb')

build() {
  cd "svault-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-X 'svault/cmd.version=$pkgver' -s -w" -o svault .
}

check() {
  cd "svault-$pkgver"
  go test ./...
}

package() {
  cd "svault-$pkgver"
  install -Dm755 svault "$pkgdir/usr/bin/svault"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
