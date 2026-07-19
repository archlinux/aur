# Maintainer: Polina Simonenko <rabarbrablad at gmail dot com>
pkgname=ttysvg
pkgver=0.1.2
pkgrel=1
pkgdesc="Record terminal sessions as animated SVG"
arch=(x86_64 aarch64)
url="https://github.com/shellcell/${pkgname}"
license=('MIT')
depends=(glibc)
makedepends=(go)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e80610f961b30c94553821fd7b982000ccd8e5bb0420ad5e28ae8168eaffacb4')

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}" CGO_CFLAGS="${CFLAGS}" \
         CGO_CXXFLAGS="${CXXFLAGS}" CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build/${pkgname} -ldflags="-linkmode=external -X main.version=${pkgver}" ./cmd/${pkgname}
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
  install -Dm644 "completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "completions/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
