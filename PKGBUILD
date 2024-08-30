# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributer: candroid_man <candroid_man@protonmail.com>
# Contributer: Ada <adadonderr@gmail.com>
# Contributor: Christian Finnberg <christian@finnberg.net>
pkgname=notesnook-git
_pkgname=Notesnook
pkgver=3.0.16.r1.g19ed753
_electronversion=29
_nodeversion=20
pkgrel=1
pkgdesc="A fully open source & end-to-end encrypted note taking alternative to Evernote.Use system-wide electron."
arch=(
    'aarch64'
    'x86_64'
)
url="https://notesnook.com/"
_ghurl="https://github.com/streetwriters/notesnook"
license=('GPL-3.0-or-later')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
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
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.desktop"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'efc8a6cea79ed0203dcbadf17632b5341952a49704f99e3ea0ddc573b06748f4'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g;s/.android//g'
}
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
        -i "${srcdir}/${pkgname%-git}.sh"
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
    cd "${srcdir}/${pkgname//-/.}"
    sed "s|npm \${|NODE_ENV=development npm \${|g" -i scripts/bootstrap.mjs
    # Install packages
    NODE_ENV=development    npm install --ignore-scripts --prefer-offline --no-audit
    NODE_ENV=production     npm run bootstrap -- --scope=web
    # Generate desktop build
    NODE_ENV=production     npx nx build:desktop @notesnook/web
    NODE_ENV=production     npm run bootstrap -- --scope=desktop
    # Build Electron wrapper
    cd "${srcdir}/${pkgname//-/.}/apps/desktop"
    sed "s|\"asar\": false,|\"asar\": true,|g;s|\"electron\": \"^29.3.1\",|\"electron\": \"${SYSTEM_ELECTRON_VERSION}\",|g" -i package.json
    NODE_ENV=production     npx nx run release --project @notesnook/desktop
    NODE_ENV=production     npx electron-builder -l --dir
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644  "${srcdir}/${pkgname//-/.}/apps/desktop/output/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/apps/desktop/output/linux-"*/resources/assets "${pkgdir}/usr/lib/${pkgname%-git}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname//-/.}/apps/desktop/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}