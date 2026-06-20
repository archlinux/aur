# Maintainer: Kostiantyn Kushnir <chpock@gmail.com>
pkgname=quickdashboard-git
_pkgname=quickdashboard
pkgver=0.0.5.r0.g4897e21
pkgrel=1
pkgdesc="Configurable Quickshell dashboard for Wayland"
arch=('any')
url="https://github.com/chpock/quickdashboard"
license=('GPL-3.0-or-later')
depends=(
    'bash'
    'quickshell'
    'qt6-graphs'
    'dgop'
    'iproute2'
    'iputils'
)
makedepends=('git')
optdepends=(
    'iw: Wi-Fi SSID and signal strength in the network widget'
    'khal: calendar events widget'
    'vdirsyncer: calendar sync and refresh integration'
    'openusage-cli: AI usage limits widget'
)
provides=("$_pkgname=${pkgver}")
conflicts=('quickdashboard')
source=("git+https://github.com/chpock/quickdashboard.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"

    local tag commits hash

    tag=$(git describe --tags --abbrev=0 --match 'v*' 2>/dev/null || true)
    hash=$(git rev-parse --short=7 HEAD)

    if [[ -n "$tag" ]]; then
        commits=$(git rev-list --count "${tag}..HEAD")
        printf '%s.r%s.g%s\n' "${tag#v}" "$commits" "$hash"
    else
        commits=$(git rev-list --count HEAD)
        printf '0.0.0.r%s.g%s\n' "$commits" "$hash"
    fi
}

package() {
    cd "$srcdir/$_pkgname"

    sed -i "s/^VERSION=.*/VERSION=$pkgver/" "bin/quickdashboard"

    install -Dm755 "bin/quickdashboard" "$pkgdir/usr/bin/quickdashboard"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -d "$pkgdir/usr/share/$_pkgname"
    cp -a \
        "shell.qml" \
        "DashboardDefault.qml" \
        "defaults.json" \
        "theme.json" \
        "widget.json" \
        "qd" \
        "$pkgdir/usr/share/$_pkgname/"
}
