# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_beta=''
pkgname='s5cmd'
pkgver='2.2.1'
pkgrel='1'
pkgdesc='Parallel S3 and local filesystem execution tool'
arch=('x86_64' 'i686' 'aarch64')
_uri="github.com/peak"
url="https://${_uri}/${pkgname}"
license=('MIT')
makedepends=('go' 'git')
source=("${url}/archive/refs/tags/v${pkgver}${_beta}.tar.gz")
sha256sums=('a9c057b577106117202619b99fc1f5d0b65fe4d43f41de59c4a4820e5f9379a9')

prepare() {
  cd "${pkgname}-${pkgver}${_beta}"
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/${_uri}"
  ln -snf "${srcdir}/${pkgname}-${pkgver}${_beta}" "${GOPATH}/src/${_uri}/${pkgname}"
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  GOOS="${GOHOSTOS}" GOARCH="${GOHOSTARCH}" \
  go build -x \
    -buildmode="pie" \
    -trimpath \
    -mod="readonly" \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X ${_uri}/${pkgname}/v2/version.Version=${pkgver} \
    -X ${_uri}/${pkgname}/v2/version.GitCommit=$(git rev-parse HEAD)"
}

package() {
  cd "${pkgname}-${pkgver}${_beta}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
