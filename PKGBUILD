pkgname=moc-mpris-bridge
pkgver=0.1.1
pkgrel=1
pkgdesc="MPRIS bridge for Music On Console"
arch=('x86_64' 'aarch64')
url="https://github.com/azr4e1/moc-mpris-bridge"
license=('MIT')
depends=('moc-pulse')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0f03666c579eff9ba2d4e849f15a9ae723f2d6386e6d9182376c3e5a474cd892')

build() {
    cd "$pkgname-$pkgver"  # GitHub creates this directory
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o "$pkgname"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname.service" \
        "$pkgdir/usr/lib/systemd/user/$pkgname.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
