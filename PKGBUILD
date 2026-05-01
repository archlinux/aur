# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='pgremapper'
pkgver='1.0.0'
pkgrel='2'
pkgdesc="CLI tool for manipulating Ceph's upmap exception table"
arch=('x86_64' 'aarch64')
_uri="github.com/digitalocean"
url="https://${_uri}/${pkgname}"
license=('Apache 2.0')
depends=('ceph')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.${_uri}/${pkgname}/tar.gz/refs/tags/v${pkgver}")
sha256sums=('c43e5e13bdb204012816dca6219ba37c470a7cb959e2b4536a400dcb4c70f8d4')

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  export GOCACHE="${srcdir}/cache/go-cache"
  export GOMODCACHE="${srcdir}/cache/go"
  export GOTMPDIR="${srcdir}"
  eval "$(go env | grep -e "GOHOSTOS" -e "GOHOSTARCH")"

  cd "${pkgname}-${pkgver}"
  mkdir -p "${GOPATH}/src/${_uri}"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/${_uri}/${pkgname}"
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
    -ldflags "-linkmode external -extldflags '${LDFLAGS}'"
}

check() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  go test -modcacherw -race ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
