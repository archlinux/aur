# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname=shq-git
_pkgname=${pkgname%-git}
pkgver=0.1.0.r7.g05cdb4e
pkgrel=1
pkgdesc='shell queue'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://codeberg.org/tippfehlr/$_pkgname"
license=('MIT')
makedepends=('go' 'git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c 2-
}

prepare() {
    cd "$_pkgname"
    mkdir -p build/

    # download go modules so build() works offline
    go mod download
}

build() {
    cd "$_pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build
}

package() {
    cd "$_pkgname"
    install -Dm755 "build/$_pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
