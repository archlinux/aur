# Maintainer: fuero <fuerob@gmail.com>
_pkgname=ls-lint
pkgname="${_pkgname}-git"
# renovate: pkgName=https://github.com/loeffel-io/ls-lint depName=ls-lint-git
pkgver=2.3.1.r5.421070a
pkgrel=3
pkgdesc='directory and filename linter'
arch=('x86_64')
url="https://github.com/loeffel-io/ls-lint"
source=("${_pkgname}::git+${url}")
license=('MIT')
depends=('glibc')
makedepends=('git' 'go-pie')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

build () {
  cd "${_pkgname}"

  _x=(
    Commit="$(git rev-parse --short HEAD)"
    Date="$(date -u +%Y%m%d.%H%M%S)"
    Version="$(git describe --always --tags --abbrev=0).$(git rev-parse --short HEAD)"
  )
  export CGO_ENABLED=1
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly -v"
  export GO111MODULE=on

  go build \
    -ldflags="${_x[*]/#/-X=main.} -compressdwarf=false -linkmode external" \
    -o bin/ \
    "./cmd/${_pkgname//-/_}"
}

check() {
  cd "${_pkgname}"
  go test -short ./...
}

package () {
  cd "${_pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm0755 "bin/${_pkgname//-/_}" "${pkgdir}/usr/bin/${_pkgname}"
  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done
}
