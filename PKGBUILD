# Maintainer: architekton <architekton350@gmail.com>

pkgname=amass
pkgver=3.0.18
pkgrel=1
pkgdesc="In-depth subdomain enumeration written in Go"
arch=('any')
url="https://github.com/OWASP/Amass"
license=('Apache')
makedepends=('go' 'git')
source=(Amass-$pkgver.tar.gz::https://github.com/OWASP/Amass/archive/${pkgver}.tar.gz)
sha512sums=('38656d1697f0e6e64835a29209ee040b9be7eb5a8d01d8ed6702904f1d69e199760478fc712a1115e77f2e0202196cfe5a27e69afbc5eea837b874c676931521')


prepare() {
  mkdir -p "gopath/src/github.com/OWASP"
  ln -rTsf "Amass-${pkgver}" "gopath/src/github.com/OWASP/Amass"

  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/OWASP/Amass"
  go get -d ./...
}

check() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/OWASP/Amass"

  go test ./...

}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/OWASP/Amass"

  go install -v ./...
}

package() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/bin"

  install -dm 755 "${pkgdir}/usr/share/${pkgname}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  cp -a --no-preserve=ownership "$GOPATH/src/github.com/OWASP/Amass/"{wordlists/,examples/} "${pkgdir}/usr/share/${pkgname}"

  chmod 644 "${pkgdir}/usr/share/${pkgname}/"{wordlists/*,examples/*}
}
