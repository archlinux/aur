# Maintainer: Polina Simonenko <rabarbrablad at gmail dot com>
pkgname=snailrace
pkgver=0.0.5
pkgrel=1
pkgdesc="Benchmark commands measuring time, CPU, memory and disk footprint"
arch=(x86_64 aarch64)
url="https://github.com/shellcell/${pkgname}"
license=('MIT')
depends=(glibc)
makedepends=(go)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9bf908a6998e5bf27b17357c427a83d6dfd7c6dfb4352156fd9480228a509a5e')

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}" CGO_CFLAGS="${CFLAGS}" \
         CGO_CXXFLAGS="${CXXFLAGS}" CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build/${pkgname} \
    -ldflags="-linkmode=external -X github.com/shellcell/snailrace/internal/app.Version=${pkgver}" \
    ./cmd/${pkgname}
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
