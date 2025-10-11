# Maintainer: fuero <fuerob@gmail.com>
_pkgname=ketall
pkgname="${_pkgname}-git"
#_ renovate: datasource=github-releases depName=corneliusweig/ketall
pkgver=1.3.8.r7.16390bd
pkgrel=5
pkgdesc='Kubectl plugin to show really all kubernetes resources'
arch=('x86_64')
url="https://github.com/corneliusweig/${_pkgname}"
depends=('kubectl' 'glibc')
makedepends=('git' 'go')
groups=('kubectl-plugins')
source=("${_pkgname}::git+${url}")
license=('MIT')
conflicts=('ketall' 'kubectl-ketall')
provides=('ketall' 'kubectl-ketall')
sha512sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

build() {
  cd "${_pkgname}"

  local _x _commit

  _commit=$(git rev-parse HEAD)
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

  go build -v \
    -ldflags="${_x[*]/#/-X=${url/https:\/\/}/pkg/version.} -linkmode external" \
    -o bin/ \
    ./...
}

check() {
  cd "${_pkgname}"
  go test -short ./...
}

package() {
  cd "${_pkgname}"
  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  ln -snf "${_pkgname}" "${pkgdir}/usr/bin/kubectl-${_pkgname}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
