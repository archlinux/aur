# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=cookiecloud-api
pkgname="${_pkgname}-git"
pkgver=20240731.105904
pkgrel=1
pkgdesc="Synchronizing browser cookies and LocalStorage with a self-hosted server (API Server)"
arch=("any")
url="https://github.com/easychen/CookieCloud"
license=("GPL-3.0-or-later")
backup=("etc/conf.d/${_pkgname}.conf")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("nodejs")
makedepends=("git" "yarn")
source=("${_pkgname}::git+${url}"
        "${_pkgname}.conf"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
sha256sums=('SKIP'
            '9b717643ce5818f49b49f514e2a8dd61972dbc786b5e2c6cc498c6248ab0c85e'
            'd85c33b92f23baeca1405ca658550ae36395f27ab1d5a7c6a3d417d1f2d8e709'
            '83e56f7df7699008aa880718fd5e14b46887cdc2eda8aeef89bbd921bc2c88a0'
            '142a39525951b0aa345bdcba1b0fd743cae11ec5ab44feded48ab711d20b0f11')

pkgver() {
    cd "${_pkgname}"
    echo "$(git log -1 --format="%cd" --date='format:%Y%m%d.%H%M%S' -- api)"
}

build() {
    cd "${_pkgname}/api"
    yarn install --production
    sed -i '1i #!/usr/bin/node\n' app.js
}

package() {
    install -Dm644 "${_pkgname}.conf"     "${pkgdir}/etc/conf.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    cd "${_pkgname}"
    install -Dm644 *.md                -t "${pkgdir}/usr/share/doc/${_pkgname}"
    install -Dm644 api/*.{json,lock}   -t "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm755 api/app.js             "${pkgdir}/usr/lib/${_pkgname}/app.js"
    cp -r api/node_modules                "${pkgdir}/usr/lib/${_pkgname}"
    ln -s "/var/lib/${_pkgname}"          "${pkgdir}/usr/lib/${_pkgname}/data"
    install -dm755                        "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgname}/app.js"   "${pkgdir}/usr/bin/${_pkgname}"
}
