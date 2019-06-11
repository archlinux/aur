# Maintainer: architekton <architekton350@gmail.com>

pkgname=amass
pkgver=3.0.4
pkgrel=1
pkgdesc="In-depth subdomain enumeration written in Go"
arch=('any')
url="https://github.com/OWASP/Amass"
license=('Apache')
makedepends=('go' 'git')
source=(Amass-$pkgver.tar.gz::https://github.com/OWASP/Amass/archive/${pkgver}.tar.gz)
sha512sums=('2685eae50f205379e5c4adb5cbabb927b097615e0af05fc4a46982ff3e079f6734cb0cea8613f74bef7b4385a88531b38d6726ad2b1f963f38e2babb766a2f27')


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

  cp -a --no-preserve=ownership "$GOPATH/src/github.com/OWASP/Amass/"{wordlists/,examples/,snapcraft.yaml} "${pkgdir}/usr/share/${pkgname}"

  chmod 644 "${pkgdir}/usr/share/${pkgname}/"{wordlists/*,examples/*}
}
