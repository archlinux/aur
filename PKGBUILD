# Maintainer: fuero <fuerob@gmail.com>
pkgname=kubectl-kubesec
# renovate: datasource=github-releases depName=controlplaneio/kubectl-kubesec
pkgver=1.1.0
pkgrel=1
pkgdesc='kubectl plugin for scanning Kubernetes pods, deployments, daemonsets and statefulsets with kubesec.io'
arch=('x86_64' 'aarch64')
url='https://github.com/controlplaneio/kubectl-kubesec'
license=('Apache-2.0')
depends=('kubectl' 'glibc')
makedepends=('git' 'go')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('8b142dac898e89ad8d6e246299c509973e0e110c3c3c89f24d206c32afe5a1fd66da1ab5d96fba42faf6c026f3fd227733f5b382930ca6b571045a28da09b0ba')
b2sums=('05273f831837b3d9a31109a951cf10d6928112832a68a21d35f60c56c74587238b75de24bca3f2202f14a6194556ced951476f01363aa009a7b15d5816637c98')

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="v${pkgver}"
    commit="${_commit:?}"
  )

  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly"
  export GO111MODULE=on
  mkdir bin
  go mod tidy
  go build -v \
    -ldflags="${_x[*]/#/-X=${url/https:\/\/}/pkg/version.} -linkmode external" \
    -o bin/ \
    ./...
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
