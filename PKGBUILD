# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Vincent BESANCON (bigbrozer) <besancon.vincent@gmail.com>
# Blobfuse2 version is rewritten in Go, inspiration from https://aur.archlinux.org/packages/pluto.
_pkgname=blobfuse2
pkgname=azure-storage-fuse
pkgver=2.0.5
pkgrel=1
pkgdesc="A virtual file system adapter for Azure Blob storage (blobfuse2)"
arch=('x86_64')
url="https://github.com/Azure/azure-storage-fuse"
license=('MIT')
provides=('blobfuse2')
depends=('fuse2' 'fuse3' 'glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Azure/azure-storage-fuse/archive/refs/tags/blobfuse2-$pkgver.tar.gz")
sha256sums=('1087c93a659703ec24932a493ed07e3310d9f5b35cca3407633e1fe547c58bfe')

build() {
  cd "${srcdir}/$pkgname-$_pkgname-$pkgver"

  export GOPATH="${srcdir}/gopath"
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
  cd "${srcdir}/$pkgname-$_pkgname-$pkgver"

  install -d "${pkgdir}/usr/share/doc/$pkgname"
  install -Dm0755 $_pkgname "${pkgdir}/usr/bin/$_pkgname"
  install -m0644 README.md doc/*.md "${pkgdir}/usr/share/doc/$pkgname/"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
