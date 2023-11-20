# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>

pkgname=fv-cli
pkgver=0.4.7
pkgrel=1
pkgdesc='A command-line font viewer using terminal graphics (Sixel, iTerm, Kitty)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/kenshaw/fv"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c44fdc0032188ad1a2e22db701490d61be8e3d390e806686b99d91ec1154c446')

build() {
    cd fv-$pkgver

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags="-linkmode=external
                  -X main.name=fv
                  -X main.version=$pkgver" \
        -o fv
}

package() {
    cd fv-$pkgver
    install -Dm755 fv -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
