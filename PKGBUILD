# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sunbible
_pkgname=SunBible
pkgver=2.0.001_beta
_electronversion=23
pkgrel=7
pkgdesc="Bible Desktop App"
arch=('any')
url="https://sunbible-dev.github.io/SunBible/"
_ghurl="https://github.com/SunBible-dev/SunBible"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'yarn'
    'npm'
    'nodejs'
    'gendesk'
    'curl'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/${pkgver//_/-}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('20f6415de9e17d2dc39c7c61b75d1e4c0b672e538b351433bb616284fbcb074f'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    npm install
    npm run pack
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}