# Contributor: Whyme Lyu <callme5long@gmail.com>

pkgname=dnsproxy
pkgver=0.49.2
pkgrel=1
pkgdesc="Simple DNS proxy with DoH, DoT, DoQ and DNSCrypt support"
arch=('x86_64')
url="https://github.com/AdguardTeam/dnsproxy"
license=('Apache')
conflicts=('dnsproxy-bin' 'dnsproxy-adguard')
source=("dnsproxy.service"
        "dnsproxy.yaml"
        "https://github.com/AdguardTeam/dnsproxy/archive/v${pkgver}.tar.gz")
makedepends=("go")
sha256sums=('565eea9808589ecafa81f2229ac1f85b39028e26d488a9a7c0b51afc43d7f42b'
            '72937969cc68182672e945fb26a6e350772a421463a4593c113d2f89af0b922c'
            'e1bbaee78077a94149fc0fe18a4c7c9609d96307fa7c4b3ae09811965d5db96a')

_conf=etc/dnsproxy/dnsproxy.yaml
backup=($_conf)

build(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    go build -mod=vendor -v -trimpath -buildmode=pie
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 dnsproxy "${pkgdir}/usr/bin/dnsproxy"
    install -Dm644 LICENSE "$pkgdir"/usr/share/license/dnsproxy/LICENSE
    install -Dm644 README.md "$pkgdir"/usr/share/doc/dnsproxy/README.md

    install -Dm644 "${srcdir}/dnsproxy.yaml" "$pkgdir/$_conf"
    install -Dm644 "${srcdir}/dnsproxy.service" "${pkgdir}/usr/lib/systemd/system/dnsproxy.service"
}
