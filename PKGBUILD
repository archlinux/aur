_pkgname=shortscan
pkgname=shortscan-git
pkgver=8.09a429b
pkgrel=1
pkgdesc="An IIS short filename enumeration tool"
arch=(any)
url="https://github.com/bitquark/shortscan"
license=(MIT)
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=(go git)
source=("$pkgname::git+https://github.com/bitquark/$_pkgname.git")
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
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/" 
}
