# Maintainer: Thorben Günther <admin@xenrox.net>

pkgname=ntfy-alertmanager
pkgver=0.5.0
pkgrel=1
pkgdesc='A bridge between ntfy and Alertmanager'
arch=('x86_64')
url='https://hub.xenrox.net/~xenrox/ntfy-alertmanager'
license=('AGPL3')
makedepends=('go')
optdepends=(
    'redis: Persistent cache with Redis'
)
options=('!lto')
backup=('etc/ntfy-alertmanager/config')
source=(
    "https://git.xenrox.net/~xenrox/ntfy-alertmanager/refs/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig}
    "ntfy-alertmanager.service"
    "sysusers.conf"
)
sha256sums=('4a7da13edd37a383e2d5663fddde685a1594b7cc7edcff21a0d3d2e7cb63d0ac'
            'SKIP'
            '3c87f8d84854f04d362892b2a74660d0d48ca65030c0ab659827e9b32e532172'
            '7d9183eac94bedc9c82b4abcb6b50b262599f079d2d078cdafe5bb6019464da4')
validpgpkeys=('BBC78A8FF5467A292893AE702698363BB3DBBAEE')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="${srcdir}"
    go mod download
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"

    go build \
        -buildmode=pie \
        -trimpath \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -X main.version=v${pkgver} -extldflags \"${LDFLAGS}\"" \
        -o ntfy-alertmanager
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 ntfy-alertmanager "$pkgdir"/usr/bin/ntfy-alertmanager
    install -Dm644 ../ntfy-alertmanager.service -t "$pkgdir"/usr/lib/systemd/system/
    install -Dm644 ../sysusers.conf "$pkgdir"/usr/lib/sysusers.d/ntfy-alertmanager.conf
}
