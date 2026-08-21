# Maintainer: dafagareth <dafagareth@gmail.com>

# Source build of svault from a tagged release. This is the preferred AUR
# package: it compiles on the user's machine and does not trust a prebuilt
# binary. For a faster install from the published binary, see the svault-bin
# package (packaging/aur-bin/PKGBUILD).

pkgname=svault
pkgver=1.0.0
epoch=1
pkgrel=1
pkgdesc="Local encrypted secret vault for developers"
arch=('x86_64' 'aarch64')
url="https://github.com/dafagareth/svault"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dafagareth/svault/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0f5f26c9edc0a6f7288c5597c67a36711297e607897a4ba1e4f4017a9e0773d5')

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
