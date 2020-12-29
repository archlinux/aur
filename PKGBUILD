# Maintainer: Julian Hauser <julian at julianhauser.com>

pkgname=fzf-bibtex-git
_pkgname=fzf-bibtex
pkgver=r70.53c49fa
pkgrel=1
pkgdesc='Fzf for bibtex. Straightforward vim integration.'
arch=('x86_64')
url="https://github.com/msprev/${_pkgname}"
license=('GPL')
makedepends=('git' 'go')
depends=('fzf' 'bibtool')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${srcdir}"
  install -d "build/src/github.com/msprev/${_pkgname}"
  cp -r "${_pkgname}/" "build/src/github.com/msprev/"
  mkdir -p "build/src/github.com/msprev/${_pkgname}/build"
}

build() {
  cd "${srcdir}/build/src/github.com/msprev/${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="$GOPATH:$srcdir/build"
  go build -o build ./...
}

package() {
  cd "${srcdir}/build/src/github.com/msprev/${_pkgname}"
  install -Dm755 build/bibtex-ls "$pkgdir"/usr/bin/bibtex-ls
  install -Dm755 build/bibtex-markdown "$pkgdir"/usr/bin/bibtex-markdown
  install -Dm755 build/bibtex-cite "$pkgdir"/usr/bin/bibtex-cite
}
