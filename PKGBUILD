# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=cookiecloud-api
pkgname="${_pkgname}-git"
pkgver=20250820.230645
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
            '4499428921e978950ad6d0e75ce4c7f4e514b7102a5afeb30de850a0b2a76089'
            '80916b8d9f6cf7fa5061212bb0158531d8503b6c608ab4831678347e5a64b826'
            '50e480b690181004c3cfc20724a6d9b18af6d40d739d825b06d4e56711417ff7'
            '081d3e124f64fd05c1af79680b1fb5776096e6411b69c47349422e57f91b0710')

prepare() {
    cd "${_pkgname}/api"
    sed -e '1i #!/usr/bin/node\n' \
        -e "s|^const data_dir = .*|const data_dir = process\.env\.DATA_DIR \|\| '/var/lib/${_pkgname}';|" \
        -i app.js
    sed -e "s|^const logDir = .*|const logDir = process\.env\.LOG_DIR \|\| '/var/log/${_pkgname}';|" \
        -i utils/logger.js
}

pkgver() {
    cd "${_pkgname}"
    echo "$(git log -1 --format="%cd" --date='format:%Y%m%d.%H%M%S' -- api)"
}

build() {
    cd "${_pkgname}/api"
    yarn install --production
}

package() {
    install -Dm644 "${_pkgname}.conf"     "${pkgdir}/etc/conf.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    cd "${_pkgname}"
    install -Dm644 *.md                -t "${pkgdir}/usr/share/doc/${_pkgname}"

    cd api
    find . -type f ! -path './.*' ! -path './node_modules/*' -exec \
        install -Dm644 {}                 "${pkgdir}/usr/lib/${_pkgname}/"{} \;
    chmod 755                             "${pkgdir}/usr/lib/${_pkgname}/app.js"
    cp -r node_modules                    "${pkgdir}/usr/lib/${_pkgname}"
    install -dm755                        "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgname}/app.js"   "${pkgdir}/usr/bin/${_pkgname}"
}
