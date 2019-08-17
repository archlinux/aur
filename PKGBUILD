# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=mkcert
_package="github.com/FiloSottile/${pkgname}"
pkgver=1.4.0
pkgrel=1
pkgdesc="A simple tool for making locally-trusted development certificates"
arch=('x86_64')
url="https://github.com/FiloSottile/mkcert"
license=('BSD')
makedepends=('go' 'git')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/FiloSottile/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('8ad11055b4fb47955312b7b72e24057cc6dca1606d14838a1520ce87ed62cc89')

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
