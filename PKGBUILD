# Maintainer: Paul Spruce <paul.spruce@gmail.com>

_pkgname=github-subdomains
pkgname=github-subdomains-git
pkgver=42.a779fc2
pkgrel=1
pkgdesc="Find subdomains on GitHub"
arch=(any)
url="https://github.com/gwen001/github-subdomains"
license=(GPL3)
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=(go git)
source=("$pkgname::git+https://github.com/gwen001/$_pkgname.git")
b2sums=(SKIP)

pkgver() {
    cd $pkgname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd $pkgname
    mkdir -p build/
}

build() {
    cd $pkgname
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="$CPPFLAGS"                                                                                                         
    export CGO_CFLAGS="$CFLAGS"                                                                                                             
    export CGO_CXXFLAGS="$CXXFLAGS"                                                                                                         
    export CGO_LDFLAGS="$LDFLAGS"                                                                                                           
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"                                         
    go build -o build ./...                                          
}

package() {
    cd $pkgname
    install -Dm755 "build/$_pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/" 
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/" 
}
