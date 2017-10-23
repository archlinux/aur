# Maintainer: neodarz <neodarz@neodarz.net>

pkgname=grv
pkgver=r212.7e00d05
pkgrel=1
pkgdesc="terminal interface for viewing git repositories"
arch=('i686' 'x86_64')
url="https://github.com/rgburke/$pkgname"
license=('GPL-3.0')
depends=(ncurses readline curl)
makedepends=(cmake go)
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname"::"git+https://github.com/rgburke/$pkgname.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    export GOROOT=/usr/lib/go
    export GOPATH="$srcdir"
    go get -d github.com/rgburke/grv/cmd/grv
    cd $GOPATH/src/github.com/rgburke/grv
    make
}

package() {
    export GOROOT="$GOPATH"
    install -Dm755 "$(pwd)/src/github.com/rgburke/grv/grv" "$pkgdir/usr/bin/$pkgname"
}

