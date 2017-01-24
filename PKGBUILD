# Maintainer: Morten Linderud <morten@linderud.pw>

pkgname=dep-git
_pkgname=dep
pkgver=r208.8572e8b
pkgrel=2
pkgdesc="Go dependency tool"
arch=('x86_64' 'i686')
url="https://github.com/golang/dep"
license=('BSD')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("git://github.com/golang/dep.git")
sha256sums=('SKIP')
_gourl='github.com/golang/dep'

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p "$srcdir"/src/github.com/golang
  ln -sf "$srcdir/$_pkgname" "$srcdir"/src/github.com/golang/dep
}

build() {
  export GOPATH="$srcdir"
  export GOBIN="$srcdir/bin"
  export PATH=$PATH:$GOPATH/bin

  cd "$GOPATH"/src
  go get -d -v github.com/golang/dep

  cd "$GOPATH"/src/github.com/golang/dep
  go build -o "${_pkgname}"
}

package() {
  cd "${_pkgname}"

  install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
