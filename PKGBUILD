# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>

pkgname=fv-cli
pkgver=0.5.2
pkgrel=1
pkgdesc='A command-line font viewer using terminal graphics (Sixel, iTerm, Kitty)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/kenshaw/fv"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b6bb3ac0f4e8a775ef0ee19e5c030d07a63df0921a5a04430c6e18d9e7e071ba')

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
