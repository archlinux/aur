# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Vincent BESANCON (bigbrozer) <besancon.vincent@gmail.com>
# Blobfuse2 version is rewritten in Go, inspiration from https://aur.archlinux.org/packages/pluto.
_pkgname=blobfuse2
pkgname=azure-storage-fuse
pkgver=2.0.2
pkgrel=1
pkgdesc="A virtual file system adapter for Azure Blob storage (blobfuse2)"
arch=('x86_64')
url="https://github.com/Azure/azure-storage-fuse"
license=('MIT')
provides=('blobfuse2')
depends=('fuse2' 'fuse3' 'glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Azure/azure-storage-fuse/archive/refs/tags/blobfuse2-$pkgver.tar.gz")
sha256sums=('39435c509386bde79b5da6e5e7a5755ddd37a2e5174064406291ea4a646dd3be')

build() {
  cd "$srcdir/$pkgname-$_pkgname-$pkgver"

  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build -o $_pkgname \
    -tags=fuse3 \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-s -w -linkmode=external -extldflags \"${LDFLAGS}\" -X main.version=${pkgver}"
}

package() {
  cd "$srcdir/$pkgname-$_pkgname-$pkgver"

  install -Dm0755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
