# Maintainer: fuero <fuerob@gmail.com>
pkgname=ketall-git
#_ renovate: datasource=github-releases depName=corneliusweig/ketall
pkgver=1.3.8.r7.16390bd
pkgrel=1
pkgdesc='Kubectl plugin to show really all kubernetes resources'
arch=('x86_64')
_repo_prefix=''
_repo_name="${pkgname%-git}"
url="https://github.com/corneliusweig/${_repo_name}"
depends=('kubectl' 'glibc')
makedepends=('git' 'go')
groups=('kubectl-plugins')
source=("${_repo_name}::git+${url}")
license=('MIT')
conflicts=('ketall' 'kubectl-ketall')
provides=('ketall' 'kubectl-ketall')
sha512sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_repo_name}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

build() {
  local _x _commit

  cd "${srcdir}/${_repo_name}"

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
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly -v"
  export GO111MODULE=on
  # -ldflags="-linkmode=external ${_x[*]/#/-X=${url/https:\/\/}/pkg/util.}" \
  mkdir bin
  go mod tidy
  go build \
    -ldflags="-s -w ${_x[*]/#/-X=${url/https:\/\/}/pkg/version.}" \
    -o bin/ \
    ./...
}

check() {
  cd "${srcdir}/${_repo_name}"
  go test -short ./...
}

package() {
  cd "${srcdir}/${_repo_name}"
  install -Dm755 "bin/${_repo_name}" "${pkgdir}/usr/bin/${_repo_name}"
  ln -snf "${_repo_name}" "${pkgdir}/usr/bin/kubectl-${_repo_name}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
