# Maintainer: azr4e1
pkgname=moc-mpris-bridge
pkgver=0.3.0
pkgrel=1
pkgdesc="MPRIS bridge for Music On Console"
arch=('x86_64' 'aarch64')
url="https://github.com/azr4e1/moc-mpris-bridge"
license=('MIT')
depends=('moc-pulse')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ae957185d9664901d71c1498cf2976dc6aae3e64bd107ef859b05c344017c9c9')

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
