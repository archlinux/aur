# $Id$
# Maintainer: Joel Jensen <yobert@gmail.com>
pkgname='remirror'
pkgver=0.0.7
pkgrel=1
pkgdesc='Caching proxy for package repositories'
arch=('x86_64')
url='https://github.com/yobert/remirror'
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=()
backup=('etc/remirror.hcl')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/yobert/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.service"
    "${pkgname}.sysusers"
    "${pkgname}.tmpfiles"
)
b2sums=(
    '904cfcce5a1709ce9d1ae2d26c25bc27a70cac03aa7f906188b30904e2adea01b15a8d01f6b46a90dbe1b635c9fa91df4709b759dd66e2faafc8bd05d7ed9115'
    '12df17796ce2fcc2507c5c47f564b087659f34dc33b96e6ebbecc96efea464192e6f957268f7cc5eee2415a38b9344d26d0dcf7f2e41f953c9b48d945b24e952'
    'bc7f14097c17c19efee356d4c837186dc97fa028022b10063401b093a8e8c02cc6e34324016ac647009cd5e10705e3e56a3d98bf525be102c3c69554949d51a4'
    'c8da876abb1b308d558db60c1818a163effe983298d3ba51b562a097e9613887466dc260817a04d6092dc18b45dbdf6dbeb5e33da81efb80e082d9bad3df94e9'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go build
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go test ./...
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Default config (shipped as the actual config; backup= protects it on upgrade)
    install -Dm0644 example.hcl "${pkgdir}/etc/${pkgname}.hcl"

    # systemd integration (use our locally maintained service, not the upstream one)
    install -Dm0644 "${srcdir}/${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm0644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
