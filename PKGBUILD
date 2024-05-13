# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=datefile
_pkgname=DateFile
_appname=DateFIle
pkgver=0.1.0
_electronversion=25
pkgrel=8
pkgdesc="Index files in a directory using the date of another file as a filter"
arch=('any')
url="https://github.com/kna40/DateFile"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'curl'
    'npm'
    'nodejs'
    'gendesk'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('2b6fe8fbfd9531233f43123cb962544725daf5a3055070ea32e4d7b923d560d3'
            '41b6d61dffef064762b3eec3dfeca7a3e1f57cbcb6dce9a6940c06797a0eae9d')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_appname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q --pkgname="${pkgname}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    sed "s|--arch=x64 ||g;s|.\/.bin|.\/release|g;s|DateFIle|${_pkgname}|g" -i package.json
    npm install
    npm run build-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/release/${_pkgname}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/release/${_pkgname}-linux-"*/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}