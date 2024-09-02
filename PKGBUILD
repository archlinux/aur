# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ffbox
_pkgname=FFBox
pkgver=4.2
_electronversion=24
_nodeversion=16
pkgrel=2
pkgdesc="An user-friendly ffmpeg GUI.一个多媒体转码百宝箱/一个 FFmpeg 的套壳"
arch=('x86_64')
url="https://github.com/ttqftech/FFBox"
license=('LicenseRef-custom')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'ffmpeg'
    'nodejs'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
    'curl'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('260ee465e30394e1fd9d42bab63994b99efc39ca342e96307a4ac7a844aecec1'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    rm -rf app release pnpm-lock.yaml
    sed "s|\^24|${SYSTEM_ELECTRON_VERSION}|g" -i package.json
    sed "s|AppImage|dir|g;s|deb|dir|g" -i electron-builder.json5
    sed "s|process.execPath, '../FFBoxService'|\"\/usr\/lib\/${pkgname}\",'FFBoxService'|g;s|process.resourcesPath|\"\/usr\/lib\/${pkgname}\"|g" \
        -i src/main/index.ts
    NODE_ENV=development    npm install
    NODE_ENV=development    npm add -D pkg
    NODE_ENV=production     npm run build:everything
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.git/release/linux-"*/FFBoxService -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/release/linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/src/renderer/public/images/icon_256_transparent.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}