# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=box-git
pkgver=0.2.0.r0.gc22cfad
pkgrel=2
pkgdesc='Command-line tool to draw frames around text'
arch=('x86_64')
url='https://codeberg.org/AlphaLynx/box'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('box')
conflicts=('box')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd box
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
    cd box
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd box
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-compressdwarf=false -linkmode external" .
}

package() {
    cd box
    install -Dm755 box -t "$pkgdir/usr/bin"
    install -Dm644 man/box.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
