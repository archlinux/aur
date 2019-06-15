# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ip2geo'
pkgver='1.1.2'
pkgrel='1'
pkgdesc='Import ipgeo data to files for nginx geoip module'
arch=('x86_64' 'i686')
url="https://github.com/m-messiah/${pkgname}"
license=('MIT')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('43efca4fe6450db72c82c3c95cb5860941a60abc1f8adf1325d8f2f5c3999449')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # https://github.com/m-messiah/ip2geo/issues/28
  echo -e "\nconst VERSION = \"${pkgver}\"" >> version.go

  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/github.com/m-messiah"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/github.com/m-messiah/${pkgname}"
  cd ${GOPATH}
  go get -v -x github.com/fatih/color
  go get -v -x github.com/jinzhu/configor
  go get -v -x golang.org/x/net/html/charset  
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/m-messiah/${pkgname}"
  GOOS=linux go build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
