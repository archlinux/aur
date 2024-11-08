# Maintainer: Jguer <pkgbuilds at jguer.space>
pkgname="votar"
_pkgname="votar"
pkgver=1.0.0
pkgrel=1
pkgdesc="Tool to vote for AUR packages"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Jguer/votar"
license=('GPL3')
makedepends=('go')
conflicts=('votar')
provides=('votar')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Jguer/votar/archive/v${pkgver}.tar.gz")
sha256sums=('1f4ab1f454537746224295ed74d8d2205d7c19f0524491cb92b4c2105ab69d7c')

prepare(){
    cd "$srcdir/$_pkgname-$pkgver"
    mkdir -p build
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o build ./cmd/votar
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
