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
pkgver=1.41.0
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
    "nextdns.tmpfiles"
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
    install -vDm 644 "$srcdir/${origname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${origname}.conf"
}

sha256sums=('f13439f3c797769add028bff68974d88452add8b026b6da55fa056020ffbe479'
            '627734881c9bcefd8577aa2d761e3b535195b3ccd7cd99f9bf63c5586f4ca8e2'
            '96dcfb0ccbbf30a140ff44101b90160faadca97f9aed4b1d73e2e2db52655fec'
            '3f5faa33c0c70b0aeded126428f10b20ca1848e1ede43e5c6c7a76ac3f64be30'
            'df831b86096e2f06fd4b9f603a4141daef986d709fcdebb97f39493535aab7f6')
