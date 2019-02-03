# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=mkcert
_package="github.com/FiloSottile/${pkgname}"
pkgver=1.3.0
pkgrel=1
pkgdesc="A simple tool for making locally-trusted development certificates"
arch=('x86_64')
url="https://github.com/FiloSottile/mkcert"
license=('BSD')
makedepends=('go' 'git')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/FiloSottile/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('2ac56e023a6f5a7d4bf949897338c333da0ce551cd45a50c01054987dd7e257b')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  export GOPATH="${srcdir}"
  install -d "${GOPATH}/src/github.com/FiloSottile"
  ln -sf "$PWD" "${GOPATH}/src/${_package}"
}

build() {
  export GOPATH="${srcdir}"
  cd "${GOPATH}/src/${_package}"
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  export GOPATH="${srcdir}"
  cd "${GOPATH}/src/${_package}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
