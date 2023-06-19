# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_beta=''
pkgname='s5cmd'
pkgver='2.1.0'
pkgrel='2'
pkgdesc='Parallel S3 and local filesystem execution tool'
arch=('x86_64' 'i686')
_uri="github.com/peak"
url="https://${_uri}/${pkgname}"
license=('MIT')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}${_beta}.tar.gz")
sha256sums=('d67279cb6b69cfff32edfdb744238bd574a4a1e496cf3a59efa0646f94e40a17')

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
