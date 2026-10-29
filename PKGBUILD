# Maintainer: fuero <fuerob@gmail.com>
pkgname=kubectl-find
# renovate: datasource=github-releases depName=alikhil/kubectl-find
pkgver=0.19.2
pkgrel=1
pkgdesc='plugin for kubectl that gives you a UNIX find-like experience'
arch=('x86_64' 'aarch64')
url='https://github.com/alikhil/kubectl-find'
license=('Apache-2.0')
depends=('kubectl' 'glibc' 'bash')
makedepends=('go')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('c80e3815666b541f67b6d7469c1a01083fbed22721ae54d8c3c8e40785a8d9e78af3ec4278ce59320556e1596f16790d4e155d92d164330f8173e9164dd51314')
b2sums=('4deea7458bd9f639a8762fd391a372999a45928329419e15b402191abf3000b0aa4979c04169af7ca49c9097fc4ec6b53bcd70ca302972143be087bac191a6a6')

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="v${pkgver}"
    commit="${_commit:?}"
    date="$(date +%F)"
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
    -ldflags="${_x[*]/#/-X=main.} -linkmode external" \
    -o bin/ \
    ./...
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "bin/cmd" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "kubectl_complete-fd" "${pkgdir}/usr/bin/kubectl_complete-find"

  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
