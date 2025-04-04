# Maintainer: devome <evinedeng@hotmail.com>

pkgname=flatnotes
pkgver=5.5.1
pkgrel=1
pkgdesc="A self-hosted, database-less note taking web app that utilises a flat folder of markdown files for storage."
arch=("any")
url="https://github.com/dullage/${pkgname}"
license=("MIT")
depends=("python-aiofiles" "python-cryptography" "python-fastapi" "python-jose" "python-pyotp" "python-python-multipart" "python-qrcode" "python-whoosh" "uvicorn")
makedepends=("npm")
backup=("etc/conf.d/${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.env"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('b2881cfb673546926c1684738aba4f43463015a895d4c8af3144c74894377e34'
            '59e9f26dca4d316d580b86afb09afec3f949a4debfdbd4de9fdaed4868abbb78'
            '44b35a9f08962eb6e8fd7a48a9d9213cf2119e48eb5d4766a349244d221e8a15'
            '2d62cb21e34fd41277c1b9cd8692c68cf4980fd1c3d94330f2b79ddbc4349c1a'
            'dffdf187992981de979626511fba98cbcb62453a9796ffbfbffbad295ee1e15e')

build() {
    cd "${pkgname}-${pkgver}"
    npm ci
    npm run build
    mv client/dist/index.html .
}

package() {
    install -Dm644 "${pkgname}.env"      "${pkgdir}/etc/conf.d/${pkgname}"
    install -Dm644 "${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    cd "${pkgname}-${pkgver}"
    install -Dm644 LICENSE               "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md             "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 index.html            "${pkgdir}/var/lib/${pkgname}/index.html"
    find {client/dist,server} -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/"{} \;
    ln -sf "/var/lib/${pkgname}/index.html" "${pkgdir}/usr/share/${pkgname}/client/dist/index.html"
}
