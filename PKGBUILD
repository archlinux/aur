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
pkgver=1.32.0
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
sha256sums=('09dd768095bd5dd739ec32df5efacca97d2cf15996419deb7190fe2d68c56976'
            'd5715e3be5aa970b8e3e9552e786965d4c33bdc2ae372e708f9a8f3e9c0d45e9'
            '96dcfb0ccbbf30a140ff44101b90160faadca97f9aed4b1d73e2e2db52655fec'
            'fc6f48d9bdb3ad953e37aef163ec3fa3da8d3ca5fab4b78186481fb2988385a2'
            'df831b86096e2f06fd4b9f603a4141daef986d709fcdebb97f39493535aab7f6')

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
