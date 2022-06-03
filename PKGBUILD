# Maintainer: div72 <aur@div72.xyz>
pkgname="mjolnir"
pkgver="1.4.2"
pkgrel=4
pkgdesc="A moderation tool for Matrix."
arch=("any")
url="https://github.com/matrix-org/mjolnir"
license=('Apache')

depends=("nodejs")
makedepends=("yarn")
optdepends=("pantalaimon: encrypted room support")

backup=("etc/mjolnir/config/production.yaml")

source=("https://github.com/matrix-org/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "mjolnir"
        "mjolnir.service"
        "mjolnir.sysusers"
        "mjolnir.tmpfiles")
sha256sums=("41e801dde7ea889901a45decdb3669e619316571c2ce2a69b438f603bac610d9"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn install
    yarn build
}

package() {
    mkdir -p "${pkgdir}/opt/"
    cp -r "${srcdir}/${pkgname}-${pkgver}/" "${pkgdir}/opt/"
    mv "${pkgdir}/opt/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
    chmod -R 755 "${pkgdir}/opt/${pkgname}/"
    install -Dm755 "${srcdir}/mjolnir" "${pkgdir}/usr/bin/mjolnir"
    install -Dm770 "${srcdir}/${pkgname}-${pkgver}/config/default.yaml" "${pkgdir}/etc/mjolnir/config/production.yaml"
    install -Dm644 "${srcdir}/mjolnir.service" "${pkgdir}/usr/lib/systemd/system/mjolnir.service"
    install -Dm644 "${srcdir}/mjolnir.sysusers" "${pkgdir}/usr/lib/sysusers.d/mjolnir.conf"
    install -Dm644 "${srcdir}/mjolnir.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/mjolnir.conf"

    chown -R root:root "${pkgdir}"
}
