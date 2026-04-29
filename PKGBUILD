# Maintainer: fuero <fuerob@gmail.com>
pkgname=kyverno-cli
_pkgname=kyverno
# renovate: datasource=github-releases depName=kyverno/kyverno
pkgver=1.18.0
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
sha512sums=('cb02c0670ef242bb90c5c9c920387014093f3dc7b5039bf613f6c9cc0393e5ed3097abfe843dd6e568c9291064d9121af587e6df6f22b48322bbce10d7185070')
b2sums=('4eeac2cc7bf00018cf09282fccf5676c3f9cdf6b8e66bf7fd7e03a97576dd55ffcc2de74b27eda5079fcb3a80ff648c0c8b6b6073308d48ff1d5cf710dfc5ecc')

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
