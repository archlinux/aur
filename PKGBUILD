# Maintainer: tblFlip <root@tblflip.de>
# Contributor: dan <dan@digitalprivacy.diy>

pkgname="mjolnir"
pkgver="1.11.0"
pkgrel=1
pkgdesc="A moderation tool for Matrix."
arch=("x86_64")
url="https://github.com/matrix-org/mjolnir"
license=('Apache-2.0')

depends=("nodejs")
makedepends=("yarn")
optdepends=("python-mjolnir-synapse_antispam: Mjolnir antispam module for matrix-synapse")

backup=("etc/mjolnir/config/production.yaml")

source=(
    "https://github.com/matrix-org/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "mjolnir"
    "mjolnir.service"
    "mjolnir.sysusers"
    "mjolnir.tmpfiles"
)

sha256sums=(
	"dfe7e46f451836d919cab5ac08a2e3cabb0c6fc16ac336590b1f9e0963fe6603"
	"d7d5f76207ea5617872c8651787a9aad212c1c3abb32a47bb00a6476c9383a4c"
	"56bac587793ab6c2c021056bb76c97746b22cdf3ce84b7a2b26fc23266f7bd40"
	"9a5c0887a776585360c10a036f3ec6a264e46d0a8626852f694450ad8b266c86"
	"e5c15c1eaa5ae2167350ce6923392070239061b073bb77ea11531356902b34f7"
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn install
    yarn build
}

package() {
    mkdir -p "${pkgdir}/opt/"
    cp -r "${srcdir}/${pkgname}-${pkgver}/" "${pkgdir}/opt/${pkgname}"
    chmod -R 755 "${pkgdir}/opt/${pkgname}/"
    chown -R root:root "${pkgdir}/opt/${pkgname}"

    install -Dm755 "${srcdir}/mjolnir" "${pkgdir}/usr/bin/mjolnir"
    install -Dm770 "${srcdir}/${pkgname}-${pkgver}/config/default.yaml" "${pkgdir}/etc/mjolnir/config/production.yaml"
    install -Dm644 "${srcdir}/mjolnir.service" "${pkgdir}/usr/lib/systemd/system/mjolnir.service"
    install -Dm644 "${srcdir}/mjolnir.sysusers" "${pkgdir}/usr/lib/sysusers.d/mjolnir.conf"
    install -Dm644 "${srcdir}/mjolnir.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/mjolnir.conf"
}
