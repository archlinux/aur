# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: iFlygo
pkgname=figma-linux-git
_pkgname=Figma-linux
pkgver=0.11.3.r2.g313c270
_electronversion=27
_nodeversion=18
pkgrel=1
arch=("any")
pkgdesc="The collaborative interface design tool. Unofficial Figma desktop client for Linux"
url="https://github.com/Figma-Linux/figma-linux"
license=("GPL-2.0-only")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'libdbusmenu-gtk3'
    'libdbusmenu-glib'
    'xdg-utils'
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
)
source=(
    "${pkgname%-git}.git::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
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
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname%-git}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    if [ `curl ifconfig.co/country` = "China" ];then
        echo 'registry="https://registry.npmmirror.com/"' >> .npmrc
        echo 'electron_mirror="https://registry.npmmirror.com/-/binary/electron/"' >> .npmrc
        echo 'electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"' >> .npmrc
    else
        echo "Your network is OK."
    fi
    sed "s|--config=config/builder.json -l|--config=config/builder.json --dir|g" -i package.json
    sed 's|"output": "build/installers"|"output": "build"|g' -i config/builder.json
    npm install --no-frozen-lockfile
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/linux-"*/icons/* -t "${pkgdir}/usr/lib/${pkgname%-git}/icons"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/linux-"*/lib/*/* -t "${pkgdir}/usr/lib/${pkgname%-git}/lib"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/linux-"*/usr/lib/*/*.* -t "${pkgdir}/usr/lib/${pkgname%-git}/lib"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/linux-"*/usr/lib/*/nss/* -t "${pkgdir}/usr/lib/${pkgname%-git}/lib"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/linux-"*/swiftshader/* -t "${pkgdir}/usr/lib/${pkgname%-git}/swiftshader"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 24x24 36x36 48x48 64x64 72x72 96x96 128x128 192x192 256x256 384x384 512x512 scalable;do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/lib/icons/${_icons}."* \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}."*
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}