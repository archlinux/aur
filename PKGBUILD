# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_beta='-beta.1'
pkgname='s5cmd'
pkgver='2.1.0'
pkgrel='1'
pkgdesc='Parallel S3 and local filesystem execution tool'
arch=('x86_64' 'i686')
_uri="github.com/peak"
url="https://${_uri}/${pkgname}"
license=('MIT')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}${_beta}.tar.gz")
sha256sums=('e14c7ecf04c6e195447c68347e428c2feb066dfe120d4573926a9baa55d8a9d6')

prepare() {
  cd "${pkgname}-${pkgver}${_beta}"
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/${_uri}"
  ln -snf "${srcdir}/${pkgname}-${pkgver}${_beta}" "${GOPATH}/src/${_uri}/${pkgname}"
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  go mod download -x
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  GOOS=linux go build
}

check() {
  cd "${pkgname}-${pkgver}${_beta}"
  make test
}

package() {
  cd "${pkgname}-${pkgver}${_beta}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
