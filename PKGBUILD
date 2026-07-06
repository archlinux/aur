# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ip2geo'
pkgver='1.1.8'
pkgrel='1'
pkgdesc='Import ipgeo data to files for nginx geoip module'
arch=('x86_64' 'aarch64')
_uri="github.com/m-messiah"
url="https://${_uri}/${pkgname}"
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.${_uri}/${pkgname}/tar.gz/refs/tags/v${pkgver}")
sha256sums=('a403d40a12ca53dc4e01bf69b97fc6316063d9dbc3ee203da345c615e79d88d0')

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  export GOCACHE="${srcdir}/cache/go-cache"
  export GOMODCACHE="${srcdir}/cache/go"
  export GOTMPDIR="${srcdir}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"
  mkdir -p "${GOPATH}/src/${_uri}"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/${_uri}/${pkgname}"

  cd "${GOPATH}/src/${_uri}/${pkgname}"
  sed -i 's|const VERSION = .*|const VERSION = "'${pkgver}'"|' "version.go"
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  GOOS="${GOHOSTOS}" GOARCH="${GOHOSTARCH}" \
  go build -x \
    -buildmode="pie" \
    -trimpath \
    -mod="readonly" \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}'"
}

check() {
  cd "${GOPATH}/src/${_uri}/${pkgbase}"
  go test -modcacherw ./...
}

package() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  install -Dm0755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
