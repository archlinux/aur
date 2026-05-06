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
    'SKIP'
    'SKIP'
    'SKIP'
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
