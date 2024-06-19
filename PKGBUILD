# Maintainer: devome <evinedeng@hotmail.com>

pkgname="n8n"
pkgver=1.45.1
pkgrel=1
pkgdesc="Free and source-available fair-code licensed workflow automation tool. Easily automate tasks across different services."
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/${pkgname}-io/${pkgname}"
license=("custom:Sustainable Use License")
backup=("etc/default/${pkgname}")
depends=("nodejs")
makedepends=("npm")
source=("${pkgname}.env"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.user.service")
sha256sums=('faae87f26ac2bca25d98aa02564876742e7ed5dd4146342062196ed12d97385f'
            '9356600848545416c490e3d74aff8494946afca187dd409a9f768db7a364f9da'
            '6139ae944272cdc50715fd82a3c062ebf1b7fd73f7f789cba0d27f5a0436c688'
            'faa4145ec8723700c5f8f75ae2dd3d78c931597b67e200050b55fec9d73c3f06'
            '03cb79cddc04a0303be6d60ba2e7801106b6d4405d33953a2c508c5825c66a7c')
options=(!strip !debug)

package() {
    install -Dm644 "${pkgname}.env"          "${pkgdir}/etc/default/${pkgname}"
    install -Dm644 "${pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

    npm install --cache "npm-cache" --global --ignore-scripts --prefix="${pkgdir}/usr" "${pkgname}@${pkgver}"
    npm rebuild --prefix="${pkgdir}/usr/lib/node_modules/${pkgname}" sqlite3

    find "${pkgdir}/usr/lib/node_modules/${pkgname}" -type f -name "*.ts" -o -name "*.js.map" -o -name "*.vue" | xargs rm -f

    install -dm755 "${pkgdir}/usr/share/"{licenses,doc}"/${pkgname}"
    ln -s "/usr/lib/node_modules/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -s "/usr/lib/node_modules/${pkgname}/README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
