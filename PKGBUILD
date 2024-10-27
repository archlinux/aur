# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname=shq
pkgver=0.1.0
pkgrel=1
pkgdesc='shell queue'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://codeberg.org/tippfehlr/$pkgname"
license=('MIT')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha512sums=('cfc6862d3f215ff53abf51bda019b8a87e321ad11960fb05a9d8b440982f5e5589387d3757a3b12724dab97d2957edf7d8c0a5d6411123806d70b3dfbe882e45')

prepare() {
    cd "$pkgname"
    mkdir -p build/

    # downmoad go modules so build() works offline
    go mod download
}

build() {
    cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build
}

package() {
    cd "$pkgname"
    install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
