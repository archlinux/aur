# Maintainer: Shaun Lastra <shaun@lastra.us>
pkgname=tabctl
pkgver=1.1.0
pkgrel=1
pkgdesc="Command-line browser tab controller with rofi integration for multiple window managers"
arch=('x86_64')
url="https://github.com/slastra/tabctl"
license=('MIT')
depends=('dbus')
makedepends=('go' 'git')
optdepends=(
    'rofi: for rofi integration scripts'
    'wmctrl: for X11 window management'
    'xprop: for X11 window detection'
    'hyprland: for Wayland/Hyprland support'
    'brave-bin: Brave browser support'
    'chromium: Chromium browser support'
    'google-chrome: Chrome browser support'
    'firefox: Firefox browser support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/slastra/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('58747ca727095a1d28236b0255febe5031e451117f0871cd3957d8a07f7c6aac')
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
    install -Dm755 scripts/rofi-wmctrl.sh "$pkgdir/usr/share/$pkgname/scripts/rofi-wmctrl.sh"
    install -Dm755 scripts/rofi-hyprctl.sh "$pkgdir/usr/share/$pkgname/scripts/rofi-hyprctl.sh"

    # Install browser extensions
    install -dm755 "$pkgdir/usr/share/$pkgname/extensions"
    cp -r extensions/firefox "$pkgdir/usr/share/$pkgname/extensions/"
    cp -r extensions/chrome "$pkgdir/usr/share/$pkgname/extensions/"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}