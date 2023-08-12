# Contributor: Whyme Lyu <callme5long@gmail.com>

pkgname=dnsproxy
pkgver=0.53.1
pkgrel=2
pkgdesc="Simple DNS proxy with DoH, DoT, DoQ and DNSCrypt support"
arch=('x86_64')
url="https://github.com/AdguardTeam/dnsproxy"
license=('Apache')
conflicts=('dnsproxy-bin' 'dnsproxy-adguard')
source=("dnsproxy.service"
        "update-quic-go.patch"
        "https://github.com/AdguardTeam/dnsproxy/archive/v${pkgver}.tar.gz")
makedepends=("go")
sha256sums=('002deb38e7d69beb8848c57a7ba0d00437c542589baccc6dab074767ffa64b75'
            'b85adfc69aa2cddee44a97e472e632f77eff24abadd172f14a1d68d4d76760f1'
            '48e5c7556b968e92aff3fc8953d1d89438788cde28a9f4770e57641f3d875cea')

_conf=etc/dnsproxy/dnsproxy.yaml
backup=($_conf)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 < ../update-quic-go.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go build --ldflags "-s -w -X main.VersionString=${pkgver}" -mod=mod -v -trimpath -buildmode=pie
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 dnsproxy "${pkgdir}/usr/bin/dnsproxy"
    install -Dm644 LICENSE "$pkgdir"/usr/share/license/dnsproxy/LICENSE
    install -Dm644 README.md "$pkgdir"/usr/share/doc/dnsproxy/README.md
    install -Dm644 config.yaml.dist "$pkgdir/$_conf"

    install -Dm644 "${srcdir}/dnsproxy.service" "${pkgdir}/usr/lib/systemd/system/dnsproxy.service"
}
