# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname='strichliste'
pkgdesc="strichliste is a tool to replace a tally sheet inside a hackerspace, this module is the api for the strichliste"
pkgver=1.7.0
pkgrel=3
arch=('any')
url="https://github.com/hackerspace-bootstrap/strichliste"
license=('MIT')
depends=('nodejs' 'sqlite')
makedepends=('npm' 'python2' 'node-gyp')
optdepends=('strichliste-web: frontend')
backup=('etc/strichliste.js')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hackerspace-bootstrap/${pkgname}/archive/v${pkgver}.tar.gz"
        "strichliste.service"
        "strichliste.sysusers"
        "strichliste-tmpfile.conf"
        "strichliste.sh")
sha512sums=('16b7fecced67e6ce4e3a88bd13c37cbc924225e7ac355642285b91724e82ed67ce335a4a5bc6c9c16c70c760247cd21bcd79b11e308ef50ac9db12b83cfd6286'
            '67f6448fec34909865077e97fc73c66e7903517733704f048568ff86022fb326690b9701b929e4d40dea7cecef288be395cc3d093d21118c57401f1ce66ba25c'
            '96d76ad5fa7fae5859c6e54f45542692d1a8c8e91303b791048f64c5bb8cf46f59b3011b144afd6d33e7cc6b9726172d25821ba0b2806b2e62538a498c05626e'
            '53e69b8d60c51440d2d1e753d45777e607dd474d71248bc532a0bbf7bba24a55dee8b991300fe171636817320da2785af91c0b7764240bbf41f224b799cc049f'
            'e0d3104c63d6c477ec2ddb1e3de876c9ae068768f5d39cf9268772318766ee1737def2b60163f2c23ecb9a8cf7f19f7ef3655f21467d6efdeaa7d3c3fe7482ac')
validpgpkeys=('') # TODO https://github.com/hackerspace-bootstrap/strichliste/issues/277

prepare()
{
    cd "${srcdir}"

    # Use newer sqlite version and repackage tar file
    sed -i 's/"sqlite3":.*/"sqlite3": "^4.0.0",/' "${pkgname}-${pkgver}/package.json"
    tar -zcf "${pkgname}-${pkgver}_new.tar.gz" "${pkgname}-${pkgver}"
}

package() {
    install -Dm644 strichliste.service "${pkgdir}/usr/lib/systemd/system/strichliste.service"
    install -Dm644 strichliste.sysusers "${pkgdir}/usr/lib/sysusers.d/strichliste.conf"
    install -Dm644 strichliste-tmpfile.conf "${pkgdir}/usr/lib/tmpfiles.d/strichliste.conf"
    install -Dm755 strichliste.sh  "${pkgdir}/usr/bin/strichliste"

    # Fix usage of python2 for manual recompilation
    PYTHON=/usr/bin/python2.7
    ln -s $PYTHON python
    export PATH=$(pwd):$PATH

    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install --production -g --user root --prefix "${pkgdir}"/usr "${srcdir}/${pkgname}-${pkgver}_new.tar.gz"
    rm -rf "${pkgdir}"/usr/etc

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../../lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Copy default config to /etc
    install -Dm644 configuration/default.js "${pkgdir}/etc/strichliste.js"

    # Fix ownership issue
    chown root:root "${pkgdir}"/usr/lib/node_modules/strichliste/node_modules/sqlite3/lib/binding/node-v??-linux-x64/node_sqlite3.node
    rm -rf "${pkgdir}/usr/lib/node_modules/strichliste/node_modules/sqlite3/build"

    # Fix npm derp
    find "${pkgdir}/usr" -type d -exec chmod 755 '{}' +
}
