# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Kim Taehwan <ktcar214@ktcar214.com>
# Contributor: Edward Pacman <edward@edward-p.xyz>

_projectname=dnsproxy
pkgname=dnsproxy-adguard
pkgver=0.51.0
pkgrel=3
pkgdesc="Simple DNS proxy with DoH, DoT, and DNSCrypt support by AdguardTeam"
arch=('x86_64' 'aarch64')
url="https://github.com/AdguardTeam/dnsproxy"
license=('Apache')
source=("dnsproxy-adguard.service"
        "dnsproxy-adguard"
        "${_projectname}-${pkgver}.tar.gz::https://github.com/AdguardTeam/dnsproxy/archive/v${pkgver}.tar.gz")
makedepends=("go" "git")
backup=(etc/conf.d/dnsproxy-adguard)
sha256sums=('9671d16fefb5f34741f7476ed381b307208dc189067fa8c7efab241c889275dd'
            'de2afa0883f2829a1f7487899ddc9e711913686aea1ce186a60aad022604df4b'
            '230f13bcfe48a650c0ffd0574092fd956f5fb6351c622ae869d2bd0058a539b4')

build(){
    cd "${srcdir}/${_projectname}-${pkgver}"
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
        .
}

package() {
    cd "${srcdir}/${_projectname}-${pkgver}"
    install -Dm755 dnsproxy "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/dnsproxy-adguard.service" "${pkgdir}/usr/lib/systemd/system/dnsproxy-adguard.service"
    install -Dm644 "${srcdir}/dnsproxy-adguard" "${pkgdir}/etc/conf.d/dnsproxy-adguard" 
}
