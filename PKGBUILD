# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname='strichliste'
pkgdesc="strichliste is a tool to replace a tally sheet inside a hackerspace, this module is the api for the strichliste"
pkgver=1.5.0
pkgrel=1
arch=('any')
url="https://github.com/hackerspace-bootstrap/strichliste"
license=('MIT')
depends=('nodejs' 'sqlite')
makedepends=('npm')
backup=('etc/strichliste.js')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hackerspace-bootstrap/${pkgname}/archive/v${pkgver}.tar.gz"
        "strichliste.service"
        "strichliste.sysusers"
        "strichliste-tmpfile.conf"
        "strichliste.sh")
sha512sums=('68ee8ac3a7112d0dcc61729bad4ba6348c84915e70e78859dfc5c30098792b4876ffbd8df9afdd78d7c4de9df14ca7db97d81b299ec7308b8c4f7ebaeb60343a'
            '67f6448fec34909865077e97fc73c66e7903517733704f048568ff86022fb326690b9701b929e4d40dea7cecef288be395cc3d093d21118c57401f1ce66ba25c'
            '96d76ad5fa7fae5859c6e54f45542692d1a8c8e91303b791048f64c5bb8cf46f59b3011b144afd6d33e7cc6b9726172d25821ba0b2806b2e62538a498c05626e'
            '53e69b8d60c51440d2d1e753d45777e607dd474d71248bc532a0bbf7bba24a55dee8b991300fe171636817320da2785af91c0b7764240bbf41f224b799cc049f'
            'fdcd4648882b8948b118cc18f7f1e2b2449e8972fc7dfa502b3f61546a08d3673281e5bfa2248777146995563d43ad2bbb2ad4430b5c8b24faf10bc0a0c8285b')
validpgpkeys=('') # TODO

package() {
    install -Dm644 strichliste.service "${pkgdir}/usr/lib/systemd/system/strichliste.service"
    install -Dm644 strichliste.sysusers "${pkgdir}/usr/lib/sysusers.d/strichliste.conf"
    install -Dm644 strichliste-tmpfile.conf "${pkgdir}/usr/lib/tmpfiles.d/strichliste.conf"
    install -Dm755 strichliste.sh  "${pkgdir}/usr/bin/strichliste"

    cd "${srcdir}/${pkgname}-${pkgver}"

    npm install --production -g --user root --prefix "${pkgdir}"/usr "${srcdir}/${pkgname}-${pkgver}.tar.gz"
    rm -r "${pkgdir}"/usr/etc

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../../lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Copy default config to /etc
    install -Dm644 configuration/default.js "${pkgdir}/etc/strichliste.js"

    # Fix ownership issue
    chown root:root "${pkgdir}/usr/lib/node_modules/strichliste/node_modules/sqlite3/lib/binding/node-v59-linux-x64/node_sqlite3.node"

    # Fix npm derp
    find "${pkgdir}/usr" -type d -exec chmod 755 '{}' +
}
