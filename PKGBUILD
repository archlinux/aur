# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='pgremapper'
pkgver=95.268522c
pkgrel=1
pkgdesc="CLI tool for manipulating Ceph's upmap exception table"
arch=('x86_64' 'aarch64')
_uri="github.com/digitalocean"
url="https://${_uri}/${pkgname}"
license=('Apache 2.0')
makedepends=('go' 'git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git_num="$(git log --pretty=oneline | wc -l | tr -d '[[:space:]]')"
  git_tag="$(git log -1 --format=%h)"
  echo -e "${git_num}.${git_tag}"
}

prepare() {
  cd "${pkgname}"
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/${_uri}"
  ln -snf "${srcdir}/${pkgname}" "${GOPATH}/src/${_uri}/${pkgname}"
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

package() {
  cd "${pkgname}"
  install -Dm0755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
