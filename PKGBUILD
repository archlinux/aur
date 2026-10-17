# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=endlessh-go
pkgver=2026.0730.0
pkgrel=2
pkgdesc='SSH tarpit that slowly sends an endless banner, with Prometheus metrics (Go implementation)'
arch=('x86_64' 'aarch64')
url='https://github.com/shizunge/endlessh-go'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shizunge/endlessh-go/archive/refs/tags/$pkgver.tar.gz"
        'endlessh-go.service')
sha256sums=('77a401ce3fdfb70e76312e5f1d57de877eb23ccfa58c8e2320b8da6d1b716f2c'
            'f011c5c6955ebc74a3acf6a89c2bfff31af83da2b99f28290f7032d4471db0ca')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o endlessh-go .
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 endlessh-go "$pkgdir/usr/bin/endlessh-go"
    install -Dm644 "$srcdir/endlessh-go.service" "$pkgdir/usr/lib/systemd/system/endlessh-go.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
