# Maintainer: devome <evinedeng@hotmail.com>

pkgname="n8n"
pkgver=1.45.1
pkgrel=1
pkgdesc="Free and source-available fair-code licensed workflow automation tool. Easily automate tasks across different services."
arch=('any')
url="https://github.com/${pkgname}-io/${pkgname}"
license=("custom:Sustainable Use License" "custom:n8n Enterprise License")
backup=("etc/${pkgname}/${pkgname}.env")
depends=("nodejs")
makedepends=("npm")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgname}@${pkgver}.tar.gz"
        "${pkgname}.env"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.user.service")
sha256sums=('6257b8601e5f2cfa5ec16fc8b0004b8b6bc864f6b2f4527a4794c174cb0e37f7'
            'faae87f26ac2bca25d98aa02564876742e7ed5dd4146342062196ed12d97385f'
            'e5127ceab1ad7e31cde7483bb978cd6c4cdb9402d7d44e9c74ead7ae921acfe4'
            '6139ae944272cdc50715fd82a3c062ebf1b7fd73f7f789cba0d27f5a0436c688'
            'faa4145ec8723700c5f8f75ae2dd3d78c931597b67e200050b55fec9d73c3f06'
            '03cb79cddc04a0303be6d60ba2e7801106b6d4405d33953a2c508c5825c66a7c')
options=(!strip !debug)

package() {
    npm install --ignore-scripts -g --prefix="${pkgdir}/usr" "${pkgname}@${pkgver}"
    npm rebuild --prefix="${pkgdir}/usr/lib/node_modules/${pkgname}" sqlite3
    find "${pkgdir}/usr/lib/node_modules/${pkgname}" -type f -name "*.ts" -o -name "*.js.map" -o -name "*.vue" | xargs rm -f

    install -Dm644 "${pkgname}.env"          "${pkgdir}/etc/${pkgname}/${pkgname}.env"
    install -Dm644 "${pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

    cd "${pkgname}-${pkgname}-${pkgver}"
    install -Dm644 LICENSE.md                "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 LICENSE_EE.md             "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-EE"
    install -Dm644 {README,CHANGELOG}.md  -t "${pkgdir}/usr/share/doc/${pkgname}"
}
