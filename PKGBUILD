# Maintainer: Polina Simonenko <rabarbrablad at gmail dot com>
pkgname=exex
pkgver=0.3.2
pkgrel=1
pkgdesc="Terminal UI for exploring ELF, Mach-O and PE binaries"
arch=(x86_64 aarch64)
url="https://github.com/shellcell/${pkgname}"
license=('MIT')
depends=(glibc)
makedepends=(go)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('839ac1dcd56b6ec07cf99110aab2fcfede19e190fa2e1bd6cf4a317282f71023')

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}" CGO_CFLAGS="${CFLAGS}" \
         CGO_CXXFLAGS="${CXXFLAGS}" CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  # Full build (Chroma syntax highlighting); main package is at the repo root.
  go build -o build/${pkgname} -ldflags="-linkmode=external -X main.version=${pkgver}" .
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "build/${pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 "docs/${pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
  install -Dm644 docs/config.example.yaml -t "${pkgdir}/usr/share/${pkgname}/"
  install -Dm644 "completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "completions/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
