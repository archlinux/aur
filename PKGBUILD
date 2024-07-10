# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=opencomic
_pkgname=OpenComic
pkgver=1.2.0
_electronversion=25
pkgrel=2
pkgdesc="Comic and Manga reader, written with Node.js and using Electron"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/ollm/OpenComic"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(    
    "electron${_electronversion}"
    'java-runtime'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs'
    'git'
    'curl'
    'gcc'
    'cmake'
)
source=(
    "${pkgname}.git::git+${url}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('ce5f633ca47f032298e782cc7933331cff9704edfc8b9c5900b8c38bd8c7104f'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Graphics" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
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
    NODE_ENV=development npm install
    NODE_ENV=production npm run prebuild
    NODE_ENV=production npx electron-builder build -l --dir
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/dist/linux-"*/resources/{app.asar.unpacked,app-update.yml} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/images/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}