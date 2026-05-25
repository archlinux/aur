# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=gguf-parser
pkgver=0.24.0
pkgrel=1
pkgdesc='Review/check GGUF files and estimate memory usage and maximum tokens per second'
arch=('x86_64')
url='https://github.com/gpustack/gguf-parser-go'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d5b6bc6c8dd00fe41a50f80642e76a442cfc2e275844614fc2bd755c8441047a')

build() {
  cd "${srcdir}/gguf-parser-go-${pkgver}/cmd/gguf-parser"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}/gopath"
  export GOMODCACHE="${srcdir}/gopath/pkg/mod"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  CGO_ENABLED=1 go build \
    -ldflags="-linkmode=external -compressdwarf=false -s -w -X main.Version=v${pkgver}" \
    -tags='urfave_cli_no_docs netgo' \
    -o "${srcdir}/${pkgname}" .
}

package() {
  cd "${srcdir}/gguf-parser-go-${pkgver}"

  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
