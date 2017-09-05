# Maintainer: Morten Linderud <morten@linderud.pw>

pkgname=dep-git
_pkgname=dep
pkgver=r2425.d3e738d4
pkgrel=1
pkgdesc="Go dependency tool"
arch=('x86_64' 'i686')
url="https://github.com/golang/dep"
license=('BSD')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("dep")
conflicts=("dep")
source=("git+https://github.com/golang/dep.git")
sha256sums=('SKIP')
_gourl='github.com/golang/dep'

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf "${srcdir}/src"
  mkdir -p "${srcdir}/src/github.com/golang"
  ln -sf "${srcdir}/${_pkgname}" "${srcdir}/src/github.com/golang/dep"
}

build() {
  export GOPATH="$srcdir"
  export GOBIN="$srcdir/bin"
  export PATH="$PATH:$GOPATH/bin"
  cd "${GOPATH}/src/github.com/golang/dep/cmd/dep"
  go get . 
}

package() {
  cd "${_pkgname}"
  install -Dm755 "../bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
