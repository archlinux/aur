# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: joelvaz0x01 <joelvaz dot whitehat at gmail dot com>
# Contributor: Dawid Weglarz <dawid.weglarz95@gmail.com>
# Contributor: candroid_man <candroid_man@protonmail.com>
# Contributor: Ada <adadonderr@gmail.com>
# Contributor: Christian Finnberg <christian@finnberg.net>
pkgname=notesnook
_pkgname=Notesnook
pkgver=3.0.16
_electronversion=29
_nodeversion=20
pkgrel=1
pkgdesc="A fully open source & end-to-end encrypted note taking alternative to Evernote"
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
    'nodejs'
)
makedepends=(
    'nvm'
    'npm'
    'git'
    'zip'
    'cmake'
    'gcc'
    'curl'
    'yarn'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.desktop"
    "${pkgname}.sh"
)
sha256sums=('bb67c1e4be25ff8d70b7422704bdf4919aa8b78db65241719c4af2dd40e74f49'
            '102a538ee9432310d854842a578cd3371df0431b4db617479de66aa45b5f2440'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
        echo '[url "https://github.moeyy.xyz/https://github.com/"]' >> .gitconfig
        echo '    insteadof = https://github.com/' >> .gitconfig
    else
        echo "Your network is OK."
    fi
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed "s|npm \${|NODE_ENV=development npm \${|g" -i scripts/bootstrap.mjs
    # Install packages
    NODE_ENV=development    npm install --ignore-scripts --prefer-offline --no-audit
    NODE_ENV=production     npm run bootstrap -- --scope=web
    # Generate desktop build
    NODE_ENV=production     npx nx build:desktop @notesnook/web
    NODE_ENV=production     npm run bootstrap -- --scope=desktop
    # Build Electron wrapper
    cd "${srcdir}/${pkgname}-${pkgver}/apps/desktop"
    sed "s|\"asar\": false,|\"asar\": true,|g;s|\"electron\": \"^29.3.1\",|\"electron\": \"${SYSTEM_ELECTRON_VERSION}\",|g" -i package.json
    NODE_ENV=production     npx nx run release --project @notesnook/desktop
    NODE_ENV=production     npx electron-builder -l --dir
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/apps/desktop/output/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/apps/desktop/output/linux-"*/resources/assets "${pkgdir}/usr/lib/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/apps/desktop/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}