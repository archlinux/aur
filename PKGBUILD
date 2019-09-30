# Maintainer: architekton <architekton350@gmail.com>

pkgname=amass
pkgver=3.1.10
pkgrel=1
pkgdesc="In-depth subdomain enumeration written in Go"
arch=('any')
url="https://github.com/OWASP/Amass"
license=('Apache')
makedepends=('go' 'git')
source=(Amass-$pkgver.tar.gz::https://github.com/OWASP/Amass/archive/v${pkgver}.tar.gz)
sha512sums=('119fee4de63dbf10df5a4604682e54a0809f0b97231547f2804938518ccf783e678b0d70c7daaa9a3ffb74955e4ed3b7b9cfcbbcdd09ca901a5d015b4923af3d')


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

  cp -a --no-preserve=ownership "$GOPATH/src/github.com/OWASP/Amass/examples/" "${pkgdir}/usr/share/${pkgname}"

  chmod 644 "${pkgdir}/usr/share/${pkgname}/examples/"*
}
