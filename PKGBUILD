# Maintainer: shbernal <shbernal.01@gmail.com>

pkgname=mantisbt-cli
pkgver=0.1.0
pkgrel=1
pkgdesc='Command line client for the MantisBT REST API'
arch=('x86_64' 'aarch64')
url='https://github.com/overworks/mantisbt-cli'
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('44b0dafc690d93f5dca3a19971c72f0ef81a5296a8946ab6ab65456a21d894b5')

build() {
  cd "${pkgname}-${pkgver}"

  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags "-compressdwarf=false -linkmode external -X main.version=${pkgver}" \
    -o "${pkgname}" .
}

check() {
  cd "${pkgname}-${pkgver}"

  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
