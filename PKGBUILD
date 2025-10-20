# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: joelvaz0x01 <joelvaz dot whitehat at gmail dot com>
# Contributor: Dawid Weglarz <dawid.weglarz95@gmail.com>
# Contributor: candroid_man <candroid_man@protonmail.com>
# Contributor: Ada <adadonderr@gmail.com>
# Contributor: Christian Finnberg <christian@finnberg.net>
pkgname=notesnook
_pkgname=Notesnook
pkgver=3.3.2
_electronversion=37
_nodeversion=22
pkgrel=1
pkgdesc="A fully open source & end-to-end encrypted note taking alternative to Evernote.(Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://notesnook.com/"
_ghurl="https://github.com/streetwriters/notesnook"
license=('GPL-3.0-or-later')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'nvm'
    'npm'
    'zip'
    'curl'
    'yarn'
    'python-setuptools'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.desktop"
    "${pkgname}.sh"
)
sha256sums=('05f8b98b555091d2b3b1abcb2a416c3576c899dd527da088481cd740796748cc'
            '102a538ee9432310d854842a578cd3371df0431b4db617479de66aa45b5f2440'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver="$(grep '"electron":' "${srcdir}/${pkgname}-${pkgver}/apps/desktop/package.json" | cut -d'"' -f4 | tr -d '^' | cut -d. -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
    } >> .npmrc
    if [[ "$(curl -s cip.cc)" == *"中国"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
        echo apps/{desktop,web} packages/{crypto,editor,logger,streamable-fs,theme,ui,sodium,clipper} servers/theme | xargs -n 1 cp .npmrc
    fi
    _ensure_local_nvm
    sed -i "s/npm \${/NODE_ENV=development npm \${/g" scripts/bootstrap.mjs
    find apps -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname}\'/g" {} +
    NODE_ENV=development    npm install --ignore-scripts --prefer-offline --no-audit
    NODE_ENV=development    npm run bootstrap -- --scope=web
    NODE_ENV=development    npm run bootstrap -- --scope=desktop
    cd "${srcdir}/${pkgname}-${pkgver}/apps/desktop"
    NODE_ENV=development    npm install sqlite-better-trigram
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    echo y | NODE_ENV=production     npx nx build:desktop @notesnook/web
    cd "${srcdir}/${pkgname}-${pkgver}/apps/desktop"
    local electronDist="/usr/lib/electron${_electronversion}"
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=production     npm run bundle
    cp -r "${srcdir}/${pkgname}-${pkgver}/apps/web/build" "${srcdir}/${pkgname}-${pkgver}/apps/desktop"
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist} --config=electron-builder.config.js"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/apps/desktop/output/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/apps/desktop/output/linux-"*/resources/{app.asar.unpacked,assets} "${pkgdir}/usr/lib/${pkgname}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/apps/desktop/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
