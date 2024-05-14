# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=horen
pkgver=0.9.5
_subver=perfect-lyric
_electronversion=28
pkgrel=2
pkgdesc="A music player by Electron"
arch=('any')
url="https://github.com/horenjs/horen"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'curl'
    'npm'
    'pnpm'
    'nodejs'
    'icoutils'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_subver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('2387283f26d2f154f2d8a62767f7ee167eb6a8cb75770bc5d86da9ea34566067'
            '41b6d61dffef064762b3eec3dfeca7a3e1f57cbcb6dce9a6940c06797a0eae9d')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --pkgname="${pkgname}" --categories="AudioVideo" --name="${pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${_subver}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    icotool -x preview/"${pkgname}.ico" -o preview/"${pkgname}.png"
    sed "s|${pkgname}.ico|${pkgname}.png|g" -i forge.config.js
    sed "s|process.env.APPDATA|'/home/${USER}'|g" -i app/main/src/constant.ts
    pnpm install
    pnpm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${_subver}/out/${pkgname}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${_subver}/preview/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${_subver}/out/${pkgname}-linux-"*/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}