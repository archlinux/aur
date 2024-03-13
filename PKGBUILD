# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=peersky-browser
_pkgname="Peersky Browser"
pkgver=1.0.0_prerelease
_electronversion=20
pkgrel=7
pkgdesc="A minimal p2p web browser."
arch=("any")
url="https://peersky.p2plabs.xyz/"
_ghurl="https://github.com/p2plabsxyz/peersky-browser"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}-bin"
    'java-runtime'
    'nodejs'
    'python>=3'
    'xdg-utils'
)
makedepends=(
    'npm'
    'gendesk'
    'git'
)
options=('!strip')
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=${pkgver//_/-}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@|ELECTRON_DISABLE_SECURITY_WARNINGS=true|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q --categories="Network" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname%}.git"
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
    sed "s|build --publish never|build --dir|g" -i package.json
    echo "process.env['ELECTRON_DISABLE_SECURITY_WARNINGS'] = 'true';" >> src/main.js
    npm install --force
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/build/linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}