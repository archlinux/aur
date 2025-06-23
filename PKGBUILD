# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: joelvaz0x01 <joelvaz dot whitehat at gmail dot com>
# Contributor: Dawid Weglarz <dawid.weglarz95@gmail.com>
# Contributor: candroid_man <candroid_man@protonmail.com>
# Contributor: Ada <adadonderr@gmail.com>
# Contributor: Christian Finnberg <christian@finnberg.net>
pkgname=notesnook
_pkgname=Notesnook
pkgver=3.2.2
_electronversion=34
_nodeversion=23
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
sha256sums=('4a105e64ebd6a72179225721ccb454a225905023b2ec0f2c8e28cb30b418d31d'
            '102a538ee9432310d854842a578cd3371df0431b4db617479de66aa45b5f2440'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
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
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
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
    NODE_ENV=production     npx nx build:desktop @notesnook/web
    cd "${srcdir}/${pkgname}-${pkgver}/apps/desktop"
    local electronDist="/usr/lib/electron${_electronversion}"
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=production     npm run bundle
    cp -r "${srcdir}/${pkgname}-${pkgver}/apps/web/build" "${srcdir}/${pkgname}-${pkgver}/apps/desktop"
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist} --config=electron-builder.config.js"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/apps/desktop/output/linux-"*/resources/{app,assets} "${pkgdir}/usr/lib/${pkgname}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/apps/desktop/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
