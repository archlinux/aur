# Maintainer: George Rawlinson <george@rawlinson.net.nz>
pkgname=realize-git
_pkgname=realize
pkgver=v2.0.2.r18.g05f079e
pkgrel=1
pkgdesc="Golang live reload and task runner"
arch=('x86_64')
url="https://gorealize.io/"
license=('GPL')
depends=('glibc')
makedepends=('go' 'dep' 'git')
provides=('realize')
options=('!strip')
source=('git+https://github.com/oxequa/realize.git')
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  # setup go env vars
  export GOPATH="${srcdir}"
  export PATH="${PATH}:${srcdir}/bin"

  # create dirs & copy source
  cd "${_pkgname}"
  install -d "${GOPATH}/src/github.com/oxequa"
  cp -a "$(pwd)" "${GOPATH}/src/github.com/oxequa/realize"
}

build() {
  cd "${GOPATH}/src/github.com/oxequa/realize"

  # install dependencies
  dep ensure

  # build binary
  # note: `go build` is not used due to realize's directory layout
  go install
}

package() {
  install -Dm755 "${GOPATH}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
