# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=writer
pkgname="ai-${_pkgname}"
pkgver=1.2.0
_electronversion=26
_nodeversion=20
pkgrel=10
pkgdesc="A markdown editor powered by AI (Ollama).(Use system-wide electron)"
arch=('any')
url="https://github.com/Intellicode/writer"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'ollama'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'curl'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('b7c2ac5c91b7a4a42f16b2070e72f5f2eee5a963f90b8e54a7b0ae281ec2e2bb'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname}" --exec="${pkgname} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
        echo "maxsockets=10"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    sed -i "s/components\/Header/components\/header/g" src/modules/main/Main.tsx
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install --leagcy-peer-deps
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    NODE_ENV=production     npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${_pkgname}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/logo.iconset/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    if [ ! -d "${pkgdir}/home/${USER}/Notes" ];then
        mkdir -p "${pkgdir}/home/${USER}/Notes"
    else
        exit
    fi
}