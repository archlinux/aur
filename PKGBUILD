# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Pairadux

pkgname=muxly
pkgver=0.18.2
pkgrel=1
pkgdesc='A lightweight CLI for handling TMUX sessions with ease'
url='https://github.com/Pairadux/muxly'
arch=('aarch64' 'i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5aa0bc2080cae4a2b084030b529c8ddb970025f2e9e5b16e47cf27eb3554d853')

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
