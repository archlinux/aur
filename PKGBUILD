# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=gommit-git
_gitname=gommit
pkgver=2.0.0.r15.g522ce30
pkgrel=1
pkgdesc="Enforce git message commit consistency"
arch=(x86_64 i686)
url=https://github.com/antham/gommit
license=(Apache)
makedepends=(git go)
depends=(glibc)
provides=(gommit)
conflicts=(gommit)
source=(git+https://github.com/antham/gommit)
md5sums=(SKIP)


pkgver() {
    cd "$_gitname"
    git describe --long --tags \
        | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;'
}

build() {
    cd "$srcdir/$_gitname"
    export GOPATH="$srcdir/gopath"
    [[ -d "$GOPATH" ]] || mkdir "$srcdir"/gopath
    go get -d
    # go build complains because we already have a directory
    # with the output binary name, so use another name instead.
    go build -o gommit.bin
}

package() {
    cd "$srcdir/$_gitname"
    install -Dm755 gommit.bin "$pkgdir/usr/bin/gommit"
}
