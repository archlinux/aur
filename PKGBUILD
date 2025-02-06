# Maintainer: detiam <dehe_tian@outlook.com>

# pcap have more feature, but require libpcap
_use_pcap=${_use_pcap-y}

_pkgname=phantomsocks
pkgname=phantomsocks-ipv6-git
pkgver=r315.9956392
pkgrel=1
pkgdesc="A cross-platform proxy client/server for Linux/Windows/macOS (resolve both ipv4 and ipv6 dns record)"
arch=(i686 x86_64)
url="https://github.com/detiam/$_pkgname"
license=('LGPL-3.0')

provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
makedepends=('go' 'git')
depends=('systemd' 'jq')

install=$_pkgname.install
source=(
    "git+${url}.git"
    "$_pkgname-init.sh"
    "$_pkgname.service")
sha256sums=('SKIP'
            '22d5545c6bb8430cd8efd1452e0647ee0d3feab0c8e775167ec291e4fba24927'
            'b8c75de9027fd4f018f6b4853a52317b86f9755540db816f3fdfa47db0fd5c00')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

#prepare() {
#    cd "$_pkgname"
#}

build() {
    cd "$_pkgname"
    if [[ $_use_pcap == y ]]; then
        go build -tags pcap
    else
        go build -tags rawsocket
    fi
}

package() {
    if [[ $_use_pcap == y ]]; then
        depends+=('libpcap')
    fi

    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/systemd/user"
    install -dm755 "$pkgdir/usr/share/phantomsocks"

    install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/user/"
    install "$_pkgname-init.sh" "$pkgdir/usr/bin/$_pkgname-init"

    cd "$_pkgname"

    install -Dm644 "config.json" "$pkgdir/usr/share/phantomsocks"
    install -Dm644 "default.conf" "$pkgdir/usr/share/phantomsocks"

    install "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
