# Maintainer: Radu Potop <radu at wooptoo dot com>
# Contributor: Guillaume Lefranc <guillaume@signal18.io>
#
# Forked from aur/nextdns.
#
# Instead of running the NextDNS Client as root this package configures
# it to run as a regular user under Systemd.
#
# It is not recommended to run the upstream "nextdns install" script,
# instead enable the service with "systemctl enable --now nextdns".
#

pkgname=nextdns-unprivileged
origname=nextdns
pkgver=1.42.0
pkgrel=1
pkgdesc='The NextDNS DoH client running as unprivileged user.'
arch=('x86_64')
url='https://github.com/nextdns/nextdns'
license=('MIT')
conflicts=('nextdns')
provides=('nextdns')
install="$origname.install"
makedepends=('go')
source=(
    "$url/archive/v$pkgver.tar.gz"
    "nextdns.service"
    "nextdns.sysusers"
    "01-socket.patch"
)
options=(!lto)

prepare() {
    cd "${origname}-$pkgver"
    patch -Np1 < ../01-socket.patch
}

build() {
    cd "${origname}-$pkgver"
    go build --buildmode=pie -trimpath -ldflags "-X main.version=$pkgver -extldflags $LDFLAGS" -o ${origname} .
}

package() {
    cd "${origname}-$pkgver"
    install -vDm 755 ${origname} "${pkgdir}/usr/bin/${origname}"
    install -vDm 644 "$srcdir/${origname}.service"  "${pkgdir}/usr/lib/systemd/system/${origname}.service"
    install -vDm 644 "$srcdir/${origname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${origname}.conf"
}

sha256sums=('893692bea9015116d6ce610c94dccf744f3aa29aeb716a15cca17dd6e6b837c1'
            '44b78be27eb618e2d93b4b480c9aef38d413bde3f8bfa6af20d651f0bf8c8b62'
            '96dcfb0ccbbf30a140ff44101b90160faadca97f9aed4b1d73e2e2db52655fec'
            'df831b86096e2f06fd4b9f603a4141daef986d709fcdebb97f39493535aab7f6')
