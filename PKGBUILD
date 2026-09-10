# Maintainer: fuero <fuerob@gmail.com>
pkgname=kyverno-cli
_pkgname=kyverno
# renovate: datasource=github-releases depName=kyverno/kyverno
pkgver=1.19.1
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
sha512sums=('da759c80424791730bdcd06b3fa7c207f4735c23a289be35a59b8545e929ca41609a7cc1b0c155d9a437045a554372a7d176da7d486b07d0739e7208767ff78a')
b2sums=('e6578bce3db7502575c2784e0645fcd72928cada6c1a4b7e3510d870133e17248b9312a6d24b52b03b0b386952c161088cc0fbd6fac0d49ce54e3043ba31e2e4')

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
