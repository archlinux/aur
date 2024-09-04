# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: iFlygo
pkgname=figma-linux-git
_pkgname=Figma-linux
pkgver=0.11.4.r2.gd4a3b97
_electronversion=30
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
    'libdbusmenu-gtk3'
    'libdbusmenu-glib'
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
    'curl'
)
source=(
    "${pkgname%-git}.git::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
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
        -e "s|@cfgdirname@|${pkgname%-git}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname%-git}.git"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    echo 'build_from_source=true'  >> .npmrc
    echo "cache="${srcdir}"/.npm_cache"  >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        echo 'registry=https://registry.npmmirror.com' >> .npmrc
        echo 'disturl=https://registry.npmmirror.com/-/binary/node/' >> .npmrc
        echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/' >> .npmrc
        echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/' >> .npmrc
    else
        echo "Your network is OK."
    fi
    sed -e 's|"output": "build/installers"|"output": "build"|g' -i config/builder.json
    sed -e "s|\"electron\": \"\([^\"]*\)\"|\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"|g" \
        -e "s|builder.json -l|builder.json -l --dir|g" \
        -i package.json
    NODE_ENV=development    npm install --no-frozen-lockfile
    NODE_ENV=production     npm run package
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