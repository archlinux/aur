# Maintainer: Paul Spruce <paul.spruce@gmail.com>
_pkgname=aquatone
pkgname=aquatone-git
pkgver=142.2daa022
pkgrel=1
pkgdesc='A Tool for Domain Flyovers'
arch=("x86_64")
url="https://github.com/shelld3v/aquatone"
license=("MIT")
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=("chromium")
makedepends=("git")
source=("$pkgname::git+https://github.com/shelld3v/$_pkgname.git")
b2sums=("SKIP")

pkgver() {
    cd $pkgname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd "$srcdir/$pkgname"
    mkdir -p build/
}

build() {
    cd "$srcdir/$pkgname"
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="$CPPFLAGS"                                                                                                         
    export CGO_CFLAGS="$CFLAGS"                                                                                                             
    export CGO_CXXFLAGS="$CXXFLAGS"                                                                                                         
    export CGO_LDFLAGS="$LDFLAGS"                                                                                                           
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"                                         
    go build -o build ./...                                          
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "build/$_pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 *.md -t "$pkgdir/usr/share/doc/$pkgname" 
}
