# $Id$
# Maintainer: Jerome Leclanche <jiri.tyr@gmail.com>

_pkg='bullettrain'
_goprj="$_pkg-sh"
_gopkg="$_pkg-go-core"
_gosrcprj="src/github.com/$_goprj"
_gosrcpkg="$_gosrcprj/$_gopkg"

pkgname="$_pkg-git"
pkgver=r69.cb485a7
pkgrel=1
pkgdesc='Bullettrain prompt builder written in Go'
url='https://github.com/bullettrain-sh'
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('go' 'godep')
conflicts=('bullettrain')
depends=('nerd-fonts-complete')
source=("git+https://github.com/$_goprj/$_gopkg.git")
sha256sums=('SKIP')


pkgver() {
    cd "$srcdir/$_gosrcpkg"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
    rm -rf "$srcdir/$_gosrcprj"
    mkdir -p "$srcdir/$_gosrcprj"
    mv "$srcdir/$_gopkg" "$srcdir/$_gosrcpkg"
    cd "$srcdir/$_gosrcpkg"
    msg2 "Fetching dependencies"
    GOPATH="$srcdir" go get -d ./...
}


build() {
    msg2 'Build program'
    cd "$srcdir/$_gosrcpkg"
    GOPATH="$srcdir" go build -a -o "$srcdir/$_pkg" "$_pkg.go"
}


package() {
    cd "$srcdir"
    install -Dm755 "$srcdir/$_pkg" "$pkgdir/usr/bin/$_pkg"
}
