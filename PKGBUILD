# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Pairadux

pkgname=muxly
pkgver=0.21.0
pkgrel=1
pkgdesc='A lightweight CLI for handling TMUX sessions with ease'
url='https://github.com/Pairadux/muxly'
arch=('aarch64' 'i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c50e6c6c6a0d066528afdf7c277f5b599dd2d8e4f955de1778c81e0ee0ff49c2')

prepare() {
    export GOPATH="$srcdir"
    cd "Muxly-$pkgver"
    mkdir -p build
    go mod download -modcacherw
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "Muxly-$pkgver"
    go build -o build/muxly
}

package() {
    cd "Muxly-$pkgver"
    install -Dm755 build/muxly -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname/"
}
