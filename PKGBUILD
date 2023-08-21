# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_beta=''
pkgname='s5cmd'
pkgver='2.2.0'
pkgrel='1'
pkgdesc='Parallel S3 and local filesystem execution tool'
arch=('x86_64' 'i686' 'aarch64')
_uri="github.com/peak"
url="https://${_uri}/${pkgname}"
license=('MIT')
makedepends=('go' 'git')
source=("${url}/archive/refs/tags/v${pkgver}${_beta}.tar.gz")
sha256sums=('1884052843f45045a6f24cff03a32253991b5839e2f7ae5dcaaa1060f2e1756f')

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
    -X ${_uri}/${pkgname}/version.Version=${pkgver} \
    -X ${_uri}/${pkgname}/version.GitCommit=$(git rev-parse HEAD)"
}

package() {
  cd "${pkgname}-${pkgver}${_beta}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
