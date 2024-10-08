# Maintainer: dan <dan@digitalprivacy.diy>
pkgname="mjolnir"
pkgver="1.8.3"
pkgrel=3
pkgdesc="A moderation tool for Matrix."
arch=("any")
url="https://github.com/matrix-org/mjolnir"
license=('Apache-2.0')

depends=("nodejs")
makedepends=("yarn")
optdepends=("python-mjolnir-synapse_antispam: Mjolnir antispam module for matrix-synapse")

backup=("etc/mjolnir/config/production.yaml")

source=("https://github.com/matrix-org/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "mjolnir"
        "mjolnir.service"
        "mjolnir.sysusers"
        "mjolnir.tmpfiles")
sha256sums=("0e134ab1339b666629718a81d923410f3af31559afbe4d6dc8f895aba4ef5192"
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
