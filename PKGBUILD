# Maintainer: Ralph Torres <mail at ralphptorr dot es>

_pkgname=sptlrx
pkgname=$_pkgname-git
pkgver=1.2.3.r0.a8ee388
pkgrel=1
pkgdesc='Synchronized lyrics in your terminal'
arch=(x86_64)
url=https://github.com/raitonoberu/sptlrx
license=(MIT)

provides=($_pkgname)
conflicts=($_pkgname)
makedepends=(git go)
source=(git+$url)
sha256sums=(SKIP)

pkgver() {
    cd "$srcdir"/$_pkgname
    git describe --tags --long --abbrev=7 |\
        sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//'
}

build () {
    cd "$srcdir"/$_pkgname
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
    go build .
}

check() {
    cd "$srcdir"/$_pkgname
    go test ./...
}

package() {
    cd "$srcdir"/$_pkgname
    install -Dm755 -t "$pkgdir"/usr/bin $_pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$_pkgname README.md
    install -Dm644 -t "$pkgdir"/usr/share/man/man5 man/$pkgname.5
}
