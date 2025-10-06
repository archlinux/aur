# Maintainer: Shaun Lastra <shaun@lastra.us>
pkgname=tabctl
pkgver=1.1.4
pkgrel=2
pkgdesc="Command-line browser tab controller with rofi integration for multiple window managers"
arch=('x86_64')
url="https://github.com/slastra/tabctl"
license=('MIT')
depends=('dbus')
makedepends=('go' 'git')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/slastra/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('77faa09283adb13ecd3630062edd7e0574397b28ac297d99211991856df9a8a0')
install=tabctl.install

build() {
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o tabctl ./cmd/tabctl
    go build -o tabctl-mediator ./cmd/tabctl-mediator
}

package() {
    cd "$pkgname-$pkgver"

    # Install binaries
    install -Dm755 tabctl "$pkgdir/usr/bin/tabctl"
    install -Dm755 tabctl-mediator "$pkgdir/usr/bin/tabctl-mediator"

    # Install rofi scripts
    install -Dm755 scripts/rofi-tabctl-wmctrl.sh "$pkgdir/usr/share/$pkgname/scripts/rofi-tabctl-wmctrl.sh"
    install -Dm755 scripts/rofi-tabctl-niri.sh "$pkgdir/usr/share/$pkgname/scripts/rofi-tabctl-niri.sh"

    # Install browser extensions
    install -dm755 "$pkgdir/usr/share/$pkgname/extensions"
    cp -r extensions/firefox "$pkgdir/usr/share/$pkgname/extensions/"
    cp -r extensions/chrome "$pkgdir/usr/share/$pkgname/extensions/"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}