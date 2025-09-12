# Maintainer: fuero <fuerob@gmail.com>
_pkgname=outdated
pkgname="kubectl-${_pkgname}"
# renovate: datasource=github-releases depName=replicatedhq/outdated
pkgver=0.4.1
pkgrel=2
pkgdesc='kubectl plugin that displays all out-of-date images running in a Kubernetes cluster'
arch=('x86_64' 'aarch64')
url='https://github.com/replicatedhq/outdated'
license=('Apache-2.0')
depends=('kubectl' 'glibc')
makedepends=('git' 'go')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1a1d6acb6307f47be179feb74cbb000b126a841075ca69090dca75269a50c7c232a48be874f822b0d251829bb9f3216f8f8f9986503e8fa6d1dc6217ce79345e')
b2sums=('0c8f5acabe3afd660fe5cb06d66715b72023f19e63af7485d37ebf49cf941df52b8293a2355cf305b2b5a3ef5d29fa8612ac80841049f3467f6f718a1475054d')

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="v${pkgver}"
    commit="${_commit:?}"
  )

  cd "${_pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly -v"
  export GO111MODULE=on
  mkdir bin
  go mod tidy
  go build \
    -ldflags="${_x[*]/#/-X=${url/https:\/\/}/pkg/util.} -linkmode=external" \
    -o bin/ \
    ./...
}

check() {
  cd "${_pkgname}-${pkgver}"
  #go test -short ./...
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
