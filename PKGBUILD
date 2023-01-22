# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
pkgname=easierconnect-git
_pkgname=${pkgname%-git}
pkgver=TestBuild8.r1.262fd42
pkgrel=3
pkgdesc="Sangfor EasyConnect protocol reimplementation in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/lyc8503/EasierConnect"
license=('AGPL3')
depends=('glibc')
makedepends=('git' 'go')
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$_pkgname"
    mkdir -p build/
}

build() {
    cd "$_pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build .
}

check() {
    cd "$_pkgname"
    go test ./...
}

package() {
    cd "$_pkgname"
    install -Dm755 build/EasierConnect "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" *.md
}
