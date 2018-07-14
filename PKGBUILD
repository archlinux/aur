# Maintainer: Brian Clemens <brian@tiuxo.com>
# Contributor: Přemysl Janouch <p.janouch@gmail.com>

pkgname=hugo-git
_pkgname=hugo
pkgver=v0.44.DEV.G2F2BC7FF
pkgrel=1
pkgdesc="Fast and Flexible Static Site Generator in Go"
arch=('x86_64')
url="https://gohugo.io/"
conflicts=('hugo')
provides=('hugo')
options=('!strip')
license=('Apache')
depends=('glibc')
makedepends=('go-pie' 'git')
optdepends=('pygmentize: syntax-highlight code snippets')
source=('git+https://github.com/gohugoio/hugo.git')
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}"/${_pkgname}
  export GOPATH="${srcdir}"
  export PATH="${PATH}:${srcdir}/bin"
  install -d "${GOPATH}/src/github.com/gohugoio"
  cp -a "$(pwd)" "${GOPATH}/src/github.com/gohugoio/hugo"
}

build() {
  cd "${GOPATH}/src/github.com/gohugoio/hugo"
  go get -u github.com/golang/dep/cmd/dep
  dep ensure
  go get github.com/magefile/mage
  HUGO_BUILD_TAGS=extended mage hugo
}

package() {
  cd "${GOPATH}/src/github.com/gohugoio/hugo"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
