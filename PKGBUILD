# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_beta=''
pkgname='s5cmd'
pkgver='2.2.2'
pkgrel='2'
pkgdesc='Parallel S3 and local filesystem execution tool'
arch=('x86_64' 'i686' 'aarch64')
options=(!lto)
_uri="github.com/peak"
url="https://${_uri}/${pkgname}"
license=('MIT')
makedepends=('go' 'git')
source=("${url}/archive/refs/tags/v${pkgver}${_beta}.tar.gz")
sha256sums=('6f96a09a13198b84a23b7b7ff0b93f947434a185093284e13d05c0e864907f48')

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
