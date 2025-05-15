# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Lucas Malandrino <lucas.malandrino@gmail.com>
# Contributor & author of the original software: Gabriel Saillard <gabriel@saillard.dev>
pkgname=edex-ui
_pkgname=eDEX-UI
pkgver=2.2.8
_electronversion=12
_nodeversion=14
pkgrel=3
pkgdesc="A cross-platform, customizable science fiction terminal emulator with advanced monitoring & touchscreen support.(Use system-wide electron)"
arch=('any')
url='https://github.com/GitSquared/edex-ui'
license=('GPL-3.0-only')
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'nvm'
    'npm'
    'python2'
    'rsync'
    'git'
    'curl'
    'gendesk'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('248e3ef1a7823b99e1860979a45ccf0702e60d58dfdfd53701c18916ac90d3ca'
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
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="System;Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export PYTHON="/usr/bin/python2"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p prebuild-src
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
        cp .npmrc prebuild-src
        sed -i -e "
            s/github.com/github.moeyy.xyz\/https:\/\/github.com/g
            /danklammer/d
        " .gitmodules
        echo "	url = https://github.moeyy.xyz/https://github.com/danklammer/bytesize-icons.git" >> .gitmodules
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    git submodule update --depth=1 --init --recursive
    NODE_ENV=development    npm install  --legacy-peer-deps
    rsync -a --info=progress2 src/ prebuild-src --exclude node_modules
    NODE_ENV=development    npx node prebuild-minify.js
    cd "${srcdir}/${pkgname}-${pkgver}/prebuild-src"
    NODE_ENV=development    npm install --legacy-peer-deps
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     npx electron-builder --linux dir -c.electronDist="${electronDist}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/media/linuxIcons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}