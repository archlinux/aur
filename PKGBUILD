# Maintainer: vmartinv <https://github.com/vmartinv>
pkgname=opensnitch-zenity
pkgver=0.2.0
pkgrel=1
pkgdesc="Lightweight zenity prompt UI for the OpenSnitch daemon (unofficial)"
arch=('x86_64' 'aarch64')
url="https://github.com/vmartinv/opensnitch-zenity"
license=('GPL-3.0-or-later')
depends=('opensnitch' 'zenity')
makedepends=('go')
optdepends=('libnotify: notify_on_default desktop notifications')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e5f1a391c5cd8caa15462f1f493a4630369ae8342616366f4c5f7187a5d0c9e8')

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
