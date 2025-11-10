# Maintainer: fuero <fuerob@gmail.com>
pkgname=kyverno-cli
_pkgname=kyverno
# renovate: datasource=github-releases depName=kyverno/kyverno
pkgver=1.16.0
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
sha512sums=('2c57c73de8b85c3ec80fd8568b83250214069489b7dc7437418f39c29866dd5e9c928ff2be15b65fd4f0f00b8002e9288946dfee9efbb5f62cdc97adc0de8042')
b2sums=('4e18706b1dcfbe47f122fa37a971b7379bc8d4f5523e9a21b2d93349d12720fa71c82a0afccf1bd84a14b80dfde6af62faecb8bcd061a5c619504836f98ba88d')

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
