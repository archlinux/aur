# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Vincent BESANCON (bigbrozer) <besancon.vincent@gmail.com>
# Blobfuse2 version is rewritten in Go, inspiration from https://aur.archlinux.org/packages/pluto.
_pkgname=blobfuse2
pkgname=azure-storage-fuse
pkgver=2.5.0
pkgrel=1
pkgdesc="A virtual file system adapter for Azure Blob storage (blobfuse2)"
arch=('x86_64')
url="https://github.com/Azure/azure-storage-fuse"
license=('MIT')
provides=('blobfuse2')
depends=('fuse2' 'fuse3' 'glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Azure/azure-storage-fuse/archive/refs/tags/blobfuse2-$pkgver.tar.gz")
sha256sums=('743be5de2ca9821299e8653202035347cd1b7c2d00244184a1b5e86b4634f93d')

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

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm0755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -m0644 README.md doc/*.md "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install shell completion scripts
  install -d "${srcdir}/completions"
  "${pkgdir}/usr/bin/blobfuse2" completion bash > "${srcdir}/completions/${_pkgname}"
  "${pkgdir}/usr/bin/blobfuse2" completion fish > "${srcdir}/completions/${_pkgname}.fish"
  "${pkgdir}/usr/bin/blobfuse2" completion zsh > "${srcdir}/completions/_${_pkgname}"
  install -Dm 644 "${srcdir}/completions/${_pkgname}" -t "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm 644 "${srcdir}/completions/${_pkgname}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "${srcdir}/completions/_${_pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions/"
}
