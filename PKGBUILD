# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=gguf-parser
pkgver=0.26.2
pkgrel=1
pkgdesc='Review/check GGUF files and estimate memory usage and maximum tokens per second'
arch=('x86_64')
url='https://github.com/gpustack/gguf-parser-go'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6c79b9ddf3862fd09b6468acebbed41e3fbee44585ba6f74d2ceb04f9b4f7657')

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
