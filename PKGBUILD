# Maintainer: vmartinv <https://github.com/vmartinv>
pkgname=opensnitch-zenity
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight zenity prompt UI for the OpenSnitch daemon (unofficial)"
arch=('x86_64' 'aarch64')
url="https://github.com/vmartinv/opensnitch-zenity"
license=('GPL-3.0-or-later')
depends=('opensnitch' 'zenity')
makedepends=('go')
optdepends=('libnotify: notify_on_default desktop notifications'
            'wl-clipboard: Copy details button on Wayland'
            'xclip: Copy details button on X11')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('132a501f2667bcb299c6b97391c3fdb25781d4cb12a19f60dc6bb0a768b6c042')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o opensnitch-zenity ./cmd/opensnitch-zenity
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 opensnitch-zenity "$pkgdir/usr/bin/opensnitch-zenity"
    install -Dm644 contrib/systemd/opensnitch-zenity.service \
        "$pkgdir/usr/lib/systemd/user/opensnitch-zenity.service"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
