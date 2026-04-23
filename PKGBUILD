# Maintainer: fuero <fuerob@gmail.com>
pkgname=kyverno-cli
_pkgname=kyverno
# renovate: datasource=github-releases depName=kyverno/kyverno
pkgver=1.17.2
pkgrel=2
pkgdesc='Cloud Native Policy Management'
arch=('x86_64' 'aarch64')
url='https://github.com/kyverno/kyverno'
license=('Apache-2.0')
depends=('kubectl' 'glibc')
makedepends=('go')
provides=("kubectl-${_pkgname}")
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('1685ffdf08846840dd45cc2ada387565aba33d121595157f25e0508e64e60197bd53116e7574f52f0e4639354906ab809e00027c982d168c311d3aca889fd1d8')
b2sums=('d3afe3c17178153cb5653e84f6ebd17c678307135105afe06f375e2ac1fbabe52d0efd2ef1f4dd6818c48bb20609b026922da7d45b84cafa02aa53e81edca789')

build() {
  local _x _commit
  _commit=$(bsdcat "${_pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
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

  cd "${_pkgname}-${pkgver}"
  go build -v \
    -ldflags="${_x[*]/#/-X=main.} -linkmode external" \
    -o bin/ \
    "./cmd/cli/kubectl-${_pkgname}"
}

# Tests are broken
#check() {
#  cd "${_pkgname}-${pkgver}"
#  go test -short ./...
#}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm755 "bin/kubectl-${_pkgname}" "${pkgdir}/usr/bin/kubectl-${_pkgname}"
  ln -snf "kubectl-${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  
  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
