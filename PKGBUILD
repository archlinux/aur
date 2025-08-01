# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yank-note
_pkgname='Yank Note'
pkgver=3.83.2
_electronversion=33
_nodeversion=20
pkgrel=1
pkgdesc="A highly extensible Markdown editor. Version control, AI completion, mind map, documents encryption, code snippet running, integrated terminal, chart embedding, HTML applets, Reveal.js, plug-in, and macro replacement.(Use system-wide electron)"
arch=('x86_64')
url="https://yank-note.com/"
_ghurl="https://github.com/purocean/yn"
license=('AGPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'java-runtime'
)
makedepends=(
    'gendesk'
    'npm'
    'yarn'
    'nvm'
    'curl'
    'git'
    'python'
)
source=(
    "${pkgname}.git::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('e7b19081f32ac375205662bf7d1b78021780d31dcf2e3e59731f68d46f5570df'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname}.git"
    sed -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${pkgname//-/.}/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/
    " -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        sed -i "/yarnpkg/d" .yarnrc
        {
            echo -e '\n'
            echo 'registry "https://registry.npmmirror.com"'
            echo 'electron_mirror "https://registry.npmmirror.com/-/binary/electron/"'
            echo 'electron_builder_binaries_mirror "https://registry.npmmirror.com/-/binary/electron-builder-binaries/"'
            echo "cacheFolder "${srcdir}"/.yarn/cache"
            echo "pluginsFolder "${srcdir}"/.yarn/plugins"
            echo "globalFolder "${srcdir}"/.yarn/global"
            echo 'useHardlinks true'
            #echo 'buildFromSource true'
            echo 'linkWorkspacePackages true'
            echo 'fetchRetries 3'
            echo 'fetchRetryTimeout 10000'
        } >> .yarnrc
        find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
        sed -i "s/github.com/ghproxy.net\/https:\/\/github.com/g" scripts/{download-pandoc.js,download-plantuml.js}
    fi
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/" package.json
    sed -i "s/icon\.icns/icon\.png/" electron-builder.json
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    NODE_ENV=development    yarn add -D "@types/tar-stream"
}
build() {
    cd "${srcdir}/${pkgname}.git"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=development    yarn run electron-rebuild
    NODE_ENV=development    yarn node scripts/download-pandoc.js
    NODE_ENV=development    yarn node scripts/download-plantuml.js
    NODE_ENV=production     yarn run build
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}" --config electron-builder.json
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/out/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}.git/out/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname}.git/src/main/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
