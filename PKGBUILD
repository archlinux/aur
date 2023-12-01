# Maintainer: detiam <dehe_tian@outlook.com>

_pkgname=phantomsocks
pkgname=phantomsocks-ipv6-git
pkgver=r301.b1b13c5
pkgrel=1
pkgdesc="A cross-platform proxy client/server for Linux/Windows/macOS (resolve both ipv4 and ipv6 dns record)"
arch=(i686 x86_64)
url="https://github.com/macronut/$_pkgname"
license=('LGPL-3.0')

provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
makedepends=('go' 'git')
depends=('systemd' 'jq')
optdepends=(
    'libpcap: you can build pcap version if you want, see PKGBUILD build()'
)

install=$_pkgname.install
source=(
    "git+${url}.git"
    "$_pkgname-init.sh"
    "$_pkgname.service"
    '0001-SOCKS-SOCKS5.patch'
    '0001-resolve-both-v4-and-v6-dns-record-default.patch'
    '0002-just-keep-random.patch')
sha256sums=('SKIP'
            '22d5545c6bb8430cd8efd1452e0647ee0d3feab0c8e775167ec291e4fba24927'
            '4602cf1421b16780aea3eef1d69ed44197efa6cbfe5e64193a127852ba71750c'
            '98159d9432cb13937f8c4d743cd3ee87d663404825de89268345029cf319062d'
            '92c398376e015b069544a2d64d1ff898961089f1d7595f074eda34c7f1594977'
            '31925baa7ab583f724188bd99323182dc9aef273991874028ffc3bf773dfe8d4')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd "$_pkgname"
    
    # Fix pac service when no profile
    patch -p1 -i '../0001-SOCKS-SOCKS5.patch'

    # For ipv6 dns record resolve
    patch -p1 -i '../0001-resolve-both-v4-and-v6-dns-record-default.patch'
    patch -p1 -i '../0002-just-keep-random.patch'
}

build() {
    cd "$_pkgname"
    # Choose between them
    go build -tags rawsocket
    #go build -tags pcap
}

package() {
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
