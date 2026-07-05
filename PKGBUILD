# Maintainer: Shaun Lastra <shaun@lastra.us>
pkgname=tabctl-git
pkgver=1.2.1.r100.g601e553
pkgrel=1
pkgdesc="Command-line browser tab controller with rofi integration for multiple window managers (git version)"
arch=('x86_64')
url="https://github.com/slastra/tabctl"
license=('MIT')
depends=('dbus')
makedepends=('go' 'git')
optdepends=(
    'rofi: rofi tab-switcher scripts'
    'wmctrl: X11 window focusing (rofi-tabctl-wmctrl.sh)'
    'niri: Wayland window focusing (rofi-tabctl-niri.sh)'
    'jq: JSON parsing in rofi-tabctl-niri.sh'
    'curl: favicon fetching in rofi-tabctl-niri.sh'
    'imagemagick: favicon processing in rofi-tabctl-niri.sh'
    'firefox: Firefox browser support'
    'brave-bin: Brave browser support'
    'chromium: Chromium browser support'
    'google-chrome: Chrome browser support'
)
provides=('tabctl')
conflicts=('tabctl')
options=('!debug')
source=("git+https://github.com/slastra/tabctl.git")
sha256sums=('SKIP')
install=tabctl.install

pkgver() {
    cd "tabctl"
    printf "1.2.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "tabctl"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o tabctl ./cmd/tabctl
    go build -o tabctl-mediator ./cmd/tabctl-mediator

    if [[ -x scripts/build-extensions.sh ]]; then
        ./scripts/build-extensions.sh
    fi
}

package() {
    cd "tabctl"

    # Install binaries
    install -Dm755 tabctl "$pkgdir/usr/bin/tabctl"
    install -Dm755 tabctl-mediator "$pkgdir/usr/bin/tabctl-mediator"

    # Install rofi scripts
    install -Dm755 scripts/rofi-tabctl-wmctrl.sh "$pkgdir/usr/share/tabctl/scripts/rofi-tabctl-wmctrl.sh"
    install -Dm755 scripts/rofi-tabctl-niri.sh "$pkgdir/usr/share/tabctl/scripts/rofi-tabctl-niri.sh"

    # Install browser extensions
    install -dm755 "$pkgdir/usr/share/tabctl/extensions"
    cp -r extensions/firefox "$pkgdir/usr/share/tabctl/extensions/"
    cp -r extensions/chrome "$pkgdir/usr/share/tabctl/extensions/"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/tabctl/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/tabctl/LICENSE"
}
