# Maintainer: Sebastian Stark <sstark+aur@mailbox.org>
pkgname=nerdshade
pkgver=1.4.1
pkgrel=1
pkgdesc="hyprsunset client to smoothly transition color temperature during sunrise/sunset"
arch=("x86_64")
url="https://github.com/sstark/nerdshade"
license=('MIT')
depends=('hyprsunset' 'hyprland')
makedepends=('git' 'go>=1.24')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sstark/nerdshade/archive/refs/tags/rel-$pkgver.tar.gz"
        "$pkgname.service")
sha256sums=('b22fe1a275d0ea15b1ec63b4756abe98cafb49941c81e788664831404f3b04a3'
            'd2a090d48cd30cf99925e809459a76cf7ff259e2af5b7fd5ce1556486f97a55e')
_commit=("6c14f2b811603a578570eed56d0820f52269d0b4")
install="$pkgname.install"

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    cd "$pkgname-rel-$pkgver"
    GOARCH=amd64 GOOS=linux go build -o nerdshade .
}

package() {
    cd "$pkgname-rel-$pkgver"
    install -vDm755 -t "$pkgdir/usr/bin" nerdshade
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
    install -vDm644 "$srcdir/$pkgname.service" \
        "$pkgdir/usr/lib/systemd/user/$pkgname.service"
}
