# Maintainer: architekton <architekton350@gmail.com>

pkgname=amass
pkgver=2.8.6
pkgrel=1
pkgdesc="In-depth subdomain enumeration written in Go"
arch=('any')
url="https://github.com/OWASP/Amass"
license=('Apache')
makedepends=('go' 'git')
source=(Amass-$pkgver.tar.gz::https://github.com/OWASP/Amass/archive/${pkgver}.tar.gz)
sha512sums=('23766f08caf07cb6aa5e023ff2a8058bd444ea6fde1ededf0d8afb8f9e4c8402df2ad1f845515b4f1b92b43d2857a99ece264396cd0b1ba32e9a18939a8ab2d7')


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
  install -Dm755 "${pkgname}.netdomains" "${pkgdir}/usr/bin/${pkgname}.netdomains"
  install -Dm755 "${pkgname}.viz" "${pkgdir}/usr/bin/${pkgname}.viz"
  install -Dm755 "${pkgname}.db" "${pkgdir}/usr/bin/${pkgname}.db"

  cp -a --no-preserve=ownership "$GOPATH/src/github.com/OWASP/Amass/"{wordlists/,examples/,snapcraft.yaml} "${pkgdir}/usr/share/${pkgname}"

  chmod 644 "${pkgdir}/usr/share/${pkgname}/"{wordlists/*,examples/*}
}
