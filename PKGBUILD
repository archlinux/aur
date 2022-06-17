# Maintainer: Jguer <pkgbuilds at jguer.space>
pkgname="votar-git"
_pkgname="votar"
pkgver=1.0.0.r0.g5aaae4b
pkgrel=2
pkgdesc="Tool to vote for AUR packages"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Jguer/votar"
license=('GPL3')
makedepends=('go')
conflicts=('votar')
provides=('votar')
source=("votar::git+https://github.com/Jguer/votar.git#branch=main")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
    cd "$srcdir/$_pkgname"
    mkdir -p build
}

build() {
    cd "$srcdir/$_pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o build ./cmd/votar
}

check() {
    cd "$srcdir/$_pkgname"
    go test ./...
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
