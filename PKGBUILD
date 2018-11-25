# Maintainer: architekton <architekton350@gmail.com>

pkgname=amass
pkgver=2.8.4
pkgrel=1
pkgdesc="In-depth subdomain enumeration written in Go"
arch=('any')
url="https://github.com/OWASP/Amass"
license=('Apache')
makedepends=('go' 'git')
source=(Amass-$pkgver.tar.gz::https://github.com/OWASP/Amass/archive/${pkgver}.tar.gz)
sha512sums=('2ce1b184777c0e6164ba3264cee44ab5c87768641d04080d48f4832cfbe7533c3aedd11ac0334f997513f08bb95420cd591c10d5647430b36127bfd0dea37e71')


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
