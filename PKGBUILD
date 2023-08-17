# Contributor: Whyme Lyu <callme5long@gmail.com>

pkgname=dnsproxy
pkgver=0.54.0
pkgrel=1
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
            '13d25158408387995cbb294efe630f14bf1340f50305e895854c950e1a34d498')

_conf=etc/dnsproxy/dnsproxy.yaml
backup=($_conf)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go build --ldflags "-s -w -X main.VersionString=${pkgver}" -mod=vendor -v -trimpath -buildmode=pie
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 dnsproxy "${pkgdir}/usr/bin/dnsproxy"
    install -Dm644 LICENSE "$pkgdir"/usr/share/license/dnsproxy/LICENSE
    install -Dm644 README.md "$pkgdir"/usr/share/doc/dnsproxy/README.md
    install -Dm644 config.yaml.dist "$pkgdir/$_conf"

    install -Dm644 "${srcdir}/dnsproxy.service" "${pkgdir}/usr/lib/systemd/system/dnsproxy.service"
}
