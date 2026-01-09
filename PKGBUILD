# Maintainer: fuero <fuerob@gmail.com>
pkgname=kyverno-cli
_pkgname=kyverno
# renovate: datasource=github-releases depName=kyverno/kyverno
pkgver=1.16.2
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
sha512sums=('92d7e3f5f14fc4d3373b1ae8baa12ee91e3ba4e9426fc22b1162ab4e28ba1bc8cbe437e83977e11b26737ea8fa82e855d1d36f431f52bd970a7f3d6a280f3a99')
b2sums=('8ae6e00266cb5187172fb45d5634f7eca6464fb7eac1dc070888c056551409952714934393859266599c8c01312d707c9aed90638338503d3f2a755d9939093d')

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
