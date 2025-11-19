# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flyenv-bin
_pkgname=FlyEnv
pkgver=4.11.0
_electronversion=35
pkgrel=1
pkgdesc="All-In-One Full-Stack Environment Management Tool.Help developers quickly set up a local development environment.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.flyenv.com/"
_ghurl="https://github.com/xpf0000/FlyEnv"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    '7zip'
    'xsel'
)
optdepends=(
    'ollala'
    'apache'
    'caddy'
    'consul'
    'nginx'
    'tomcat10'
    'bun'
    'deno'
    'erlang'
    'go'
    'jdk-openjdk'
    'nodejs'
    'perl'
    'php'
    'python'
    'ruby'
    'rust'
    'mariadb'
    'mysql'
    'mongodb'
    'postgresql'
    'etcd'
    'memcached'
    'rabbitmq'
    'redis'
    'mailpit'
    'dnsmasq'
    'bind'
    'pure-ftpd'
    'minio'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/xpf0000/PhpWebStudy/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x64.rpm")
sha256sums=('01d77fe9ffb39b0a9507ca8d1cae189f56efd625078c3b13b59ce7aae42a4f7d'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('6762f1c1a9acd158cdb4940bc8cff58d8af57ed9ddccc7d9224c38fd012e7a93')
sha256sums_x86_64=('6d2f3419dec2f89e700693d37aa417ba5fdbccd9456c505e45e182555cc8bb74')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    ln -sf "/usr/bin/xsel" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/clipboardy/fallbacks/linux/xsel"
    case "${CARCH}" in
        'aarch64')
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/7zip-bin/"{linux/{arm,ia32,x64},mac}
            ln -sf "/usr/bin/7za" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/7zip-bin/linux/arm64/7za"
            ;;
        'x86_64')
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/7zip-bin/"{linux/{arm,arm64,ia32},mac}
            ln -sf "/usr/bin/7za" "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/7zip-bin/linux/x64/7za"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/"{app.asar.unpacked,helper} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
