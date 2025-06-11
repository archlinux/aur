# Maintainer: Marcus B Spencer <marcus at marcusspencer dot us>

pkgname=acme-dns-client
pkgver=0.3
pkgrel=1
pkgdesc="A client software for https://github.com/joohoi/acme-dns"
arch=('x86_64')
url="https://github.com/acme-dns/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('certbot: DNS-01 challenge integration')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('70f501e1cdfe6f8ff7c48303cb8d209c026fde8e7de048a41bca9252e40b1732')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

  go build -ldflags "-compressdwarf=false -linkmode external" .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
