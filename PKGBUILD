# Maintainer: fuero <fuerob@gmail.com>
pkgname=kubectl-topology
# renovate: datasource=github-releases depName=bmcustodio/kubectl-topology
pkgver=0.1.1
pkgrel=3
pkgdesc='kubectl plugin that provides insight into the topology of a Kubernetes cluster'
arch=('x86_64' 'aarch64')
url='https://github.com/bmcustodio/kubectl-topology'
license=('Apache-2.0')
depends=('kubectl' 'glibc')
makedepends=('git' 'go')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('619ff4bfb6a0cc5b547a2b5ad6dfd28e9212eaad3548caa8ad6dcdfbd2d5325ad345cad98e5cc58eeee27fb2c6c2d837d29fa658f05eb0932486b3f201f1ca95')
b2sums=('b13d2c442b5968f8dd2a9f0a0a4cb148e240d69cc0587d521441226d97c96d92784471f4455dfa22eaad21a5567a1d82f5917f9ce1cb83bc09eb979ee6d9db8e')

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="v${pkgver}"
    commit="${_commit:?}"
  )

  export CGO_ENABLED=1
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly"
  export GO111MODULE=on

  # Support -debug package
  if [[ " ${OPTIONS[*]} " =~ " debug " ]]
  then
    export GOFLAGS="${GOFLAGS//-trimpath/}"
    export GOPATH="${srcdir}"
  fi

  cd "${pkgname}-${pkgver}"
  go build -v \
    -ldflags="${_x[*]/#/-X=${url/https:\/\/}/pkg/version.} -linkmode=external" \
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
