# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: Přemysl Janouch <p.janouch@gmail.com>

pkgname=hugo-git
_pkgname=hugo
pkgver=v0.14.r185.g1b8440a
pkgrel=1
pkgdesc="Fast and Flexible Static Site Generator in Go"
arch=('x86_64' 'i686' 'arm')
url="http://hugo.spf13.com/"
conflicts=('hugo')
provides=('hugo')
options=('!strip')
license=('custom:SimPL')
makedepends=('go' 'git')
source=('git+https://github.com/spf13/hugo.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"

  # Force our own git checkout
  export GOPATH="$srcdir"
  mkdir -p "$GOPATH/src/github.com/spf13"
  ln -s `pwd` "$GOPATH/src/github.com/spf13/hugo"

  go get -d -v github.com/spf13/hugo
  go build
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
